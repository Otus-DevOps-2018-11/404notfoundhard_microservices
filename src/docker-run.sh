docker network create reddit
docker run -d --network=reddit --network-alias=host_post_db --network-alias=host_db mongo:latest
docker run -d --network=reddit --network-alias=host_post insecuritystone/post:1.0
docker run -d --network=reddit --network-alias=host_comment insecuritystone/comment:1.0
docker run -d --network=reddit -p 9292:9292 insecuritystone/ui:1.0
