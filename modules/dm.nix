{
  pkgs,
  ...
}: {
     programs.regreet.enable = true;
     services.greeted ={
       enable =true;
       settings = {
         initial_session = {
         user = "pabotesu";
         command = "Hyprland";
         };
       };
     };
}
