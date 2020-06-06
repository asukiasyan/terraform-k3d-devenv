# WIP: Terraform K3D DevEnv
----------------------------------


This repository contains full Development Environment setup. It intended to provide full working environment for devs to test their code locally. 
All applications are separated in Terraform modules. 

K3D is used as Kubernetes cluster, but applications can run also under minikube




Needed software to start with:

1. [k3d](https://github.com/rancher/k3d)
2. [terraform](https://www.terraform.io/downloads.html)
3. [helmv2](https://github.com/helm/helm)
3. [ansible-vault](https://docs.ansible.com/ansible/latest/user_guide/vault.html)
4. [go-task](https://github.com/go-task/task)



Usage:


``` 
brew install k3d
k3d create --name development --api-port 6551 --publish 8080:8080 --publish 8081:8081 --publish 8082:80
```

Note: publish as many ports as many applications you are going to deploy on your cluster. --publish option publishing given ports outside of docker containers, and allowing to access applications trough local browser

```
export KUBECONFIG="$(k3d get-kubeconfig --name='development')"
```

```
cd environment/local/<application>
task init plan apply
```
