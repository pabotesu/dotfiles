{
  services.xserver = {
    enable = true;
    autoRepeatDelay = 300;
    autoRepeatInterval = 30;
  };
  services.libinput = {
      enable = true;
      mouse.accelProfile = "flat";
  };
}
