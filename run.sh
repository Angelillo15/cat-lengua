# /bin/bash 

DIR=./firefox
VERSION=110.0.1/linux-i686/es-ES/firefox-110.0.1.tar.bz2
if [ -d "$DIR" ];
then
    echo "$DIR is downloaded."
else
	echo "$DIR is not downloaded."
    echo downloading firefox

    # download firefox from its official cdn
    curl https://download-installer.cdn.mozilla.net/pub/firefox/releases/$VERSION -o firefox.tar.bz2
    # unzip firefox.tar.bz2 to firefox directory
    tar -xvf firefox.tar.bz2
    # remove firefox.tar.bz2
    rm -r firefox.tar.bz2
fi
echo granting execution permissions to firefox
chmod +x firefox/firefox
echo running firefox with the following link $(cat link.txt)
./firefox/firefox $(cat link.txt)