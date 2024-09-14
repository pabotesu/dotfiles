{}:
''
#-----------------#
#--- Variables ---#
#-----------------#

    ## set modkey -> [Alt]key 
    set $mod Mod1

    ## set row direction keys, like vim
    set $left h
    set $down j
    set $up k
    set $right l

    ## set your preferred terminal emulator
    set $term alacritty

    ## set your Luancher
    set $menu /home/pabotesu/.script/mywofi.sh

    ## set color scheme
    set $bg             #81a2be
    set $bg-inactive    #282a2e
    set $bg-urgent      #cc6666
    set $text-light     #c5c8c6
    set $text-dark      #282a2e
    set $text-inactive  #282a2e

    ## set volume/brightness bar
    set $WOBSOCK $XDG_RUNTIME_DIR/wob.sock
    exec rm -f $WOBSOCK && mkfifo $WOBSOCK && tail -f $WOBSOCK | wob
    set $DDCSOCK $XDG_RUNTIME_DIR/ddc.sock
    exec rm -f $DDCSOCK && mkfifo $DDCSOCK && tail -f $DDCSOCK | wob

#-----------------#
#--- Residents ---#
#-----------------#

# ---- # System # ---- #

    ## start sway systemd target
    exec_always "systemctl --user import-environment; systemctl --user start sway-session.target"

    ## start polkit service
    exec /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1;

    ## start notice service
    exec mako

    ## set desktop environment unique variables
    exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway 

    ## set fcitx5
    exec fcitx5 -d 

    ## set bluetooth
    exec blueman-applet

    ## start screenlocker
    exec swayidle -w \
    timeout 600 'env LANG=en.US_UTF-8 swaylock -f' \
    timeout 1200 'swaymsg "output * dpms off"' resume 'swaymsg "output * dpms on"' \
    before-sleep 'env LANG=en.US_UTF-8 swaylock -f' \

    ## start pulseaudio

    ## clipboard; previous session retrieval
    exec clipman restore
    ## clipboard manager
    exec wl-paste -t text --watch clipman store

    ## start gnome keyring
    exec eval $(/usr/bin/gnome-keyring-daemon --start);

    ## set webrtc contents
    exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway

    ## set XWayland config daemon
    exec xsettingsd
#-----------------#
#--- Look&feel ---#
#-----------------#

    ## set backgraund-wallpaper
    output "*" background /home/pabotesu/.desktop_env/scripts/wallpaper.jpg fill

    ## set inner and outer gaps
    gaps outer 3
    gaps inner 15
    default_border pixel 4

    ## set virtual output (for wayvnc vnc server)
    output HEADLESS-1 {
    res 1980x1080
    scale 1
    }

    ## set output & scaling
     output HDMI-A-1 {
       res 2560x1440
       scale 1
    }

    ## set mouse speed
    input 1133:16534:Logitech_ERGO_M575S {
    pointer_accel 0.8
    }

    input 046d:c539:Logitech_G603 {
    pointer_accel 0.8
    }


    # set color theme
    # class                 border        bground       text        indicator     child_border
    client.focused          $bg           $bg           $text-dark  $bg           $bg
    client.focused_inactive $bg-inactive  $bg-inactive  $text-light $bg-inactive  $bg-inactive
    client.unfocused        $bg-inactive  $bg-inactive  $text-light $bg-inactive  $bg-inactive
    client.urgent           $bg-urgent    $bg-urgent    $text-light $bg-urgent    $bg-urgent
    client.placeholder      $bg-inactive  $bg-inactive  $text-light $bg-inactive  $bg-inactive

#--------------------#
#--- Key bindings ---#
#--------------------#
 
# ---- # Control # ---- #

    ## Start a terminal
    bindsym $mod+Return exec $term

    ## Screenlock
    bindsym $mod+Control+l exec 'env LANG=en.US_UTF-8 swaylock -f'

    ## Kill focused window
    bindsym $mod+Shift+q kill

    ## Start your launcher
    bindsym $mod+d exec $menu

    ## Verification Clipboard
    bindsym $mod+p exec clipman pick -t wofi

    ## Drag floating windows by holding down $mod and left mouse button.
    ## Resize them with right mouse button + $mod.
    ## Despite the name, also works for non-floating windows.
    ## Change normal to inverse to use left mouse button for resizing and right
    ## mouse button for dragging.
    floating_modifier $mod normal

    ## Reload the configuration file
    bindsym $mod+Shift+r reload

    ## Exit sway (logs you out of your Wayland session)
    bindsym $mod+shift+e exec /home/pabotesu/.script/wofi_system.sh

    ## Media Control
    # output sound volume up
    bindsym XF86AudioRaiseVolume exec pactl set-sink-volume @DEFAULT_SINK@ +5% && pamixer --get-volume > $WOBSOCK
    bindsym control+XF86AudioRaiseVolume exec pactl set-sink-volume Headset_output +5% && pamixer --sink Headset_output --get-volume > $WOBSOCK
    # output sound volume down
    bindsym XF86AudioLowerVolume exec pactl set-sink-volume @DEFAULT_SINK@ -5% && pamixer --get-volume > $WOBSOCK
    bindsym control+XF86AudioLowerVolume exec pactl set-sink-volume Headset_output -5% && pamixer --sink Headset_output --get-volume > $WOBSOCK
    
    # input sound volume up
    bindsym XF86AudioRaiseVolume+shift exec pactl set-source-volume @DEFAULT_SOURCE@ +5% && pamixer --default-source --get-volume > $WOBSOCK
    # input sound volume down
    bindsym XF86AudioLowerVolume+shift exec pactl set-source-volume @DEFAULT_SOURCE@ -5% && pamixer --default-source --get-volume > $WOBSOCK
    
    # output sound mute 
    bindsym XF86AudioMute exec pactl set-sink-mute @DEFAULT_SINK@ toggle && ( pamixer --get-mute && echo 0 > $WOBSOCK ) || pamixer --get-volume > $WOBSOCK
    # input  sound mute
    bindsym XF86AudioMute+shift exec  pactl set-source-mute @DEFAULT_SOURCE@ toggle && ( pamixer --default-source --get-mute && echo 0 > $WOBSOCK ) || pamixer --default-source --get-volume > $WOBSOCK
    
# ---- # Tiles Forcus # ---- #

    ## Move your focus around
    bindsym $mod+$left focus left
    bindsym $mod+$down focus down
    bindsym $mod+$up focus up
    bindsym $mod+$right focus right

    ## Or use $mod+[up|down|left|right]
    bindsym $mod+Left focus left
    bindsym $mod+Down focus down
    bindsym $mod+Up focus up
    bindsym $mod+Right focus right

    ## Move the focused window with the same, but add Shift
    bindsym $mod+Shift+$left move left
    bindsym $mod+Shift+$down move down
    bindsym $mod+Shift+$up move up
    bindsym $mod+Shift+$right move right

    ## Ditto, with arrow keys
    bindsym $mod+Shift+Left move left
    bindsym $mod+Shift+Down move down
    bindsym $mod+Shift+Up move up
    bindsym $mod+Shift+Right move right

# ---- #  Workspaces  # ---- #

    ## Switch to workspace
    bindsym $mod+1 workspace number 1
    bindsym $mod+2 workspace number 2
    bindsym $mod+3 workspace number 3
    bindsym $mod+4 workspace number 4
    bindsym $mod+5 workspace number 5
    bindsym $mod+6 workspace number 6
    bindsym $mod+7 workspace number 7
    bindsym $mod+8 workspace number 8
    bindsym $mod+9 workspace number 9
    bindsym $mod+0 workspace number 10

    ## Move focused container to workspace
    bindsym $mod+Shift+1 move container to workspace number 1
    bindsym $mod+Shift+2 move container to workspace number 2
    bindsym $mod+Shift+3 move container to workspace number 3
    bindsym $mod+Shift+4 move container to workspace number 4
    bindsym $mod+Shift+5 move container to workspace number 5
    bindsym $mod+Shift+6 move container to workspace number 6
    bindsym $mod+Shift+7 move container to workspace number 7
    bindsym $mod+Shift+8 move container to workspace number 8
    bindsym $mod+Shift+9 move container to workspace number 9
    bindsym $mod+Shift+0 move container to workspace number 10

# ---- #  Layout Stuff # ---- #

    ## You can "split" the current object of your focus with
    ## $mod+b or $mod+v, for horizontal and vertical splits
    ## respectively.
    bindsym $mod+b splith
    bindsym $mod+v splitv

    ## Switch the current container between different layout styles
    bindsym $mod+s layout stacking
    bindsym $mod+w layout tabbed
    bindsym $mod+e layout toggle split

    ## Make the current focus fullscreen
    bindsym $mod+f fullscreen

    ## Toggle the current focus between tiling and floating mode
    bindsym $mod+Shift+space floating toggle

    ## Swap focus between the tiling area and the floating area
    bindsym $mod+space focus mode_toggle

    ## Move focus to the parent container
    bindsym $mod+a focus parent

# ---- # Scratchpad # ---- #

    ## Sway has a "scratchpad", which is a bag of holding for windows.
    ## You can send windows there and get them back later.

    ## Move the currently focused window to the scratchpad
    bindsym $mod+Shift+minus move scratchpad

    ## Show the next scratchpad window or hide the focused scratchpad window.
    ## If there are multiple scratchpad windows, this command cycles through them.
    bindsym $mod+minus scratchpad show


# ---- # Tiles Resizing # ---- #

    mode "resize" {
        ## left will shrink the containers width
        ## right will grow the containers width
        ## up will shrink the containers height
        ## down will grow the containers height
        bindsym $left resize shrink width 10px
        bindsym $down resize grow height 10px
        bindsym $up resize shrink height 10px
        bindsym $right resize grow width 10px

        ## Ditto, with arrow keys
        bindsym Left resize shrink width 10px
        bindsym Down resize grow height 10px
        bindsym Up resize shrink height 10px
        bindsym Right resize grow width 10px

        ## Return to default mode
        bindsym Return mode "default"
        bindsym Escape mode "default"
    }
    bindsym $mod+r mode "resize"

# ---- # Tools # ---- #

    ## Screen Shot
    bindsym $mod+Print exec grimshot --notify copy area | wl-paste -t image/png > ~/Pictures/Screenshots/$(date "+%Y%m%d-%H%M%S")'_grim_area.png'

    ## Start clip board
    bindsym $mod+Control+v exec clipman pick -t wofi

#------------------#
#--- Status Bar ---#
#------------------#

bar {
    swaybar_command waybar
}

include /etc/sway/config.d/*
''
