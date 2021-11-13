#!/usr/bin/zsh
# Regref installer
# TODO:
# - set $PATH to bin
# - source the autocomplete, later put it in /etc/bash_completion.d
# - get the installer to make a directory to archive then do the install logic

echo ""
echo "Regref Installer"
echo ""

# Create a destination folder
DESTINATION="/opt/regref"
mkdir -p ${DESTINATION}

# Find __ARCHIVE__ marker, read archive contents and decompress it
ARCHIVE=$(awk '/^__ARCHIVE__/ {print NR + 1; exit 0; }' "${0}")
tail -n+${ARCHIVE} "${0}" | tar xpzv -C ${DESTINATION}

echo ""
echo "Installation complete."
echo ""

# Exit with success
exit 0

__ARCHIVE__
