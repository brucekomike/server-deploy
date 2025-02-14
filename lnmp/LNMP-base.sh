LNMP-base(){
  config_check
  env-ubuntu
  apt install -y $web_server
  apt install -y php
  apt install -y mariadb-server
  mysql_secure_installation
}