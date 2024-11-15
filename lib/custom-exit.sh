function custom-exit(){
  if [ "$TESING"="true" ]; then
    echo "you have triggered an exit"
  elif [ "$EXIT_CODE"="1" ]; then
    exit 1
  elif [ "$EXIT_CODE"="0"]; then
    exit 0
  fi
}
