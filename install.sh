#!/bin/bash
shopt -s extglob
# Regref installer
# TODO:
# - [ X ] set $PATH to bin
# - [ X ] source the autocomplete, later put it in /etc/bash_completion.d
# - [ X ] get the installer to make a directory to archive then do the install logic
# - [  ]  check for dependencies and prompt to install them, if not found.
#           - pcregrep, zsh, bash,

echo
echo "Regref Installer"
echo

#check_errs()
#{
        #if [ $? -ne 0 ]; then
                #echo "error"
                #exit
        #fi
#}


# Create a destination folder
DESTINATION="/usr/local/bin"
SUPPLEMENT_DIR="/usr/local/src"

# Check for dependencies
CHECK_FOR () {
        command -v $1 >/dev/null 2>&1 || {
                echo >&2 "$1 required.";
        exit 1;
        }
}
CHECK_FOR pcregrep
echo "pcregrep exist. Continuing..."
CHECK_FOR zsh
echo "zsh exist. Continuing..."
CHECK_FOR bash
echo "bash exist. Continuing..."

# Copying files
cd bin
sudo /bin/bash -c "install -v * $DESTINATION"
cd ..
sudo /bin/bash -c "install -v regref-completion.sh /etc/bash_completion.d"
cd data

#sudo /bin/bash -c "mkdir $SUPPLEMENT_DIR/data 2>/dev/null || { echo "failure"; exit; }"

if test -d "$SUPPLEMENT_DIR/data";
then
        echo "$SUPPLEMENT_DIR/data exists."
else
        echo
        echo "$SUPPLEMENT_DIR/data does not exist. Creating..."
        echo
        sudo /bin/bash -c "mkdir $SUPPLEMENT_DIR/data"
fi

sudo /bin/bash -c " install -v * $SUPPLEMENT_DIR/data"
cd ..

# Set up $PATH variable
PROFILE="$HOME/.profile"
if test -f "$PROFILE";
then
        echo
        echo "$PROFILE exists. Continuing..."
        echo
else
        echo
        echo "$PROFILE does not exist. Making file..."
        echo
        touch $PROFILE
fi

PATH_MATCH=$(echo $PATH | grep -E '(\/usr\/local\/bin[\/:]?)')

if [[ ! $PATH_MATCH =~ \/usr\/local\/bin[\/:]? ]];
then
        echo 'export PATH="${PATH:+${PATH}:}/usr/local/bin"' >> $HOME/.profile
        source $HOME/.profile

fi
echo ""
echo "Installation complete."
echo ""

# Exit with success
exit 0
