function check-ubuntu(){
# detect if script is run on Ubuntu
if ! grep -q 'Ubuntu' /etc/os-release
 then
   echo "This script currently only support ubuntu"
   exit 1
 fi
}