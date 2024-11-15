# mediawiki version: 1.42.3

function LNMP-mediawiki(){
  # install dependence
  apt install php-fpm php-mysql php-xml php-mbstring php-intl php-curl php-apcu php-gd
  # download and extract the archive
  $web_user_do wget https://releases.wikimedia.org/mediawiki/1.42/mediawiki-1.42.3.zip -O ./www/mediawiki-1.42.3.zip
  $web_user_do unzip ./www/mediawiki-1.42.3.zip -d ./www
  # link folder
  ln -s "$working_dir/www/mediawiki-1.42.3" $www_dir
  # copy nginx config
  cp ./etc/nginx/sites-available/mediawiki /etc/nginx/sites-available/mediawiki
  config_file=/etc/nginx/sites-available/mediawiki
  old_domain="<PLACE_HOLDER>"
  new_domain="$WIKI_prefix.$DOMAIN"
  regex="s/\(server_name[^*]*\)$old_domain\([^;]*;\)/\1$new_domain\2/g"
  sed -ir $regex $config_file
}

function toggle-mediawiki(){
  if [ "$command"="enable" ]; then
    ln -s /etc/nginx/sites-available/mediawiki /etc/nginx/sites-enabled
    $DAEMON_reload $web_server
  fi
  if [ "$command"="disable"]; then
    rm /etc/nginx/sites-enabled/mediawiki
    $DAEMON_reload $web_server
  fi
}
