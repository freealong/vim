# link .vimrc
cd ..
mv .vimrc .vimrc_bkp
ln -s .vim/vimrc .vimrc
cd .vim

# install vundle plugin manager
mkdir bundle
cd bundle
git clone https://github.com/VundleVim/Vundle.vim.git

# install plugins include in .vimrc
vim +PluginInstall +qall

# install YCM dependence
sudo apt-get install build-essntial cmake python-dev python3-dev
cd YouCompleteMe
./install.py --clang-completer
cd ..

# install color_coded dependence
sudo apt-get install clang libncurses-dev libz-dev xz-util libpthread-workqueue-dev
sudo apt-get install vim-gtk # make vim has lua support
sudo apt-get install liblua5.2-dev lua5.2 # install the same version with vim's lua
cd color_coded
mkdir build && cd build
cmake -DCMAKE_INSTALL_PREFIX=~/.local ..
make && make install
make clean && make clean_clang
cd ..

# install ycm-generator
cd ../../.local
mkdir lib
cd lib
git clone https://github.com/rdnetto/YCM-Generator.git
cd YCM-Generator && rm template.py
ln -s ../../../.vim/template.py ./
cd ../../ && mkdir bin
cd bin
ln -s ../lib/YCM-Generator/config_gen.py ./
# config_gen.py PROJECT_ROOT_DIR // will generate .ycm_extra_conf.py for ycm
# config_gen.py -F=cc PROJECT_ROOT_DIR // will generate .color_coded for color_coded
