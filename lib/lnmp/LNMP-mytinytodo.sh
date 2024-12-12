function LNMP-mediawiki(){
  # install dependence
  # download and extract the archive
  $web_user_do wget https://github.com/maxpozdeev/mytinytodo/releases/download/v1.8.1/mytinytodo-v1.8.1.tar.gz -O ./www/mytinytodo-v1.8.1.tar.gz
  $web_user_do tar zxf ./www/mytinytodo-v1.8.1.tar.gz -d ./www
  # link folder
  ln -s "$working_dir/www/mytinytodo" $www_dir
  # copy nginx config
  config_file=/etc/nginx/sites-available/mytinytodo
  cp ./etc/nginx/sites-available/mytinytodo $config_file
  old_domain="<PLACE_HOLDER>"
  new_domain="$MTT_prefix.$DOMAIN"
  regex="s/\(server_name[^*]*\)$old_domain\([^;]*;\)/\1$new_domain\2/g"
  sed -ir $regex $config_file
}

function toggle-mytinytodo(){
  if [ "$command"="enable" ]; then
    ln -s /etc/nginx/sites-available/mytinytodo /etc/nginx/sites-enabled
    $DAEMON_reload $web_server
  fi
  if [ "$command"="disable"]; then
    rm /etc/nginx/sites-enabled/mytinytodo
    $DAEMON_reload $web_server
  fi
}
