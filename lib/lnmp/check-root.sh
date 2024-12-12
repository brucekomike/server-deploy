function check-root(){
# detect permission
if [ "$EUID" -ne 0 ]
then
    echo "this script must be executed with root permission"
    EXIT_CODE=1
    custom-exit
fi
}
