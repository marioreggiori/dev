## Install dependencies
```bash
#sudo snap install docker
#sudo addgroup --system docker
#sudo adduser $USER docker
#newgrp docker
#sudo snap disable docker
#sudo snap enable docker

sudo apt update
sudo apt install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt update
sudo apt install docker-ce docker-ce-cli containerd.io

sudo snap install kubectl --classic
sudo snap install code --classic
sudo snap install flutter --classic
sudo snap install doctl
sudo snap install node --classic

sudo apt install git
```
