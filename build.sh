#!/usr/bin/env bash

PAKID="io.github.kuuchuu.RimPy"

cd $PAKID || exit

RIMPYVERSION=$(awk -F '/' '{print $1}' rimpy.version)
RIMPYSHA=$(awk -F '/' '{print $2}' rimpy.version)

WKDIR=$(readlink -f $PAKID | sed 's,/*[^/]\+/*$,,')

JSON=$(sed "s/\$RIMPYVERSION/$RIMPYVERSION/g" < manifest.json | sed "s/\$RIMPYSHA/$RIMPYSHA/g" | sed "s/\\\$WKDIR/$(echo "$WKDIR" | sed 's/\//\\\//g')/g")

echo "$JSON" | flatpak-builder --repo=repo --force-clean build-dir /dev/stdin
flatpak build-bundle repo "rimpy.$RIMPYVERSION.flatpak" io.github.kuuchuu.RimPy

echo -e "\nFlatpak built!\n"
rm -rdf .flatpak-builder build-dir repo
while true; do
    read -p "Would you like to install the RimPy Flatpak now? [y/n]" yn
    case $yn in
        [Yy]* ) flatpak install "rimpy.$RIMPYVERSION.flatpak"; break;;
        [Nn]* ) echo -e "\nRun \`flatpak install '$PWD/rimpy.$RIMPYVERSION.flatpak'\` to install."; break;;
        * ) echo "Please respond 'y' or 'n'";;
    esac
done
