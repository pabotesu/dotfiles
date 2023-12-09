{pkgs, ...}: {
  imports = [
    ### commandline applications (shell & vim & git ...etc...) 
    ../../home-manager/cli_apps
    
    ### graphical applications (discord & terminal $ gaphical_editor ...etc...) 
    ../../home-manager/gui_apps
    
    ### desktop toools & service settings
    ../../home-manager/desktop_systems
  ];

}
