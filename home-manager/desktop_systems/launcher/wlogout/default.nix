{pkgs, ...}: {
  programs.wlogout = {
      enable = true;
      layout = [
        {
          label = "lock";
          action = "swaylock -f";
          text = "Lock";
          keybind = "l";
        }
        {
          label = "logout";
          action = "killall -9 Hyprland sleep 2";
          text = "Exit";
          keybind = "e";
        }
        {
          label = "shutdown";
          action = "systemctl poweroff";
          text = "Shutdown";
          keybind = "s";
        }
        {
          label = "reboot";
          action = "systemctl reboot";
          text = "Reboot";
          keybind = "r";
        }
      ];
  };
}
