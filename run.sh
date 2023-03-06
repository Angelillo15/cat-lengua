# /bin/bash 

DIR=./firefox
VERSION=110.0.1/linux-i686/es-ES/firefox-110.0.1.tar.bz2
LINK=https://1drv.ms/p/s!AhXJW_MGvgNAnzFT4gdLA4DN2Uas

if [ -d "$DIR" ];
then
    echo "$DIR is downloaded."
else
	echo "$DIR is not downloaded."
    echo downloading firefox
    # download firefox from its official cdn
    wget https://download-installer.cdn.mozilla.net/pub/firefox/releases/$VERSION -O firefox.tar.bz2 --no-check-certificate
    # unzip firefox.tar.bz2 to firefox directory
    tar -xvf firefox.tar.bz2
    # remove firefox.tar.bz2
    rm -r firefox.tar.bz2
fi
echo granting execution permissions to firefox
chmod +x firefox/firefox
echo running firefox with the following link $(cat link.txt)
./firefox/firefox $LINK

read -p "Do you want to delete the local instance of firefox [N/y] " choice

if [ $choice == "y" ]
then
    echo "removing firefox $VERSION..."
    rm -r $DIR
else
    exit
fi
