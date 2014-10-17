#!/bin/bash

pause()
{
    sleep 1
}

echo "============================"
echo "checking /etc/resolv.conf..."
echo "============================"
pause
grep nameserver /etc/resolv.conf
if [ $? -ne 0 ]; then
    sudo echo "nameserver 8.8.8.8" >> /etc/resolv.conf
fi

echo "================================"
echo "Installing essential packages..."
echo "================================"
pause
PACKAGES=( cscope ctags git gitk openssh tree )
for i in "${PACKAGES[@]}"
do
     echo "======================"
     echo "Installing $i ..."
     echo "======================"
     pause
     sudo apt-get install $i -y
done

echo "============================="
echo "Setting up development env..."
echo "============================="
pause
echo "====================="
echo "Installing .bashrc..."
echo "====================="
pause
cp bash/dot_bashrc ~/.bashrc
source ~/.bashrc

echo "========================"
echo "Installing .gitconfig..."
echo "========================"
pause
cp git/dot_gitconfig ~/.gitconfig

echo "===================="
echo "Installing .vimrc..."
echo "===================="
pause
cp vim/dot_vimrc_ubuntu ~/.vimrc

echo "=================="
echo "Installing .vim..."
echo "=================="
pause
cp -R vim/dot_vim_ubuntu ~/.vim
