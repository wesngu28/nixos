{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.username = "serpe";
  home.homeDirectory = "/home/serpe";

  home.stateVersion = "23.11"; # Please read the comment before changing.

  home.packages = with pkgs; [
    gimp
    vesktop
    obsidian
    jellyfin-media-player
    sqlitebrowser
    inputs.ataraxiasjel-nur.packages."x86_64-linux".waydroid-script
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.breeze-icons
    libsForQt5.qt5ct
    alejandra
    pamixer
    pavucontrol
    playerctl
    yazi
    lxqt.lxqt-policykit
    du-dust
    fastfetch
    wl-clipboard
    wget
    jq
    nicotine-plus
    bitwarden
    #veracrypt
  ];

  nixpkgs.config.allowUnfree = true;

  imports = [
    ./theme.nix
    ./xdg.nix
    ./programs/spotify.nix
    ./programs/firefox.nix
    ./programs/vscode.nix
    ./programs/vencord.nix
    ./cli/direnv.nix
    ./cli/git.nix
    ./cli/kitty/kitty.nix
    ./hypr/hyprland.nix
    ./waybar/waybar.nix
    ./cli/rofi.nix
    ./cli/zsh.nix
    ./cli/fastfetch.nix
    ./dunst/dunst.nix
    ./scripts/urlOpen.nix
  ];

  programs.bat = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.btop = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.fzf = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.imv = {
    enable = true;
    catppuccin.enable = true;
    settings.binds = {
      n = "next";
      p = "prev";
      w = "quit";
      "<Ctrl+plus>" = "zoom 1";
      "<Ctrl+minus>" = "zoom -1";
      "<Ctrl+equal>" = "zoom actual";
      y = ''exec wl-copy -t image/png < "$imv_current_file"'';
    };
  };

  programs.lazygit = {
    enable = true;
    catppuccin.enable = true;
  };

  programs.mpv = {
    enable = true;
    # catppuccin.enable = true;
    config = {
      save-position-on-quit = true;
    };
    bindings = {
      UP = "add volume 2";
      DOWN = "add volume -2";
    };
  };

  programs.zathura = {
    enable = true;
    catppuccin.enable = true;
  };

  # programs.zellij = {
  #   enable = true;
  #   catppuccin.enable = true;
  # };

  programs.home-manager.enable = true;
}
