kubectl apply -f k8s

kubectl set image deployments/client-deployment client=ethancollins/multi-client:$SHA
kubectl set image deployments/server-deployment server=ethancollins/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=ethancollins/multi-worker:$SHA