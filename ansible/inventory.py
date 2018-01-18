#!/usr/bin/env python

'''
Example custom dynamic inventory script for Ansible, in Python.
'''

import os
import sys
import argparse
import googleapiclient.discovery

try:
    import json
except ImportError:
    import simplejson as json

class ExampleInventory(object):

    def __init__(self):
        self.inventory = {}
        self.read_cli_args()

        # Called with `--list`.
        if self.args.list:
            self.inventory = self.get_inventory()
        # Called with `--host [hostname]`.
        elif self.args.host:
            # Not implemented, since we return _meta info `--list`.
            self.inventory = self.empty_inventory()
        # If no groups or vars are present, return an empty inventory.
        else:
            self.inventory = self.empty_inventory()

        print json.dumps(self.inventory);

    def get_inventory(self):
        inv = {}
        compute = googleapiclient.discovery.build('compute', 'v1')
        result = compute.instances().list(project="infra-189012", zone="europe-west1-b").execute()
        items = result['items']
        for item in items:
            if "app" in item['name']:
                inv["app"] = [item['networkInterfaces'][0]['accessConfigs'][0]['natIP']]
            elif "db" in item['name']:
                inv["db"] = [item['networkInterfaces'][0]['accessConfigs'][0]['natIP']]
            else:
                raise Exception("app or db instance  not found")
        return inv

    # Empty inventory for testing.
    def empty_inventory(self):
        return {'_meta': {'hostvars': {}}}

    # Read the command line args passed to the script.
    def read_cli_args(self):
        parser = argparse.ArgumentParser()
        parser.add_argument('--list', action = 'store_true')
        parser.add_argument('--host', action = 'store')
        self.args = parser.parse_args()

# Get the inventory.
ExampleInventory()
