sudo apt-get upgrade
sudo apt-get -y build-dep build-essential
sudo apt-get -y install vim
sudo apt-get -y install ngrep
sudo apt-get -y install jq
sudo apt-get -y install vlc
sudo apt-get -y install deluge
sudo apt-get -y install terminator
sudo apt-get -y install curl
sudo apt-get -y install git
sudo apt-get -y install xclip

# install amix's vimrc
git clone git://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_basic_vimrc.sh

# install oh-my-zsh
if [ ! -e ~/.oh-my-zsh ]; then
    sudo apt-get -y install zsh
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
    chsh -s `which zsh`
fi

# install chrome
if [ ! -e /usr/bin/google-chrome ]; then
    sudo apt-get -y install libxss1 libappindicator1 libindicator7
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo dpkg -i google-chrome*.deb
    sudo apt-get -yf install
    sudo rm *google-chrome*.deb*
fi

# clone personal-media-server if not present
# install movet utility
if [ ! -e ~/personal-media-server ]; then
    git clone https://github.com/vi-s/personal-media-server.git

    # sym link movet from git-repo to /usr/bin
    sudo ln -s ~/personal-media-server/torrent_mover/movet /usr/bin/movet
fi

# install spotify
if [ ! -e /usr/bin/spotify ]; then
    # 1. Add this line to your list of repositories by
    #    editing your /etc/apt/sources.list
    sudo echo "deb http://repository.spotify.com stable non-free" | sudo tee -a /etc/apt/sources.list

    # 2. If you want to verify the downloaded packages,
    #    you will need to add our public key
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59

    # 3. Run apt-get update
    sudo apt-get update

    # 4. Install spotify!
    sudo apt-get -y install spotify-client
fi

# install sublime text
if [ ! -e /usr/bin/subl ]; then
    # first add the apt-get-repository dependencies
    sudo apt-get -y install software-properties-common python-software-properties
    # now install sublime text 3 from PPA
    sudo add-apt-repository ppa:webupd8team/sublime-text-3
    sudo apt-get update
  i****ijk  sudo apt-get install sublime-textk-installer
fi

# install btsync
#***You will have to att the btsync executable to startup programs
if [ ! -e ~/btsync ]; then
    curl -LO https://download-cdn.getsyncapp.com/stable/linux-x64/BitTorrent-Sync_x64.tar.gz
    mkdir btsync
    tar -xzf *Sync*.tar.gz -C btsync
fi
