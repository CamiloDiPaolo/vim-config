FROM ubuntu:latest

### GENERAL SETUP

# udpate package manager
RUN apt-get -y update

# isntall git
RUN apt-get install -y git

# install curl
RUN apt-get install -y curl

# install grep
RUN apt-get install -y ripgrep

# install libfuse2 for run .appimage
RUN apt-get install -y libfuse2

# install c compiler
RUN apt install -y build-essential


# install NVIM
RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
RUN chmod u+x nvim.appimage

# generate symbolic link from nvim to /urs/bin
RUN ./nvim.appimage --appimage-extract
RUN ln -s  /squashfs-root/AppRun /usr/bin/nvim

# tmux
RUN apt-get install -y tmux

## NVIM - SETUP
RUN mkdir /root/.config
RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim /root/.local/share/nvim/site/pack/packer/start/packer.nvim

COPY nvim  /root/.config/nvim

## NVIM - Language Servers (Typescript)
RUN apt install -y nodejs
RUN apt install -y npm
RUN npm install -g n
RUN npm install -g typescript
RUN n lts

## NVIM - Formatter
RUN npm install -g prettier

## TMUX - SETUP
COPY tmux/.tmux.conf /root/.tmux.conf

# tmux pligun manager
RUN git clone https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm

## FONTS INSTALL
RUN mkdir /root/.fonts
COPY fonts/CascadiaCode /root/.fonts

#### COMANDOS

## Creamos la imagen
# sudo docker build --tag nvim-image .

## Corremos el contenedor
# sudo docker run -ti --rm nvim-image /bin/bash
# -ti creamos el contenedor en modo de terminal interactiva
# --rm removemos el contenedor automaticamente una vez que los detengamos
