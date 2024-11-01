function check-config(){
  file="config.sh"
  source_file="config.example.sh"

  if [ ! -f "$file" ]; then
    echo "config file have not been created, creating from example file..."
    cp "$source_file" "$file"
    echo "please edit the config.sh and rerun the install script"
    exit 0
  else
    echo "config file already exists. start install process"
  fi

}