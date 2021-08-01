## Install dependencies
```bash
sudo snap install docker
sudo addgroup --system docker
sudo adduser $USER docker
newgrp docker
sudo snap disable docker
sudo snap enable docker

sudo snap install kubectl --classic
sudo snap install code --classic
sudo snap install flutter --classic
sudo snap install doctl
sudo snap install node --classic
```
