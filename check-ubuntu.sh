function check-ubuntu(){
# detect if script is run on Ubuntu
echo checking ubuntu system os-release file
if ! grep -Fxq 'ID=ubuntu' /etc/os-release ;then
   echo "This script currently only support ubuntu"
   EXIT_CODE=1
   custom-exit
 else
   echo "ubuntu check passed"
 fi
}
