# server-deploy scripts
- this repo contains scripts as helper for server deployment (mainly for LNMP suits)

## project migrated
this project is now migrated to use dedicated [bash-project-template](https://github.com/brucekomike/bash-project-template).
- to use this project
first clone the templater
```
git clone https://github.com/brucekomike/bash-project-template frameworker
```
then use `mod install` to get this project
```
cd frameworker
frameworker.sh mod install https://github.com/brucekomike/server-deploy deploy
```


## currently supported distro ("supported" means you can skip most base installation process without addtional configuration)
- ubuntu 24.04 (because i write fixed php version in nginx config)
- PR for more distro support is welcome

## currently supported sites
- mediawiki
- nextcloud
- mytitytodo
