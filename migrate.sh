#!env bash
ln -s ~/.config/home-manager/apps/conf/nvim ~/.config/nvim
sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.old
sudo mv /etc/nixos/hardware-configuration.nix /etc/nixos/hardware-configuration.nix.old
sudo ln -s ~/.config/home-manager/configuration.nix /etc/nixos/configuration.nix
sudo ln -s ~/.config/home-manager/hardware-configuration.nix /etc/nixos/hardware-configuration.nix

#git setup
git config --global user.email "hdayi@hotmail"
git config --global user.name "HACI DAYI"
