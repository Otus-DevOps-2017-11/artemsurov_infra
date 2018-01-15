# artemsurov_infra
# HomeWork 05
## Дополнительное задание:
### подключение в одну строчку:
Прием через ключик -J у меня не сработал, так как в cygwin в ssh его нет :(
Зато получилось вот так:
+ ssh -o ProxyCommand="ssh -W %h:%p appuser@35.205.217.134" appuser@10.132.0.3

Правда, мне не совсем понятно, как она работает. Если у вас будет возможность поделиться ссылками или объяснить, что имеенно происходит в процесссе подключениия, буду признателен :)

### Подключение из консоли при помощи команды вида ssh internalhost
В папке .ssh создаем файл config и в него сохроняем:
```
Host internalhost
User appuser
ProxyCommand ssh -W %h:%p appuser@35.205.217.134
HostName 10.132.0.3
```

## Данные для подключения
```
Хост bastion, IP: 35.205.217.134, внутр. IP: 10.132.0.2
Хост: someinternalhost, внутр. IP: 10.132.0.3
```
# HomeWork 06


Команда для создания инстанса с запуском startup-script:
```
gcloud compute instances create reddit-app2  --boot-disk-size=10GB \
                        --image-family ubuntu-1604-lts --image-project=ubuntu-os-cloud \
                        --machine-type=g1-small --tags puma-server --restart-on-failure \
                        --scopes storage-ro \
                        --metadata startup-script-url=gs://scripts-for-otus/startup_script.sh
```

Команда для создания правила в firewall:
+ gcloud compute firewall-rules create default-puma-server --allow=tcp:9292

# HomeWork 07

1. Были созданы переменные:
"""
"variables":{
    "project_id": null,
    "image_f": null,
    "machine_type": "f1-micro"
  }
"""

А также был создан variables.json.example с примером
заполнения

2.А также были иследованы и описаны другие опции builder для GCP
"""
{
    "image_description": "Image with ruby and mongodb",
    "disk_size": 10,
    "disk_type": "pd-standard",
    "network": "default",
    "tags":["puma-server"]
}
"""
