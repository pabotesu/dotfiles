{pkgs, ...}: {
  home.packages = with pkgs; [wofi wofi-emoji];
  home.file.".config/wofi/style.css".text = ''
    * {
      font-family: Nova Flat;
      font-size: 20;
    }

    window {
      margin: 0px;
      border: 4px solid #373b41;
      background-color: #1d1f21;
      border-radius: 5;
    }

    #input {
      margin: 5px;
      padding: 5px;
      border: none;
      color: #8abeb7;
      background-color: #282a2e;
    }

    #inner-box {
      margin: 5px;
      border: none;
      background-color: #282a2e;
    }

    #outer-box {
      margin: 5px;
      border: none;
      background-color: #1d1f21;
    }

    #scroll {
      margin: 0px;
      border: none;
    }

    #text {
      margin: 15px;
      border: none;
      color: #8abeb7;
    }

    #entry {
      margin: 5px;
      background-color: #282a2e;
      border: none; 
    }

    #entry:selected {
      background-color: #373b41;
      border: none; 
      outline-style: none;
      color: #c5c8c6;
    }
  '';
}
