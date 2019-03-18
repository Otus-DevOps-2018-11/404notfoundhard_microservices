docker kill $(docker ps -q)
docker run -d --network=reddit --network-alias=post_db --network-alias=comment_db -v reddit:/data/db mongo:latest
docker run -d --network=reddit --network-alias=post insecuritystone/post:1.0
docker run -d --network=reddit --network-alias=comment insecuritystone/comment:1.0
docker run -d --network=reddit -p 9292:9292 insecuritystone/ui:2.4