#!/bin/bash

function tools(){
    echo "Install utils for everyday use"
    sudo apt-get install vim htop gimp keepass2 p7zip-full p7zip-rar -y
}

function sublime(){
    echo "Install sublime"
    wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
    echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
    sudo apt-get update
    sudo apt-get install sublime-text -y
}

function chrome(){
    echo "Install Chrome"
    sh -c 'echo "deb [arch=amd64] https://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
    sudo apt-get update
    sudo apt-get install google-chrome-stable -y
}

function dev(){
    echo "Install tools for dev"
    sudo apt-get install python-pip python-dev build-essential -y
    pip install --upgrade pip
    pip install --upgrade virtualenv
}

function crossftp() {
    echo" Install CrossFTP"
    sudo apt-get update
    sudo apt-get install default-jre

    wget -O /tmp/crossftp.deb http://www.crossftp.com/crossftp_1.98.8.deb
    sudo dpkg -i /tmp/crossftp.deb
}

function awscli(){
    echo "Install awscli"
    pip install awscli --upgrade --user
}

function s3fs(){
    echo "Install s3fs"
    sudo apt-get install automake autotools-dev fuse g++ git libcurl4-gnutls-dev libfuse-dev libssl-dev libxml2-dev make pkg-config
    #Then run:
    #cd ~/GIT
    #git clone https://github.com/s3fs-fuse/s3fs-fuse.git
    #cd s3fs-fuse
    #./autogen.sh
    #./configure
    #make
    #make install
}

function s3fs(){
    echo "Install Docker-CE"
    sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo apt-key fingerprint 0EBFCD88
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt-get update
    sudo apt-get install docker-ce -y
    echo "Setup docker user"
    groupadd docker
    usermod -aG docker $USER
}

function thunderbird(){
    echo "Remove Thunderbird"
    sudo apt-get purge thunderbird*
}

function cleanup(){
    echo "General cleanup"
    sudo apt-get autoclean -y
    sudo apt-get autoremove -y
}

function upgrade(){
    echo "Apt Update & Upgrade"
    sudo apt-get update
    sudo apt-get upgrade -y
}

function postman(){
    wget https://dl.pstmn.io/download/latest/linux64 -O postman.tar.gz
    sudo tar -xzf postman.tar.gz -C /opt
    rm postman.tar.gz
    sudo ln -s /opt/Postman/Postman /usr/bin/postman
}

function postman_link() {
    echo "[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=postman
Icon=/opt/Postman/resources/app/assets/icon.png
Terminal=false
Type=Application
Categories=Development;" >>  ~/.local/share/applications/postman.desktop
}

function xbindkeys() {
    echo "Install tools"
    sudo apt-get install xbindkeys xautomation x11-utils -y
    xbindkeys --defaults > $HOME/.xbindkeysrc

    echo"TODO manually!"
    # Add lines to '$HOME/.xbindkeysrc'
    ### # Previous Tab
    ### "xte 'keydown Control_L' 'key Page_Up' 'keyup Control_L'"
    ### b:13
    ### 
    ### # Next Tab
    ### "xte 'keydown Control_L' 'key Page_Down' 'keyup Control_L'"
    ### b:14
    ### 
    ### # Close Tab
    ### "xte 'keydown Control_L' 'key W' 'keyup Control_L'"
    ### b:10
    ### # Previous page
    ### "xte 'keydown Alt_L' 'key Left' 'keyup Alt_L'"
    ### b:8
    ### 
    ### # Next Tab
    ### "xte 'keydown Alt_L' 'key Right' 'keyup Alt_L'"
    ### b:9
}


#-------------
# WHAT TO RUN
#-------------

upgrade
