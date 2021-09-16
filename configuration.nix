# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.ens33.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "us";
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;


  # Enable the Plasma 5 Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.displayManager.defaultSession = "none+awesome";
  services.xserver.windowManager = {
    #enable qtile
    qtile.enable = true;
    
    # xmonad config
    xmonad.enable = true;
    xmonad.enableContribAndExtras = true;
    xmonad.extraPackages = hpkgs: [
      hpkgs.xmonad
      hpkgs.xmonad-contrib
      hpkgs.xmonad-extras
    ] ;
    #
    # Awesome config
    awesome.enable = true;
    awesome.luaModules = with pkgs.luaPackages; [
      luarocks
      luadbi-mysql
    ];
  } ;
  programs.dconf.enable = true;
  # environment.systemPackages = with pkgs; [ gnomeExtensions.appindicator ];
  services.udev.packages = with pkgs; [ gnome3.gnome-settings-daemon ];
  # environment.systemPackages = [ gnome3.adwaita-icon-theme ];
  services.dbus.packages = with pkgs; [ gnome2.GConf ];

  # Configure keymap in X11
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.hkdevs = {
    isNormalUser = true;
    extraGroups = [ "wheel"]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  };
  

    
  nixpkgs.config.allowUnfree = true; 

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
   # command line and terminal 
    wget
    git 
    alacritty
    fish
    zsh
    kitty
    gnome.gnome-terminal 
    termite
    mate.mate-terminal
    
    #terminal apps 
    conky
    fzf
    fzf-zsh
    ranger
    tmux
    tmux-cssh
    lazygit
    cava 
    bpytop
    htop
    

    # text editor
    vim 
    neovim
    emacs
    notepadqq
    

    # gui programs
    xfce.thunar
    xfce.thunar-volman
    gnome.nautilus
    firefox
    brave
    qutebrowser
    gnome.geary  # mail client
    zip
    mate.engrampa
    gzip
    #image viewer
    nomacs
    gthumb
    # gimp conf
    gimp
    gimp-with-plugins
    gimpPlugins.gap
    gimpPlugins.gmic    
    mpv
    audacity
    vlc
    xorg.xdm
    xorg.xkill
    xsettingsd
    # office suites
    libreoffice
    wpsoffice
    # If running in Virtual Machine then only uncomment it or else do not uncomment it if using in physical system
    open-vm-tools
    # window manager and related stuff
    xmobar
    nitrogen
    picom 
    dmenu
    rofi
    polybar
    tint2
   
    # communication
    teams  # microsoft teams for linux
    zoom-us # zoom meetings

    # code editors
    vscode
    jetbrains.idea-community
    jetbrains.pycharm-community
    android-studio
    android-file-transfer
    adb-sync
    apktool
    sublime3
    sublime-merge
    geany
    neovide


    #terminal colors higlights
    lolcat
    exa
    colorls

    # utils
    clipman
    trayer
    gtk2
    gtk3
    gtk4
    unixtools.whereis
    xfce.xfce4-settings
    qt4
    qt5ct
    tor
    #tor-browser-bundle-bin
    
 
    # sound control
    pulseaudio
    pulseaudioFull
    pulseaudio-ctl
    paprefs
    pasystray
    pavucontrol
    pamix
    apulse # alsa pulseaudio control
    pamixer
    pulsemixer
    
    #fonts
    font-manager
    redhat-official-fonts
    powerline-fonts
    noto-fonts-extra
    noto-fonts-emoji
    noto-fonts
    cantarell-fonts
    mononoki

    #custom themes , icons and cursors ui tweaks
    
    #icons
    luna-icons
    nixos-icons
    weather-icons
    material-icons
    material-design-icons
    emacs-all-the-icons-fonts    

    #cursors
    bibata-cursors
    openzone-cursors
    capitaine-cursors
    bibata-extra-cursors

    #network
    networkmanager
    # gnome dconf edits
    dconf
    dconf2nix
    gnome.dconf-editor
    gnomeExtensions.appindicator
    gnome.gnome-chess
    gnome.gnome-tweaks
    gnome3.gnome-tweaks
    gnomeExtensions.tray-icons
    gnomeExtensions.activities-icons


    #programming languages
    gcc
    openjdk
    cmake 
    libllvm
    llvm
    kotlin 
    python39
    dotnet-sdk
    dotnet-sdk_5
    dotnet-sdk_3
    dotnet-netcore
    dotnet-aspnetcore



  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?

}

