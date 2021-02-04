# https://docs.docker.com/engine/install/ubuntu/


# uninstall old versions of docker
sudo apt-get remove docker docker-engine docker.io containerd runc

# install packages to use repository over HTTPS
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Verify that you now have the key with the fingerprint
sudo apt-key fingerprint 0EBFCD88

# Set up the stable repository
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

###
# install docker engine
###

# -> way 1
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io
# -> way 2

# list the versions available in your repo
apt-cache madison docker-ce

# Output
# docker-ce | 5:18.09.1~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
#   docker-ce | 5:18.09.0~3-0~ubuntu-xenial | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
#   docker-ce | 18.06.1~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages
#   docker-ce | 18.06.0~ce~3-0~ubuntu       | https://download.docker.com/linux/ubuntu  xenial/stable amd64 Packages

# Install a specific version using the version string from the second column, for example,
# 5:18.09.1~3-0~ubuntu-xenial
sudo apt-get install docker-ce=<VERSION_STRING> docker-ce-cli=<VERSION_STRING> containerd.io

####

# Verify that docker engine is installed correctly by running the hello-world image
sudo docker run hello-world

################

# uninstall docker engine
sudo apt-get purge docker-ce docker-ce-cli containerd.io

# To delete all images, containers, and volumes
sudo rm -rf /var/lib/docker

###########
# You must delete any edited configuration files manually.

###########
# Docker compose
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04-pt

# download the relase 1.26.0 and save the executable file /usr/local/bin/docker-compose
# to be acessable globally
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Set permission +x to allow execution
sudo chmod +x /usr/local/bin/docker-compose

# check if the installation is ok
docker-compose --version

##############
# Setting the docker-compose.yml

#############
# Executing the docker compose

# Download the necessary docker images, create a container, and execute the containerized envyronment in background, like a daemon
docker-compose up -d

# check if the container is alive