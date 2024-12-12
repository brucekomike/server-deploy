main(){
  info_echo "this is the LNMP app"
  verb_echo "you see this line since you have verbose mode enabled"

  if [ -z $1 ]; then
    defualt_action
  else
    parse_action "$@"
  fi

}
