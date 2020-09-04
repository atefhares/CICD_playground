The goal is to use Terraform to setup kubernetes cluster contains the following resources:
and deploy a simple nodejs application on the cluster.

## Resources created

- 3 namespaces (_build_, _dev_, _test_)
- 2 deployments in _build_ namespace, one for _jenkins_ and one for _sonatype-nexus_
- 1 deployment for _mysql_ database server in _dev_ & _test_ namespaces
- 1 service to access _jenkins_ externally
- 1 service to access _sonatype-nexus_ externally
- 1 service to access _mysql_ internally

## Tools used

- Minkube to setup a k8s cluster
- Terraform to create cluster resources
- Ansible & kubectl to communicate with the cluster
- jenkins to automate CI/CD process

## How to get started

- setup a Kubernetes cluster (you may use Minikube, GKS, EKS, etc)
- install terraform (you will my need additional setup steps depending on your K8s cluster service)
- run `terraform init`
- run `terraform plan` to check resources then use:

  `terraform apply -var="MYSQL_USER=?" -var="MYSQL_PASSWORD=?" -var="MYSQL_ROOT_PASSWORD=?"`

  to apply the changes

- go to `clusterIp:30001` to access jenkins, then go through setup steps
- create two parametrized pipelines as shown in images and use the Jenkins files from CI/CD dirs.
- after SUCCESS state you can access app @ `clusterIp:30010`

## outputs:

pipeline output:
<a href="pipelineoutput.txt"> pipelineoutput.txt </a>

---

<img src="screenshots/1.png" width="1000"/>

---

<img src="screenshots/2.png" width="1000"/>

---

<img src="screenshots/3.png" width="1000"/>

---

<img src="screenshots/4.png" width="1000"/>

---

<img src="screenshots/5.png" width="1000"/>

---

<img src="screenshots/6.png" width="1000"/>
