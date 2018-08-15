#this script will install virtualhost for you
# it is a simple script that will not install SSL certs as per now
echo "
 ==============================================================================
 =             VIRTUAL HOST SCRIPT                                            =
 =       BY : RAJENDRA SINGH RANA........................                     =
 =                                                                            =
 =      THANK YOU FOR CHOOSING MY SCRIPT                                      =
 =                                             TEXHDINONEX                    =
 ============================================================================== "
 Color_Off='\033[0m'       # Text Reset
 RED='\033[0;31m'  #  red
echo "$RED \n NOTE: if you have NOT made ROOT DIRECTORY  then close this script and TYPE (sh make rootdir.sh) $Color_Off "
echo "installing virtual host "
read -p "please give your server name : " SERVERNAME     #servername or domain name
read -p "please give your server alias : " SERVERALIAS   #server alias
read -p "please give your root diroctory location : " ROOTDIR      #root directory location
echo "the information you have given is :"$SERVERNAME" :is server name :"$SERVERALIAS" :is the server alias "$ROOTDIR" :is the working diroctory"
read -p "do you wish to continue (y/n) " EXPECT   # case
  if [[ "$EXPECT" = "y" ]]; then
    read -p "please give your conf file a name (file.conf)" CONFFILENAME
     echo   "<VirtualHost *:80>
                    ServerName $SERVERNAME
                    ServerAlias $SERVERALIAS
                    DocumentRoot $ROOTDIR
                    <Directory $ROOTDIR>
                            Options Indexes FollowSymLinks MultiViews
                            AllowOverride All
                            Allow from all
                            Require all granted
                    </Directory>

                    CustomLog /var/log/apache2/$SERVERNAME-access.log combined
                    ErrorLog /var/log/apache2/$SERVERNAME-error.log
                    LogLevel warn
            </VirtualHost>"   > /Users/robert.rajendra/Desktop/$CONFFILENAME

  cd  /Users/robert.rajendra/Desktop/
  ls -la
  echo "please check if the file you gave is created"
  a2ensite $CONFFILENAME
  service apache2 reload
else
  echo "please close the script and start it again"

fi
