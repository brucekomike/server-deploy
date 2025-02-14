function mediawiki-git(){
  LNMP_base
  mediawiki-git-main
  mediawiki-git-linking
  $run_as_user php maintenance/run.php update
  # copy nginx config
  cp $scripts_DIR/etc/nginx/sites-available/mediawiki /etc/nginx/sites-available/mediawiki
  config_file=/etc/nginx/sites-available/mediawiki
  old_domain="<PLACE_HOLDER>"
  new_domain="$WIKI_prefix.$DOMAIN"
  regex="s/\(server_name[^*]*\)$old_domain\([^;]*;\)/\1$new_domain\2/g"
  sed -ir $regex $config_file
  info_echo "mediawiki base installation completed please check your config and db"
}
function mediawiki-git-linking(){
  # link the installation to /var/www
  cd ..
  sudo rm /var/www/mediawiki
  sudo ln -s /opt/www/mediawiki-$mw_version /var/www/mediawiki
}
function mediawiki-git-main(){
  mkdir -p /opt/www
  # get the mediawiki
  cd /opt/www
  $run_as_user git clone https://gerrit.wikimedia.org/r/mediawiki/core.git \
  $git_var mediawiki-$mw_version

  # get vendor lib
  cd mediawiki-$mw_version
  # first update all submodule
  $run_as_user git submodule update --init --recursive --depth 1

  # composer way, in use
  $run_as_user composer install --no-dev
  # git way, commented
  #$run_as_user git clone https://gerrit.wikimedia.org/r/mediawiki/vendor.git $git_var 

  ## get the extensions

  cd extensions

  export repo_url=https://gerrit.wikimedia.org/r/mediawiki/extensions
  for extn in "${extns[@]}"; do
    echo installing extension: $extn
    $run_as_user git clone $repo_url/$extn $git_var
  done
  ## extentions install
  for dir in */; do
    if [ -d "$dir" ]; then
      echo "Entering directory: $dir"
      cd "$dir"
      # Check if composer.json exists
      if [ -f "composer.json" ]; then
        $run_as_user composer install --no-dev
      else
        echo "No composer.json found in $dir, skipping..."
      fi
      cd ..
    fi
  done
  # dpl3
  export repo_url=https://github.com/Universal-Omega/DynamicPageList3.git
  $run_as_user git clone $repo_url $git_var

  # extender
  export repo_url="git clone https://github.com/octfx/mediawiki-extensions-TemplateStylesExtender"
  export clone_dir="TemplateStylesExtender"
  $run_as_user git clone $repo_url $git_var $clone_dir
  ## get skin
  cd ../skins

  # citizen
  export repo_url=https://github.com/StarCitizenTools/mediawiki-skins-Citizen
  $run_as_user git clone $repo_url --branch $citizen_ver --single-branch --depth=1 Citizen

  # back to the main dir
  cd ..

}
