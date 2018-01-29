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

#HomeWork 08 

1. Была определена input переменная, в файле variables.tf, для приватного ключа - private_key 

2. Определенв input переменная для задания зоны в ресурсе
"google_compute_instance" "app":
        """
        variable zone {
          description = "Resource zone"
          default     = "europe-west1-b"
        }
        """
3. Отфарматированно с помощью terraform fmt

4. А также создан terraform.tfvars.example, в котором
были указаны переменные для образца.

# HomeWork 09
Было изучено:
 + импорт существующего состояния gcp в terraform state, с помощью terraform import
 + неявные зависимости через переменные в других ресурах
 + создание модулей и их параметризация

Было сделанно:
 + модуль vpc и проверенна параметризация ssh firewall-a
 + разбиение проекта на stage и prod

А также было выполненно первое задание со звездочкой.
После переноса state файла в bucket gcp, выполнил одновременно apply и destroy, получил такой лок:
"""
Error: Error loading state: writing "gs://terraform-state-infra-189012/terraform/state/default.tflock" failed: googleapi: Error 412: Precondition Failed, conditionNot

Met
Lock Info:
  ID:        e4ba92bc-d13d-3684-6396-237917cb6ec5
  Path:
  Operation: OperationTypeApply
  Who:       artem@artem-Inspiron-13-5378
  Version:   0.11.1
  Created:   2018-01-14 17:50:13.420102629 +0000 UTC
  Info:
"""
# HomeWork 10
Был настроен Ansible и созданы config файлы, а также три inventory файла в py, yml и ini формате.

# HomeWork 11
Выполнена самостоятельная работа и задание со зведочокой.
В самостоятельной работе были созданы Ansible playbooks для Packer
В задании со звездочкой, с помошью питоновкой либы для GCP, была реализована возможность динамического получения ip адресов инстансов. 

# HomeWork 12
Выполнена самостоятельная работа и  задание с одной звездочкой.
В самостоятельной работе были выполнены настройки для роли jdauphant.nginx
В задании со зведочкой, в динамический инвентори, была добавлена host var и проверка на принадлежность окружению stage или prod

# HomeWork 13
Выаолнена самостоятельная работа
В самомстоятельной работе была изучена работа Vagranta с провижинером Ansible,
протестированны роли с помощью Molecule, и немного изменены шаблоны Packer app.json и db.json для запуска ролей Ansible