echo install ruby
apt update
apt install -y ruby-full ruby-bundler build-essential
ruby -v
bundler -v

echo install mongo
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
bash -c 'echo "deb http://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list'
apt update
apt install -y mongodb-org
systemctl start mongod
systemctl enable mongod
systemctl status mongod

echo deploy
  git clone https://github.com/Otus-DevOps-2017-11/reddit.git
cd reddit && bundle install
puma -d
ps aux | grep puma
echo SUCCESS!
