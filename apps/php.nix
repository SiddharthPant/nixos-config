# php.nix
{pkgs, ...}: let
  custom-php = pkgs.php84.buildEnv {
    extensions = {
      enabled,
      all,
    }:
      enabled
      ++ (with all; [
        imagick
        opcache
        redis
      ]);
    extraConfig = ''
      xdebug.mode = debug
      xdebug.start_with_request = trigger
      xdebug.client_port = 9003
    '';
  };
in {
  home.packages = [
    custom-php
    custom-php.packages.composer
  ];
}
