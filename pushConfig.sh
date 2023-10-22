configFolder='/home/camilo/.config'
dockerFolder=$(pwd)

# COPY NVIM CONFIG FILES
cd $configFolder/nvim

cp -r -i ./after $dockerFolder/nvim
cp ./lua/camilo/packer.lua  $dockerFolder/nvim/lua/user/packer.lua
cp ./lua/camilo/remap.lua  $dockerFolder/nvim/lua/user/remap.lua
cp ./lua/camilo/set.lua  $dockerFolder/nvim/lua/user/set.lua

# COPY TMUX CONFIG FILES
cp ./.tmux.conf $dockerFolder/tmux/.tmux.conf

git add .
git commit -m "update config"
git push origin master
