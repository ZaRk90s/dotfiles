{ config, pkgs, ... }:

{
  users.extraUsers.root = {
    shell = pkgs.zsh;
  };
}
