export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS="@im=fcitx"

source ~/.env_vars

DEFAULT_SESSION=openbox-session

case $1 in
openbox)
    exec dbus-launch openbox-session
    ;;
fvwm-crystal)
    exec fvwm-crystal
    ;;
fvwm)
    exec fvwm
    ;;
FVWM)
    exec fvwm
    ;;
dwm)
    test -e ~/.dwmrc && source ~/.dwmrc && startdwm
    exec dwm
    ;;
i3)
    wmname LG3D
    exec i3
    ;;
*)
    exec dbus-launch $DEFAULT_SESSION
    ;;
esac
