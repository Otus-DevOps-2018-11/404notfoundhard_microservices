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

