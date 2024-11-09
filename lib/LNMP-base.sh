LNMP-base(){
  apt install $web_server
  apt install php
  apt install mariadb-server
  mysql_secure_installation
}