function LNMP-mediawiki(){
  # install dependence
  apt install php-fpm php-mysql php-xml php-mbstring php-intl php-curl php-apcu php-gd
  # download and extract the archive
  $web-user-do wget https://releases.wikimedia.org/mediawiki/1.42/mediawiki-1.42.3.zip -O ./www/mediawiki-1.42.3.zip
  $web-user-do unzip ./www/mediawiki-1.42.3.zip -d ./www
  # link folder
  ln -s 
}