#!/bin/bash

#  _       _ _   
# (_)_ __ (_) |_ 
# | | '_ \| | __|
# | | | | | | |_ 
# |_|_| |_|_|\__|
# ps: all fontart generated by figlet               
# import all functions and init the env for ubuntu
export Working_DIR=$(pwd)
export scripts="$Working_DIR/lib/*.sh"
# excute all scripts in the ./lib dir
for script in $scripts
do
  if [ -f "$script" ]
  then
  echo loading $script
  source "$script"
  fi
done
source ./lib/*.sh
check-root
check-config

#   ___ _ ____   __
#  / _ \ '_ \ \ / /
# |  __/ | | \ V / 
#  \___|_| |_|\_/  
if [ "OS_name" = "ubuntu" ]; then
  check-ubuntu
  env-ubuntu
fi
if [ "$use_proxy" = "true" ]; then set-proxy; fi

#  _     _   _ __  __ ____  
# | |   | \ | |  \/  |  _ \ 
# | |   |  \| | |\/| | |_) |
# | |___| |\  | |  | |  __/ 
# |_____|_| \_|_|  |_|_|   
if [ "$LNMP_base" = "true" ]; then LNMP-base; fi
if [ "$LNMP_mediawiki" = "true" ]; then LNMP-mediawiki; fi
if [ "$LNMP_mytinytodo" = "true" ]; then LNMP-mytinytodo; fi
if [ "$LNMP_nextcloud" = "true" ]; then LNMP-nextcloud; fi
if [ "$LNMP_phpmyadmin" = "true" ]; then LNMP-phpmyadmin; fi
if [ "$LNMP_flarum" = "true" ]; then LNMP-flarum; fi

#      _            _             
#   __| | ___   ___| | _____ _ __ 
#  / _` |/ _ \ / __| |/ / _ \ '__|
# | (_| | (_) | (__|   <  __/ |   
#  \__,_|\___/ \___|_|\_\___|_|   
if [ -f /.dockerenv ]; then
  echo "Running inside a Docker container."
else
  echo "Not running inside a Docker container."
  if [ "$DOCKER_install" = true ]; then DOCKER-install; fi
    # DOCKER_install wont run in docker
fi


