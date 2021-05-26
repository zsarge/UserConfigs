#!/usr/bin/env bash
# Zack Sargent - Install user configs
# Purpose: Quickly set up the most important configurations on a new system.
# (It's not elegant, but it works.)

# Copy the next line without the `#` to download and run this script.
# bash <(curl -s https://raw.githubusercontent.com/zsarge/UserConfigs/master/installScripts.sh)

exists() {
  command -v "$1" >/dev/null 2>&1
}

if exists curl; then
  echo 'Installing scripts.'
else
  echo 'Your system does not have curl, and this tool will not work.'
  exit 1
fi

install=""
while [[ $install != 'y' && $install != 'n' ]]; do
  echo -n 'Do you want to install .vimrc? (y/n) '
  read install
done

if exists vi && [ $install = 'y' ]; then
  echo 'Installing .vimrc'
  curl -s https://raw.githubusercontent.com/zsarge/UserConfigs/master/.vimrc > ~/.vimrc
else
  echo '.vimrc not installing'
fi

install=""
while [[ $install != 'y' && $install != 'n' ]]; do
  echo -n 'Do you want to install .tmux.conf? (y/n) '
  read install
done

if exists tmux && [ $install = 'y' ]; then
  echo 'Installing .tmux.conf'
  curl -s https://raw.githubusercontent.com/zsarge/UserConfigs/master/.tmux.conf > ~/.tmux.conf
else
  echo '.tmux.conf not installing'
fi

install=""
while [[ $install != 'y' && $install != 'n' ]]; do
  echo -n 'Do you want to install .bash_aliases? (y/n) '
  read install
done

if [ $install = 'y' ]; then
  echo 'Installing .bash_aliases'
  curl -s https://raw.githubusercontent.com/zsarge/UserConfigs/master/.bash_aliases > ~/.bash_aliases
else
  echo '.bash_aliases not installing'
fi

install=""
while [[ $install != 'y' && $install != 'n' ]]; do
  echo -n 'Do you want to install .bashrc? (y/n) '
  read install 
done

if [ $install = 'y' ]; then
  echo 'Installing .bashrc'
  curl -s https://raw.githubusercontent.com/zsarge/UserConfigs/master/.bashrc > ~/.bashrc
else
  echo '.bashrc not installing'
fi

install=""
while [[ $install != 'y' && $install != 'n' ]]; do
  echo -n 'Do you want to install LS_COLORS? (y/n) '
  read install 
done

if [ $install = 'y' ]; then
  echo 'Installing LS_COLORS'
  rm -r /tmp/LS_COLORS
  mkdir -p $HOME/.local/share  # recursively make directories for ls colors.
  mkdir /tmp/LS_COLORS && curl -s -L https://api.github.com/repos/trapd00r/LS_COLORS/tarball/master | tar xzf - --directory=/tmp/LS_COLORS --strip=1
  ( cd /tmp/LS_COLORS && sh install.sh )
else
  echo 'LS_COLORS not installing'
fi

echo 'Install finished.'
