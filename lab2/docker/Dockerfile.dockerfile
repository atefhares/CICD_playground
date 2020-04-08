FROM jenkins/jenkins:lts
USER root
RUN apt-get update -y
RUN apt-get install -y python3 python3-pip
RUN apt-get install -y wget unzip
RUN wget https://releases.hashicorp.com/terraform/0.12.24/terraform_0.12.24_linux_amd64.zip
RUN unzip terraform_0.12.24_linux_amd64.zip
RUN mv terraform /usr/bin
RUN rm terraform_0.12.24_linux_amd64.zip
RUN terraform -v
RUN pip3 install ansible
RUN ansible -v
USER jenkins