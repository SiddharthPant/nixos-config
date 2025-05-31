{pkgs, ...}: {
  # Dconf settings (Gnome preferences)
  dconf = {
    enable = true;
    settings = {
      "org/gnome/desktop/privacy" = {
        report-technical-problems = false;
      };

      "org/gnome/mutter" = {
        experimental-features = ["scale-monitor-framebuffer" "xwayland-native-scaling"];
      };

      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        picture-options = "zoom";
        picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/fold-l.jxl";
        picture-uri-dark = "file:///run/current-system/sw/share/backgrounds/gnome/fold-d.jxl";
      };

      "org/gnome/desktop/screensaver" = {
        color-shading-type = "solid";
        picture-options = "zoom";
        picture-uri = "file:///run/current-system/sw/share/backgrounds/gnome/fold-l.jxl";
      };

      "org/gnome/desktop/wm/preferences" = {
        button-layout = "appmenu:minimize,maximize,close";
      };

      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          net-speed-simplified.extensionUuid
          caffeine.extensionUuid
          clipboard-indicator.extensionUuid
          tiling-shell.extensionUuid
        ];

        favorite-apps = [
          "google-chrome.desktop"
          "kitty.desktop"
          "org.gnome.Nautilus.desktop"
          "org.gnome.Settings.desktop"
          "org.gnome.Calculator.desktop"
        ];
      };

      # Net Speed Simplified settings
      "org/gnome/shell/extensions/netspeedsimplified" = {
        chooseiconset = 2;
        fontmode = 2;
        iconstoright = false;
        isvertical = true;
        lockmouseactions = true;
        mode = 3;
        restartextension = false;
        reverseindicators = true;
        shortenunits = true;
        textalign = 1;
        togglebool = false;
      };

      # Tiling Shell settings
      "org/gnome/shell/extensions/tilingshell" = {
        enable-autotiling = false;
        # last-version-name-installed = "16.4";
        layouts-json = ''[{"id":"Layout 1","tiles":[{"x":0,"y":0,"width":0.22,"height":0.5,"groups":[1,2]},{"x":0,"y":0.5,"width":0.22,"height":0.5,"groups":[1,2]},{"x":0.22,"y":0,"width":0.56,"height":1,"groups":[2,3]},{"x":0.78,"y":0,"width":0.22,"height":0.5,"groups":[3,4]},{"x":0.78,"y":0.5,"width":0.22,"height":0.5,"groups":[3,4]}]},{"id":"Layout 2","tiles":[{"x":0,"y":0,"width":0.22,"height":1,"groups":[1]},{"x":0.22,"y":0,"width":0.56,"height":1,"groups":[1,2]},{"x":0.78,"y":0,"width":0.22,"height":1,"groups":[2]}]},{"id":"Layout 3","tiles":[{"x":0,"y":0,"width":0.33,"height":1,"groups":[1]},{"x":0.33,"y":0,"width":0.67,"height":1,"groups":[1]}]},{"id":"Layout 4","tiles":[{"x":0,"y":0,"width":0.67,"height":1,"groups":[1]},{"x":0.67,"y":0,"width":0.33,"height":1,"groups":[1]}]},{"id":"169729","tiles":[{"x":0,"y":0,"width":0.5,"height":1,"groups":[1]},{"x":0.5,"y":0,"width":0.4999999999999999,"height":1,"groups":[1]}]},{"id":"239283","tiles":[{"x":0,"y":0,"width":0.5,"height":1,"groups":[1]},{"x":0.5,"y":0,"width":0.49999999999999967,"height":0.5,"groups":[2,1]},{"x":0.5,"y":0.5,"width":0.49999999999999967,"height":0.49999999999999956,"groups":[2,1]}]},{"id":"326315","tiles":[{"x":0,"y":0,"width":0.5,"height":0.5,"groups":[1,2]},{"x":0.5,"y":0,"width":0.4999999999999999,"height":0.5,"groups":[3,1]},{"x":0,"y":0.5,"width":0.5,"height":0.5,"groups":[2,1]},{"x":0.5,"y":0.5,"width":0.4999999999999999,"height":0.5,"groups":[3,1]}]}]'';
        overridden-settings = ''{"org.gnome.mutter.keybindings":{"toggle-tiled-right":"['<Super>Right']","toggle-tiled-left":"['<Super>Left']"},"org.gnome.desktop.wm.keybindings":{"maximize":"['<Super>Up']","unmaximize":"['<Super>Down', '<Alt>F5']"},"org.gnome.mutter":{"edge-tiling":"true"}}'';
        selected-layouts = [["239283"] ["239283"]];
      };
    };
  };
}
