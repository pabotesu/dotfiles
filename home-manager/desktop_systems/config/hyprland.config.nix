{}:
''

#-----------------------#
#       variables       #
#-----------------------#

$mainMod = ALT
$subMod = SUPER
$WOBSOCK = $XDG_RUNTIME_DIR/wob.sock

#-----------------------#
#      environment      #
#-----------------------#
env = QT_QPA_PLATFORM,wayland
env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1
env = MOZ_ENABLE_WAYLAND,1
env = XDG_SESSION_TYPE,wayland
env = XDG_SESSION_DESKTOP,Hyprland
env = XDG_CURRENT_DESKTOP,Hyprland
env = _JAVA_AWT_WM_NONREPARENTING,1
env = INPUT_METHOD,fcitx
env = QT_IM_MODULE,fcitx
env = GTK_IM_MODULE,
env = XMODIFIERS,@im=fcitx
env = XIM_SERVERS,fcitx
env = GLFW_IM_MODULE,ibus
env = bitdepth,10

#-----------------------#
#       monitor         #
#-----------------------#

# ---- Thinkpad_x280 monitor ---- # 
# monitor= , 1920x1080@60, 0x0, 1 #

# ---- My Destop Machine Env ---- #
monitor=HDMI-A-1 ,2560x1440@100, auto, 1
monitor=HDMI-A-2 ,2560x1440@100, auto, 1

#-----------------------#
#       workspace       #
#-----------------------#
workspace = 1, monitor:HDMI-A-1, default:true, persistent:true
workspace = 2, monitor:HDMI-A-2, default:true, persistent:true

#-----------------------#
#       exec-tools      #
#-----------------------#

exec = /home/pabotesu/.nix-profile/bin/waybar
exec-once = fcitx5 -D
exec-once = mako # notification tool
exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=wayland
exec-once = hypridle
exec-once = swaybg --image ~/.desktop_env/scripts/wallpaper.jpg --mode fill
exec-once = clipman restore
exec-once = exec wl-paste -t text --watch clipman store
exec-once = copyq --start-server
exec-once = wl-paste --type text --watch cliphist store # Stores only text data
exec-once = wl-paste --type image --watch cliphist store # Stores only image data
exec-once = rm -f $WOBSOCK && mkfifo $WOBSOCK && tail -f $WOBSOCK | wob # indicator tool


# Source a file (multi-file configs)
# source = ~/.config/hypr/myColors.conf

# Some default env vars.
env = XCURSOR_SIZE,14

# For all categories, see https://wiki.hyprland.org/Configuring/Variables/
input {
    kb_layout = us
    kb_variant =
    kb_model =
    kb_options =
    kb_rules =

    follow_mouse = 1

    touchpad {
        natural_scroll = no
    }

    sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
}

general {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    gaps_in = 5
    gaps_out = 20
    border_size = 2
    col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
    col.inactive_border = rgba(595959aa)

    layout = dwindle

    # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
    allow_tearing = false
}

decoration {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more

    rounding = 10
    
    blur {
        enabled = true
        size = 3
        passes = 1
    }

    drop_shadow = yes
    shadow_range = 4
    shadow_render_power = 3
    col.shadow = rgba(1a1a1aee)
}

animations {
    enabled = yes

    # Some default animations, see https://wiki.hyprland.org/Configuring/Animations/ for more

    bezier = myBezier, 0.05, 0.9, 0.1, 1.05

    animation = windows, 1, 7, myBezier
    animation = windowsOut, 1, 7, default, popin 80%
    animation = border, 1, 10, default
    animation = borderangle, 1, 8, default
    animation = fade, 1, 7, default
    animation = workspaces, 1, 6, default
}

dwindle {
    # See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
    pseudotile = yes # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
    preserve_split = yes # you probably want this
}

master {
    # See https://wiki.hyprland.org/Configuring/Master-Layout/ for more
    new_on_active = true
}

gestures {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    workspace_swipe = off
}

misc {
    # See https://wiki.hyprland.org/Configuring/Variables/ for more
    force_default_wallpaper = -1 # Set to 0 to disable the anime mascot wallpapers
}

# Example per-device config
# See https://wiki.hyprland.org/Configuring/Keywords/#executing for more
device:epic-mouse-v1 {
#    sensitivity = -0.5
}

# Example windowrule v1
# windowrule = float, ^(kitty)$
# Example windowrule v2
# windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
# See https://wiki.hyprland.org/Configuring/Window-Rules/ for more


#-----------------------#
#       key-binds       #
#-----------------------#

# Screenlock
bind = $mainMod SHIFT, L, exec, hyprlock

# Start Launcher
bind = $mainMod, D, exec, wofi --show drun -I
bind = $mainMod SHIFT, E, exec, wlogout -b 4

# Start Terminal
bind = $mainMod, Return,  exec, alacritty

# Full Screen Window
bind = $mainMod, F, fullscreen

# Floating Window
bind = $mainMod SHIFT, F, togglefloating

# Volume
bind = , XF86AudioRaiseVolume, exec, pamixer -i 10 && pamixer --get-volume > $WOBSOCK
bind = , XF86AudioLowerVolume, exec, pamixer -d 10 && pamixer --get-volume > $WOBSOCK
bind = , XF86AudioMute, exec, pamixer -t && ( pamixer --get-mute && echo 0 > $WOBSOCK ) || pamixer --get-volume > $WOBSOCK

# Volume Source
bind = SHIFT, XF86AudioRaiseVolume, exec, pamixer --default-source -i 10 && pamixer --default-source --get-volume > $WOBSOCK
bind = SHIFT, XF86AudioLowerVolume, exec, pamixer --default-source -d 10 && pamixer --default-source --get-volume > $WOBSOCK
bind = SHIFT, XF86AudioMute, exec, pamixer --default-source -t && ( pamixer --default-source --get-mute && echo 0 > $WOBSOCK ) || pamixer --default-source --get-volume > $WOBSOCK

# Example binds, see https://wiki.hyprland.org/Configuring/Binds/ for more
bind = $mainMod SHIFT, Q, killactive

# Screen Shot
bind = , PRINT, exec, grimblast --notify copy area | wl-paste -t image/png > ~/Pictures/Screenshots/$(date "+%Y%m%d-%H%M%S")'_grim_area.png'

# Clipman
#bind = $mainMod SHIFT, P, exec, clipman pick -t wofi
bind = $mainMod SHIFT, P, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy

# Move focus with mainMod + arrow keys
bind = $mainMod, left, movefocus, l
bind = $mainMod, right, movefocus,r
bind = $mainMod, up, movefocus, u
bind = $mainMod, down, movefocus, d

# Move focus with mainMod + arrow keys
bind = $mainMod SHIFT, left, movewindow, l
bind = $mainMod SHIFT, right, movewindow,r
bind = $mainMod SHIFT, up, movewindow, u
bind = $mainMod SHIFT, down, movewindow, d

# Switch workspaces with mainMod + [0-9]
bind = $mainMod, 1, workspace, 1
bind = $mainMod, 2, workspace, 2
bind = $mainMod, 3, workspace, 3
bind = $mainMod, 4, workspace, 4
bind = $mainMod, 5, workspace, 5
bind = $mainMod, 6, workspace, 6
bind = $mainMod, 7, workspace, 7
bind = $mainMod, 8, workspace, 8
bind = $mainMod, 9, workspace, 9
bind = $mainMod, 0, workspace, 10

# Move active window to a workspace with mainMod + SHIFT + [0-9]
bind = $mainMod SHIFT, 1, movetoworkspace, 1
bind = $mainMod SHIFT, 2, movetoworkspace, 2
bind = $mainMod SHIFT, 3, movetoworkspace, 3
bind = $mainMod SHIFT, 4, movetoworkspace, 4
bind = $mainMod SHIFT, 5, movetoworkspace, 5
bind = $mainMod SHIFT, 6, movetoworkspace, 6
bind = $mainMod SHIFT, 7, movetoworkspace, 7
bind = $mainMod SHIFT, 8, movetoworkspace, 8
bind = $mainMod SHIFT, 9, movetoworkspace, 9
bind = $mainMod SHIFT, 0, movetoworkspace, 10

# Example special workspace (scratchpad)
bind = $mainMod, S, togglespecialworkspace, magic
bind = $mainMod SHIFT, S, movetoworkspace, special:magic

# Scroll through existing workspaces with mainMod + scroll
bind = $mainMod, mouse_down, workspace, e+1
bind = $mainMod, mouse_up, workspace, e-1

# Move/resize windows with mainMod + LMB/RMB and dragging
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Move/resize windows
bindm = $mainMod, mouse:272, movewindow
bindm = $mainMod, mouse:273, resizewindow

# Window resize mode
bind = $mainMod SHIFT, R, submap, resize
submap = resize
binde = , right, resizeactive, 10 0
binde = , left, resizeactive, -10 0
binde = , up, resizeactive, 0 -10
binde = , down, resizeactive, 0 10
bind = , escape, submap, reset
submap = reset

''
