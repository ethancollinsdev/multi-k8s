docker build -t ethancollins/multi-client:latest -t ethancollins/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t ethancollins/multi-server:latest -t ethancollins/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t ethancollins/multi-worker:latest -t ethancollins/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push ethancollins/multi-client:latest
docker push ethancollins/multi-client:$SHA

docker push ethancollins/multi-server:latest
docker push ethancollins/multi-server:$SHA

docker push ethancollins/multi-worker:latest
docker push ethancollins/multi-worker:$SHA
