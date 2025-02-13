# mediawiki version: 1.42.3

function LNMP-mediawiki(){
  LNMP-base
  # install dependence
  $package_install php-fpm php-mysql php-xml php-mbstring php-intl php-curl php-apcu php-gd
  # download and extract the archive
  $web_user_do wget https://releases.wikimedia.org/mediawiki/1.42/mediawiki-1.42.3.zip -O $scripts_DIR/www/mediawiki-1.42.3.zip
  $web_user_do unzip $scripts_DIR/www/mediawiki-1.42.3.zip -d $scripts_DIR/www
  # link folder
  ln -s "$scripts_DIR/www/mediawiki-1.42.3" $www_dir
  # copy nginx config
  cp $scripts_DIR/etc/nginx/sites-available/mediawiki /etc/nginx/sites-available/mediawiki
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
