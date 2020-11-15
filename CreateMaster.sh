#Only the master
wget https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
wget https://docs.projectcalico.org/v3.3/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml

#init our kubernetes cluster
sudo kubeadm init --pod-network-cidr=192.168.0.0/16

#Set up ccount on the master to have access to the API server
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

#Dowload yaml file for our pod network
kubectl apply -f rbac-kdd.yaml
kubectl apply -f calico.yaml
