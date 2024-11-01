function check-root(){
# detect permission
if [ "$EUID" -ne 0 ]
then 
    echo "this script must be executed with root permission"
    exit 1
fi
}