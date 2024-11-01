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

DOCKER_install=false