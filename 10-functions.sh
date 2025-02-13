function LNMP_list(){
    info_echo "belows are avalibale LNMP install targets"
    echo
    info_echo "$(ls ./lib/lnmp/LNMP*.sh | sed 's|^.*/LNMP-||; s|\.sh$||')"
}
function LNMP_install(){
    case "$1" in
        mediawki)
        LNMP-mediawki
        ;;
        mytinytodo)
        LNMP-mytinytodo
        ;;
        nextcloud)
        LNMP-nextcloud
        ;;
        phpmyadmin)
        LNMP-phpmyadmin
        ;;
        flarum)
        LNMP-flarum
        ;;
        *)
        red_echo "unknown target $1"
        ;;
    esac

}
