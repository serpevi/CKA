#Swap must be deisable
swappoff -a

#Add repository gpg key
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-ket add -

#Add kubernetes repository
sudo bash -c 'cat <<EOF>/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF'

#Update the packages
sudo apt-get update

#using apt-cache to inspect version available
apt-cache policiy kubectl | head -n 20
apt-cache policiy docker.io | head -n 20

#Install packages
sudo apt-get install -y docker.io kubectl kubelet kubeadm

#this node is going to be the master, so we mark so that the packages wont be updated with apt
sudo apt-mark hold docker.io kubelet kubeadm kubectl

#Check the status of the packages which we just installed
sudo systemctl status docker.service
sudo systemctl status kubelet.service

#Ensure either kubelet and docker are set to start
sudo systemctl enable kubelet.service
sudo systemctl enable docker.service

