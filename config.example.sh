#   ___  ____  
#  / _ \/ ___| 
# | | | \___ \ 
# | |_| |___) |
#  \___/|____/ 
OS_name=ubuntu
# currently only support ubuntu
init_system=systemd
# currently only support systemd
web_server=nginx
# currently only support nginx

#  ____               __   __
# |  _ \ _ __ _____  _\ \ / /
# | |_) | '__/ _ \ \/ /\ V / 
# |  __/| | | (_) >  <  | |  
# |_|   |_|  \___/_/\_\ |_|  

# proxy conf for specific network environments
# please use 
#
# -R 12321:127.0.0.1:7890
#
# in your ssh command
ProxyDest="http://127.0.0.1:12321/"
use_proxy=false
# please note that proxy env will be set for
# this session, package manager(apt), and docker(via systemd service config)
# more info at lib/env-ubuntu.sh

# domain config
# please change this
# the default place holder is "<PLACE_HOLDER>",
DOMAIN=example.com

# cloudflare cert setting (currently no use)
dns_cloudflare_email=email@example.com
dns_cloudflare_api_key=yourapikey

#  _     _   _ __  __ ____  
# | |   | \ | |  \/  |  _ \ 
# | |   |  \| | |\/| | |_) |
# | |___| |\  | |  | |  __/ 
# |_____|_| \_|_|  |_|_|   
LNMP_base=false
LNMP_mediawiki=false
LNMP_mytinytodo=false
LNMP_nextcloud=false
LNMP_phpmyadmin=false
LNMP_flarum=false

FLARUM_prefix=flarum
WIKI_prefix=wiki
MTT_prefix=mtt
CLOUD_prefix=cloud
MPANEl_prefix=phpmyadmin

#      _            _             
#   __| | ___   ___| | _____ _ __ 
#  / _` |/ _ \ / __| |/ / _ \ '__|
# | (_| | (_) | (__|   <  __/ |   
#  \__,_|\___/ \___|_|\_\___|_|   
DOCKER_install=false


if [ "$init_system" = "systemd" ]; then
  DAEMON_restart="systemctl restart "
  DAEMON_reload="systemctl reload "
  DAEMON_start="systemctl start "
  DAMMON_stop="systemctl stop "
fi


