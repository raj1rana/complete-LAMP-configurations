#!/bin/bash
# Rooot warning
echo "
==============================================================================
=             LAMP STACK SCRIPT                                              =
=       BY : RAJENDRA SINGH RANA........................                     =
=                                                                            =
=      THANK YOU FOR CHOOSING MY SCRIPT                                      =
=                                             TEXHDINONEX                    =
============================================================================== "
Color_Off='\033[0m'       # Text Reset
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
echo "$Red \n You must be a ROOT to use this script if you are not root then please colose the script $Color_Off"
read -p "$Green are you root give answer with (y/n) ???$Color_Off " RESP  #must give space between y or n " variable otherwise script wll nt work
if [ "$RESP" = "y" ]; then
     echo "$Purple \n about to install linux,mysql,php,phpfpm $Color_Off "
     apt-get update -y && apt-get upgrade -y
     apt-get install apache2 apache2-doc apache2-mpm-prefork apache2-utils libexpat1 ssl-cert -y
     apt-get install libapache2-mod-php5 php5 php5-common php5-curl php5-dev php5-gd php5-idn php-pear php5-imagick php5-mcrypt php5-mysql php5-ps php5-pspell php5-recode php5-xsl -y
     apt-get install mysql-server mysql-client libmysqlclient15.dev -y
     apt-get install phpmyadmin -y
     read -p "$Red \n Do you want to configure virtualhost $Color_Off " REASON
     if [ "$REASON" = "y" ]; then
        sh virtualhost.sh && mysqlconfig.sh
     else
         echo "$Green \n by see you when you will configure apache and mysql $Color_Off"
         exit
     fi
else
    echo "$Cyan \n please gain root access frist $Color_Off "

fi
