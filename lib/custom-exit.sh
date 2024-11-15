function custom-exit(){
  if [ "$TESING" = "true" ]; then
    echo "you have triggered an exit"
  elif [ "$EXIT_CODE" = "1" ]; then
    echo "exiting with at least an error"
    exit 1
  elif [ "$EXIT_CODE" = "0"]; then
    echo "exiting in normal condition"
    exit 0
  fi
}
