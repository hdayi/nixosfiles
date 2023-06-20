{
  programs.tmux = {
    enable = true;
    clock24 = true;
    extraConfig = '' # used for less common options, intelligently combines if defined in multiple places.
          #Send prefix
            set-option -g prefix C-a
            unbind-key C-:
            bind-key C-a send-prefix
          
          
          #alt+ ok tuşlerı ile bölümler arası gezme
            bind -n M-Left select-pane -L
            bind -n M-Right select-pane -R
            bind -n M-Up select-pane -U
            bind -n M-Down select-pane -D
          
          #shift sağ ve sol ok ile pencere arası gezme
            bind -n S-Left previous-window
            bind -n S-Right next-window
          
          #add mouse support
            setw -g mouse on
          
          # " ve % yerine v ve h ile bölüm oluşturma prefix + v perfix + h
            bind-key c new-window -c '#{pane_current_path}'
            bind-key v split-window -h -c '#{pane_current_path}'
            bind-key h split-window -v -c '#{pane_current_path}'
          
          
          # reload config file
            bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf dosyası yüklendi"
          
          
          #renklendirme
          
          # pane border
            set -g pane-border-style fg='#6272a4'
            set -g pane-active-border-style fg='#dcf860'
          
          # message text
            set -g message-style bg='#44475a',fg='#8be9fd'
          
          #status line
            set -g status-style bg='#44475a',fg='#ffffff'
            set -g status-interval 1
          
          # status left
          # session name
            set -g status-left-length 80
            set -g status-left '#[bg=#263238]#[fg=#0288d1]#[bg=#0288d1]#[fg=#263238]#S#[bg=#263238]#[fg=#0288d1]'
          
          # are we controlling tmux or the content of the panes?
            set -ga status-left '#[bg=#dcf860]#[fg=#282a36]#{?client_prefix,#[bg=#ff79c6],} #W '
          
          # are we zoomed into a pane?
            set -ga status-left '#[bg=#44475a]#[fg=#ff79c6] #{?window_zoomed_flag, ↕  ,   }'
          
          # window status
            set-window-option -g window-status-style fg='#41bdb5',bg=default
            set-window-option -g window-status-current-style fg='#78fdf4',bg='#282a36'
          
            set -g window-status-current-format "#[fg=#44475a]#[bg=#41bdb5]#[fg=#f8f8f2]#[bg=#41bdb5] #I #W #[fg=#41bdb5]#[bg=#44475a]"
            set -g window-status-format "#[fg=#f8f8f2]#[bg=#44475a]#I #W #[fg=#44475a] "
          
          # status right
            set -g status-right '#[fg=#44475a,bg=#44475a]#[fg=#44475a,bg=#4475a]' #(tmux-mem-cpu-load -g 5 --interval 2) '
          # set -ga status-right '#[fg=#dcf860,bg=#8be9fd]#[fg=#44475a,bg=#dcf860] #(uptime | cut -f 4-5 -d " " | cut -f 1 -d ",") '
          #set -ga status-right '#[fg=#bd93f9,bg=#dcf860]#[fg=#f8f8f2,bg=#bd93f9] %a %H:%M:%S #[fg=#6272a4]%Y-%m-%d '
            set -ga status-right '#[fg=#dcf860,bg=#44475a]#[fg=#44475a,bg=#dcf860] %a %H:%M:%S #[fg=#6272a4]%Y-%m-%d '
          
          #status bar on top
            set-option -g status-position top
          
            set-option -sg escape-time 10
    '';
  };
}
