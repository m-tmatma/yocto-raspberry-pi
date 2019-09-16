# ubuntu

## virtualbox addin

```
sudo apt update
sudo apt install -y dkms
sudo apt upgrade -y
```

## ssh

```
sudo apt-get -y install ssh
sudo apt-get -y install openssh-server
sudo systemctl start sshd
sudo systemctl enable ssh
```


## yocto に必要なもの

```
sudo apt-get install -y gawk wget git-core diffstat unzip texinfo gcc-multilib build-essential chrpath socat libsdl1.2-dev xterm
```
