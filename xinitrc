# ...

#ibus
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
ibus-daemon -drx

exec blueman-applet &

# Start the notification daemon
# exec /usr/lib/notification-daemon-1.0/notification-daemon &
# exec mako &
# dunst &
/usr/lib/xfce4/notifyd/xfce4-notifyd &

[[ -f ~/.Xressources ]] && xrdb -merge ~/.Xressources

# sh ~/.fehbg &
# compton -b --inactive-opacity=0.8 &

xautolock -time 30 -locker "i3lock -c 000000 -f" &

#numlockx &
#conky &
# exec startplasma-x11
exec i3
#exec cinnamon-session
#wingpanel &
#plank &
#exec gala
#exec startlxde
#exec startxfce4
#exec awesome
# exec gnome-session
#export XDG_CURRENT_DESKTOP=GNOME-Flashback:GNOME
#exec gnome-session --session=gnome-flashback-metacity
#export XDG_CURRENT_DESKTOP=Budgie:GNOME
#exec budgie-desktop
