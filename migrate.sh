#!env bash
sudo mv /etc/nixos/configuration.nix /etc/nixos/configuration.nix.old
#link calismiyor flake yapmak lazim
sudo ln -s ~/.config/home-manager/configuration.nix /etc/nixos/configuration.nix

##system setup
sudo nixos-rebuild switch
sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.05.tar.gz home-manager
sudo nix-channel --update
sudo nix-shell '<home-manager>' -A install
home-manager switch

#dot files
ln -s ~/.config/home-manager/apps/conf/nvim ~/.config/nvim
ln -s ~/.config/home-manager/apps/conf/kitty/kitty.conf ~/.config/kitty/kitty.conf

#git setup
git config --global user.email "hdayi@hotmail"
git config --global user.name "HACI DAYI"
git config --global credential.helper store
