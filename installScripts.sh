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
  echo 'Your system does not have curl.'
  exit 1
fi

install=""
while [[ $install != 'y' && $install != 'n' ]]; do
  echo -n 'Do you want to install vim and tmux files? (y/n) '
  read install 
done

if exists vi && [ $install = 'y' ]; then
  echo 'Installing .vimrc'
  curl https://raw.githubusercontent.com/zsarge/UserConfigs/master/.vimrc > ~/.vimrc
else
  echo 'vim configs not installing'
fi

if exists tmux && [ $install = 'y' ]; then
  echo 'Installing .tmux.conf'
  curl https://raw.githubusercontent.com/zsarge/UserConfigs/master/.tmux.conf > ~/.tmux.conf
else
  echo 'tmux configs not installing'
fi

bash=""
while [[ $bash != 'y' && $bash != 'n' ]]; do
  echo -n 'Do you want to install bash aliases, LS_COLORS, and bash profile? (y/n) '
  read bash
done

if [ $bash = 'y' ]; then
  echo 'Installing .bashrc'
  curl https://raw.githubusercontent.com/zsarge/UserConfigs/master/.bashrc > ~/.bashrc

  echo 'Installing .bash_aliases'
  curl https://raw.githubusercontent.com/zsarge/UserConfigs/master/.bash_aliases > ~/.bash_aliases

  echo 'Installing LS_COLORS'
  rm -r /tmp/LS_COLORS
  mkdir -p $HOME/.local/share  # recursively make directories for ls colors.
  mkdir /tmp/LS_COLORS && curl -L https://api.github.com/repos/trapd00r/LS_COLORS/tarball/master | tar xzf - --directory=/tmp/LS_COLORS --strip=1
  ( cd /tmp/LS_COLORS && sh install.sh )
else
  echo 'bash configs not installing'
fi

echo 'Install finished.'
