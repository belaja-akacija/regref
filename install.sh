#!/usr/bin/bash bash
shopt -s extglob
# Regref installer
# TODO:
# - set $PATH to bin
# - source the autocomplete, later put it in /etc/bash_completion.d
# - get the installer to make a directory to archive then do the install logic

echo
echo "Regref Installer"
echo
# Create a destination folder
DESTINATION="/usr/local/bin"
SUPPLEMENT_DIR="/usr/local/src"

cd bin
sudo /bin/bash -c "install -v * $DESTINATION"
cd ..
sudo /bin/bash -c "install -v regref-completion.sh /etc/bash_completion.d"
cd data
sudo /bin/bash -c "mkdir $SUPPLEMENT_DIR/data"
sudo /bin/bash -c "install -v * $SUPPLEMENT_DIR/data"

 #Set up $PATH variable
source $HOME/.profile
PATH_MATCH=$(echo $PATH | grep -E '(\/usr\/local\/bin[:]?)')

if [[ ! $PATH_MATCH =~ \/usr\/local\/bin[:]? ]];
then
        echo 'export PATH="${PATH:+${PATH}:}/usr/local/bin"' >> $HOME/.profile
        source $HOME/.profile

fi

echo ""
echo "Installation complete."
echo ""

# Exit with success
exit 0
