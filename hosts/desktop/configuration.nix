# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).
{
  config,
  pkgs,
  ...
}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        consoleMode = "max";
      };
      efi.canTouchEfiVariables = true;
    };
    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_6_14;
  };

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = ["en_IN/UTF-8"];

    extraLocaleSettings = {
      LC_ALL = "en_US.UTF-8";
      LC_CTYPE = "en_US.UTF8";
      LC_ADDRESS = "en_IN";
      LC_IDENTIFICATION = "en_IN";
      LC_MEASUREMENT = "en_IN";
      LC_MONETARY = "en_IN";
      LC_NAME = "en_IN";
      LC_NUMERIC = "en_IN";
      LC_PAPER = "en_IN";
      LC_TELEPHONE = "en_IN";
      LC_TIME = "en_IN";
    };
  };

  fileSystems = {
    "/mnt/DataDrive" = {
      device = "/dev/disk/by-label/DataDrive";
      fsType = "auto";
      options = ["nosuid" "nodev" "nofail" "x-gvfs-show"];
    };

    "/mnt/BigBang" = {
      device = "/dev/disk/by-label/BigBang";
      fsType = "auto";
      options = ["nosuid" "nodev" "nofail" "x-gvfs-show"];
    };
  };

  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
      flags = ["--all"];
    };
  };

  hardware = {
    # Enable OpenGL
    graphics.enable = true;
    openrazer = {
      enable = true;
      users = ["sid"];
    };

    nvidia-container-toolkit.enable = true;
    nvidia = {
      # Modesetting is required.
      modesetting.enable = true;

      # Nvidia power management. Experimental, and can cause sleep/suspend to fail.
      # Enable this if you have graphical corruption issues or application crashes after waking
      # up from sleep. This fixes it by saving the entire VRAM memory to /tmp/ instead
      # of just the bare essentials.
      powerManagement.enable = true;

      # Fine-grained power management. Turns off GPU when not in use.
      # Experimental and only works on modern Nvidia GPUs (Turing or newer).
      powerManagement.finegrained = false;

      # Use the NVidia open source kernel module (not to be confused with the
      # independent third-party "nouveau" open source driver).
      # Support is limited to the Turing and later architectures. Full list of
      # supported GPUs is at:
      # https://github.com/NVIDIA/open-gpu-kernel-modules#compatible-gpus
      # Only available from driver 515.43.04+
      open = true;

      # Enable the Nvidia settings menu,
      # accessible via `nvidia-settings`.
      nvidiaSettings = true;

      # Optionally, you may need to select the appropriate driver version for your specific GPU.
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  services = {
    udev.packages = with pkgs; [gnome-settings-daemon openrazer-daemon];
    # Enable the X11 windowing system.
    xserver = {
      enable = true;

      # Load nvidia driver for Xorg and Wayland
      videoDrivers = ["nvidia"];

      # Enable the GNOME Desktop Environment.
      displayManager.gdm.enable = true;
      desktopManager.gnome = {
        enable = true;
        extraGSettingsOverridePackages = [
          pkgs.mutter
        ];
        extraGSettingsOverrides = ''
          [org.gnome.mutter]
          experimental-features=['scale-monitor-framebuffer', 'xwayland-native-scaling']
        '';
      };
      # Configure keymap in X11
      xkb = {
        layout = "us";
        variant = "";
      };
    };
    # Enable CUPS to print documents.
    printing.enable = true;

    # Enable sound with pipewire.
    pulseaudio.enable = false;

    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # xserver.libinput.enable = true;
  };

  security.rtkit.enable = true;

  users.groups.plugdev = {};

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sid = {
    isNormalUser = true;
    description = "Siddharth Pant";
    extraGroups = ["networkmanager" "wheel" "plugdev" "docker"];
    shell = pkgs.zsh;
  };

  # Install firefox.
  programs.firefox.enable = true;

  # Install zsh.
  programs.zsh.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment = {
    systemPackages = with pkgs;
      [
        vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
        wget
        (google-chrome.override {
          commandLineArgs = [
            "--enable-features=AcceleratedVideoEncoder,VaapiOnNvidiaGPUs,VaapiIgnoreDriverChecks,Vulkan,DefaultANGLEVulkan,VulkanFromANGLE"
            "--enable-features=VaapiIgnoreDriverChecks,VaapiVideoDecoder,PlatformHEVCDecoderSupport"
            "--enable-features=UseMultiPlaneFormatForHardwareVideo"
            "--ignore-gpu-blocklist"
            "--enable-zero-copy"
            "--ozone-platform=wayland"
          ];
        })
        neovim
        git
        eza
        vlc
        fzf
        ripgrep
        libreoffice-fresh
        kitty
        tmux
        tldr
        zoxide
        bat
        lazygit
        openrazer-daemon
        polychromatic
        spotify
        fastfetch
        unzip
        unrar
        zip
        obsidian
        vscode
        nodejs_22
        python313
        nvtopPackages.nvidia
        btop
        htop
        gcc
        gnumake
        kubectl
        eks-node-viewer
        awscli2
        k9s
        whatsapp-for-linux
        postgresql_17
        redis
        gnome-tweaks
        dconf-editor
        notion-app
      ]
      ++ (with pkgs.gnomeExtensions; [
        appindicator
        net-speed-simplified
        caffeine
        clipboard-indicator
        tiling-shell
      ]);

    shells = with pkgs; [bash zsh];
  };

  fonts.packages = with pkgs; [
    maple-mono.NF-unhinted
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
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = ["nix-command" "flakes"];
    };
  };

  # Enable automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1m";
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
