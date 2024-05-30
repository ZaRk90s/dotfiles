{ config, pkgs, ... }:

{
  users.users.zark90s = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  users.extraUsers.zark90s = {
    shell = pkgs.zsh;
  };
}
