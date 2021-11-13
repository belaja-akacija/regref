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

# Create a destination folder
DESTINATION="/opt"
mkdir -p ${DESTINATION}
mkdir regref
mv ../regref/!(install.sh) regref
tar czfv regref_build.tar.gz regref
cat regref_build.tar.gz >> install.sh

# Find __ARCHIVE__ marker, read archive contents and decompress it
ARCHIVE=$(awk '/^__ARCHIVE__/ {print NR + 1; exit 0; }' "${0}")
tail -n+${ARCHIVE} "${0}" | tar xpzv -C ${DESTINATION}

# Install logic
mv ${DESTINATION}/regref/regref-completion.sh /etc/bash_completion.d

# clean-up
cd regref
rm -rf regref_build.tar.gz
mv * ..
cd ..
rm -rf regref
rm -rf regref_build.tar.gz


echo ""
echo "Installation complete."
echo ""

# Exit with success
exit 0

__ARCHIVE__
