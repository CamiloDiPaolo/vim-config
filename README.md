### make docker image
sudo docker build --tag nvim-image . 

### run container
sudo docker run -ti --rm nvim-image /bin/bash

### install nvim plugins
```bash
nvim ~/.config/nvim/lua/user/packer.lua

:so

:PackerSync
```

### load tmux conf
```bash
tmux

tmux source ~/.tmux.conf

```
