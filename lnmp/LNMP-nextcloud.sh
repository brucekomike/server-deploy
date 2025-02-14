function LNMP-nextcloud(){
  LNMP-base
  $package_install php-zip php-mysql php-xml php-mbstring php-gd php-curl php-apcu
  $package_install php-bcmath php-gmp php-intl php-imagick imagemagick
  # install dependence
  # download and extract the archive
  $web_user_do https://download.nextcloud.com/server/releases/latest.zip ./www/nextcloud-latest.zip
  $web_user_do unzip ./www/nextcloud-latest.zip -d ./www
  # link folder
  ln -s "$working_dir/www/nextcloud" $www_dir
  # copy nginx config
  config_file=/etc/nginx/sites-available/nextcloud
  cp ./etc/nginx/sites-available/nextcloud $config_file
  old_domain="<PLACE_HOLDER>"
  new_domain="$CLOUD_prefix.$DOMAIN"
  regex="s/\(server_name[^*]*\)$old_domain\([^;]*;\)/\1$new_domain\2/g"
  sed -ir $regex $config_file
  #occ maintenance:repair --include-expensive
  #occ db:add-missing-indices 
}

function toggle-nextcloud(){
  if [ "$command"="enable" ]; then
    ln -s /etc/nginx/sites-available/nextcloud /etc/nginx/sites-enabled/
    $DAEMON_reload $web_server
  fi
  if [ "$command"="disable"]; then
    rm /etc/nginx/sites-enabled/nextcloud
    $DAEMON_reload $web_server
  fi
}
