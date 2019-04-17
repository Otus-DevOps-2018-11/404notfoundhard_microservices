# 404notfoundhard_microservices 
[![Build Status](https://travis-ci.com/Otus-DevOps-2018-11/404notfoundhard_microservices.svg?branch=master)](https://travis-ci.com/Otus-DevOps-2018-11/404notfoundhard_microservices)

404notfoundhard microservices repository

## HW-14
Запуск контейнеров с другими сетевыми алиасами:

```
docker network create reddit
docker run -d --network=reddit --network-alias=post_db_host --network-alias=host_db mongo:latest
docker run -d --network=reddit --network-alias=post_host --env POST_DATABASE_HOST=post_db_host insecuritystone/post:1.0
docker run -d --network=reddit --network-alias=comment_host --env COMMENT_DATABASE_HOST=host_db insecuritystone/comment:1.0
docker run -d --network=reddit -p 9292:9292 --env POST_SERVICE_HOST=post_host --env COMMENT_SERVICE_HOST=comment_host insecuritystone/ui:1.0
```
Уменьшение образа для контейнра:
```
/home/notfound/1OTUS/404notfoundhard_microservices/src/ui/Dockerfile.1 - первый вариант 227MB
/home/notfound/1OTUS/404notfoundhard_microservices/src/ui/Dockerfile - второй вариант 225MB
```

## HW-15
Q1: Узнайте как образуется базовое имя проекта.\
A1: Базовое имя образовывается от директории в котором находится файл docker-compose.yml

Q2: Можноли его задать? Если можно то как?\
A2: Можно, с помощью ключа "-p" или с помощью переменной окружения "COMPOSE_PROJECT_NAME"

## HW-16 
### Create docker registry:
```
# add simple htpasswd authorization:
docker run --rm --entrypoint htpasswd registry:2 -Bbn user pass > htpasswd
keys:
-B - Force bcrypt encryption of the password(very secure)
-b - use password from cmd
-n - use stdout
```
[create own docker registry with gitlab-runner and gitlab](gitlab/docker-compose.yml)

### slack notification:
https://devops-team-otus.slack.com/messages/CEZPYR6PJ/apps/B7Z08QMLK/


## HW-17
Q1: В Docker в экспериментальном режиме реализована отдача метрик в  
формате Prometheus. Добавьте сбор этих метрик в Prometheus. Сравните  
количество метрик с Cadvisor.  
A1: Очень сырая фича от докера, например метрика "container_cpu_load_average_10s"  
всегда показывает значение 0.  
Как я понимаю нельзя сравнивать cadvisor и метрики докера, в cadvisor реализованы метрики переферии,  
а в docker метриках упор сделан на прикладной информации.  
Правда мне пока не понятно зачем нам мониторить количество запущеных контейнеров,  действий с сетью(создание,примонтирование к контейнеру и тд), количеством созданых образов и тд.

Q2: Для сбора метрик с Docker демона также можно использовать Telegraf от
InfluxDB.  Добавьте сбор этих метрик в Prometheus. Сравните количество
метрик с Cadvisor  
monitoring/grafana/dashboards/Docker Engine Metrics.json

A2: Telegraf классная штука, очень много настроек, подключил сбор метрик с mongodb, показал гораздно больше чем mongodb_exporter. Метрик по докер контейнерам на любой вкус и цвет, очень много, !возможно даже избыточно!  
В конфиге можно организовать сбор метрик с разных СУБД, IaaS(GCE,AWS,Azure) как принимать метрики так и передовать в IaaS и еще куча всего.  
monitoring/grafana/dashboards/Docker telegraf-1553112054885_custom.json
