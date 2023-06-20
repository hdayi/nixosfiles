{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;
    enableSyntaxHighlighting = true;
    shellAliases = {
      v = "nvim";
      ls = "exa --icons";
      la = "ls -lh";
      ll = "ls -lh";
      l = "ls -alh";
      rn = "ranger";
      du = "gdu";
      };
    oh-my-zsh = {
      enable = true;
      plugins = [];
      theme = "agnoster";
    };
    initExtra = ''
      bindkey '^f' autosuggest-accept
        export ANDROID_HOME=$HOME/Android/Sdk
        export GOROOT=~/.nix-profile/bin/go
        export GOPATH=$HOME/go

        export PATH=$PATH:~/.config/home-manager/bin
        export PATH=$PATH:~/.local/bin:$GOPATH/bin:$GOROOT/bin
        export PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools$ANDROID_HOME/cmdline-tools/latest/bin
        export PATH=$PATH:$ANDROID_HOME/emulator:$ANDROID_HOME/tools/bin
        ~/.config/home-manager/bin/fs.py
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };
}
