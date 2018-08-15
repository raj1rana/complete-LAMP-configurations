#THIS WILL CONFIGURE MYSQL
echo "
==============================================================================
=             MYSQL DB CREATION SCRIPT                                       =
=       BY : RAJENDRA SINGH RANA........................                     =
=                       {{{{{THIS SCRIPT IS STILL UNDER TESTING}}}}}}        =
=      THANK YOU FOR CHOOSING MY SCRIPT                                      =
=                                             TEXHDINONEX                    =
============================================================================== "


echo "this script will not change mysql configuation"

read -p "please enter your username " UNAME
read -p "please enter your hostname " HNAME
read -p "please enter your password " PASSWD
read -p  "this is  what you have enterd : ($UNAME) for username and : ($HNAME) \n do you wish to continue (y/n) " ANS
if [[ "$ANS" = "y" ]]; then
  read -p "enter the Dababase name you want to make "  DBNAME
  mysql -h{$HNAME} -u{$UNAME} -p{$PASSWD} -e  "CREATE DATABASE {$DBNAME}; "
  read -p "please enter your Database user (username for this database) " DBUSR
  read -p "please enter a Password for your Database " DBPASS
  mysql -h{$HNAME} -u{$UNAME} -p{$PASSWD} -e  "CREATE USER '{$DBUSR}'@'%' IDENTIFIED BY '{$DBPASS}'; "
  mysql -h{$HNAME} -u{$UNAME} -p{$PASSWD} -e  "GRANT ALL PRIVILEGES ON {$DBUSR}.* TO '{$DBUSR}'@'%'"
  mysql -h{$HNAME} -u{$UNAME} -p{$PASSWD} -e  "flush privileges; "
  mysql -h{$HNAME} -u{$UNAME} -p{$PASSWD} -e " quit; "
  echo "you have created the database "
  echo "here are your configurations
   $DBNAME : Name of yor Database
   $DBUSR  : Name of your DB user
   $DBPASS : PW of your db please include #(PP) "
else
  echo "please close this script and start the script again Tnank You"
fi
