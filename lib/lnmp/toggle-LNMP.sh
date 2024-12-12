#!/bin/bash
function toggle-LNMP.sh(){

source ./config.sh

show-help() {
    echo "Usage: $0 <command> <name>"
    echo
    echo "Commands:"
    echo "  enable <name>   Enable the specified name."
    echo "  disable <name>  Disable the specified name."
    echo
    echo "Options:"
    echo "  -h, --help      Show this help message."
}

# Check if no arguments are provided or if help is requested
if [ "$#" -eq 0 ] || [[ "$1" == "help" ]] || [[ "$1" == "--help" ]] || [[ "$1" == "-h" ]]; then
    show-help
    exit 0
fi


export command=$1
export name=$2

case $command in
    enable)
        if [ -z "$name" ]; then
            echo "Error: 'enable' command requires a name."
            exit 1
        fi
        echo "Enabling $name..."
        # Add your enable logic here
        toggle-$name
        ;;
    disable)
        if [ -z "$name" ]; then
            echo "Error: 'disable' command requires a name."
            exit 1
        fi

        echo "Disabling $name..."
        # Add your disable logic here
        toggle-$name
        ;;
    *)
        echo "Unknown command: $command"
        show-help
        exit 1
        ;;
esac


}
