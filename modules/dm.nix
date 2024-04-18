{
  pkgs,
  ...
}: {
  services.greetd ={
       enable =true;
       settings = {
         default_session = {
         user = "pabotesu";
         command = "${pkgs.greetd.tuigreet}/bin/tuigreet --user-menu --time --cmd Hyprland";
         };
       };
     };
}
