# helper function for ubuntu
function env-ubuntu(){
  export web_user_do="sudo -u www-data "
  export working_dir=$(pwd)
  export www_dir="/var/www"
  apt update
  apt upgrade -y
  export package_install="apt install -y"
}

function set-proxy(){
  echo setting proxy
  #export http_proxy="$ProxyDest"
  export https_proxy="$ProxyDest"

  cp $scripts_DIR/etc/apt/apt.conf.d/99-proxy.conf /etc/apt/apt.conf.d/99-proxy.conf
  config_file=/etc/apt/apt.conf.d/99-proxy.conf
  old_pattern="<PLACE_HOLDER>"
  new_pattern="$ProxyDest"
  regex="s|$old_pattern|$new_pattern|g"
  sed -i "$regex" "$config_file"

  mkdir -p /etc/systemd/system/docker.service.d
  cp $scripts_DIR/etc/systemd/system/docker.service.d/proxy.conf /etc/systemd/system/docker.service.d/proxy.conf
  config_file=/etc/systemd/system/docker.service.d/proxy.conf
  old_pattern="<PLACE_HOLDER>"
  new_pattern="$ProxyDest"
  regex="s|$old_pattern|$new_pattern|g"
  sed -i "$regex" "$config_file"

  cp $scripts_DIR/usr/local/bin/proxy.sh  /usr/local/bin/proxy.sh  
  config_file=/usr/local/bin/proxy.sh  
  old_pattern="<PLACE_HOLDER>"
  new_pattern="$ProxyDest"
  regex="s|$old_pattern|$new_pattern|g"
  sed -i "$regex" "$config_file"
  chmod +x $config_file
}

