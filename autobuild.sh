#!/bin/bash

############################################################
# autobuild.sh: Simple BASH script to build AndroidInvader #
############################################################
#  NOTICE: You might want to run this in a TMUX or SCREEN  #
#        session due to the big download (repo sync)       #
############################################################

# --- funcs

installRepo() {
    mkdir -p ~/bin
    curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
    chmod a+x ~/bin/repo
}

# --- main

if [ ! -f ~/bin/repo ]; then
    installRepo
fi

cd ~
rm -rf ~/AndroidInvader && mkdir -p ~/AndroidInvader && cd ~/AndroidInvader # default path
~/bin/repo init -u https://github.com/AndroidInvader/android.git -b lineage-15.1
~/bin/repo sync -c -j 6 # default values

source ~/AndroidInvader/build/envsetup.sh
breakfast bacon

ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"

croot
brunch bacon

echo " "
echo "--- autobuild.sh: finished. Output dir: $OUT"
echo " "