#!/usr/bin/bash
shopt -s extglob
# Regref installer
# TODO:
# - set $PATH to bin
# - source the autocomplete, later put it in /etc/bash_completion.d
# - get the installer to make a directory to archive then do the install logic

echo ""
echo "Regref Installer"
echo ""

USERNAME="$USER"
echo $USERNAME
# Create a destination folder
DESTINATION="/usr/local/bin"
SUPPLEMENT_DIR="/usr/local/src"

cd bin
sudo /bin/bash -c "install -v * $DESTINATION"
cd ..
sudo /bin/bash -c "install -v regref-completion.sh /etc/bash_completion.d"
sudo /bin/bash -c "install -v -d data $SUPPLEMENT_DIR"

 #Set up $PATH variable
source $HOME/.profile
PATH_MATCH=$(echo $PATH | grep -E '(\/usr\/local\/bin[:]?)')

if [[ ! $PATH_MATCH =~ \/usr\/local\/bin[:]? ]];
then
        echo 'export PATH="${PATH:+${PATH}:}/usr/local/bin"' >> $HOME/.profile
        source $HOME/.profile

fi


#sudo /bin/bash -c "mkdir -p ${DESTINATION}"
#mkdir regref
#cd ..
#mv regref/!(install.sh) regref/regref
#cd regref
#tar czfv regref_build.tar.gz regref
#cat regref_build.tar.gz >> install.sh

# Find __ARCHIVE__ marker, read archive contents and decompress it
#ARCHIVE=$(awk '/^__ARCHIVE__/ {print NR + 1; exit 0; }' "${0}")
#sudo /bin/bash -c "tail -n+${ARCHIVE} \"${0}\" | tar xpzv -C ${DESTINATION}"

## Install logic
#sudo /bin/bash -c "chmod +x ${DESTINATION}/regref/bin/regref.sh"
#sudo /bin/bash -c "mv ${DESTINATION}/regref/regref-completion.sh /etc/bash_completion.d; source /etc/bash_completion.d/regref-completion.sh"
## clean-up
#cd regref
#rm -rf regref_build.tar.gz
#mv * ..
#cd ..
#rm -rf regref
#rm -rf regref_build.tar.gz


echo ""
echo "Installation complete."
echo ""

# Exit with success
exit 0

#__ARCHIVE__
