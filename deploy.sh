docker build -t ethancollins/multi-client:latest -t ethancollins/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t ethancollins/multi-server:latest -t ethancollins/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t ethancollins/multi-worker:latest -t ethancollins/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push ethancollins/multi-client:latest
docker push ethancollins/multi-client:$SHA

docker push ethancollins/multi-server:latest
docker push ethancollins/multi-server:$SHA

docker push ethancollins/multi-worker:latest
docker push ethancollins/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/client-deployment client=ethancollins/multi-client:$SHA
kubectl set image deployments/server-deployment server=ethancollins/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=ethancollins/multi-worker:$SHA