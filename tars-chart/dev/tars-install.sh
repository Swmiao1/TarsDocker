

user="tars-test-2"
NS=`helm list | grep ${user} | awk '{print $1}'`
echo $NS, $user

if [ "$NS" == "" ]; then
    echo "create tars-k8s"
    kubectl create namespace $user
    helm install tars --name $user  --namespace $user --set tarsnode.replicas=2,tars.namespace=$user
else
    echo "upgrade tars-k8s"
    helm upgrade $user tars

fi
