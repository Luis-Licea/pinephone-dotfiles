{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "alarm";
  home.homeDirectory = "/home/alarm";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    (pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; })
    bat
    bat-extras.batman
    brave
    castor
    ffmpeg
    font-awesome
    glide-media-player
    gnome.polari
    helix
    nil
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    sshfs
    tldr
    vlc
    w3m

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];
  fonts.fontconfig.enable = true;
  dconf.settings = {
      "org/gnome/desktop/interface" = {
          color-scheme = "prefer-dark";
          monospace-font-name = "FiraCode Nerd Font Mono"; # Noto Sans Mono
          sans-serif-font-name = "Noto Sans";
          serif-font-name = "Noto Serif";

      };
  };
  programs = {
    starship.enable = true;
    neovim = {
      enable = true;
      defaultEditor = true;
    };
    zsh = {
      enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        plugins = ["vi-mode" "git"];
      };
    };
    # Run Zsh instead of Bash.
    bash = {
        enable = true;
        initExtra = ''
            exec zsh
        '';
        shellAliases = config.programs.zsh.shellAliases;
    };
    git = {
        enable = true;
        userEmail = "luislicea1011@hotmail.com";
        userName = "Luis David Licea Torres";
    };
  };

  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;
    ".w3m/mailcap".text = ''
        image/*; eog %s
    '';
    ".config/nvim/init.lua".text = ''
        --------------------------------------------------------------------------------
        -- Essential Mappings.
        --------------------------------------------------------------------------------
        vim.g.mapleader = ' '
        vim.g.maplocalleader = ';'
        vim.g.loaded_python3_provider = 0
        vim.g.loaded_ruby_provider = 0
        vim.g.loaded_perl_provider = 0
        vim.g.loaded_node_provider = 0
        --------------------------------------------------------------------------------
        -- Change temporary file locations.
        --------------------------------------------------------------------------------
        local tmp_dir = '/tmp'
        vim.fn.setenv('XDG_STATE_HOME', tmp_dir)
        local state_dir = tmp_dir .. '/nvim'
        vim.opt.undodir = state_dir .. '/undo'
        vim.opt.undofile = true
        vim.opt.directory = state_dir .. '/swap'
        --------------------------------------------------------------------------------
        -- Interface.
        --------------------------------------------------------------------------------
        vim.o.clipboard = 'unnamed,unnamedplus'
        vim.o.colorcolumn = '81,101,121'
        vim.o.mouse = 'a'
        vim.o.termguicolors = true
        vim.o.conceallevel = 1
        vim.o.textwidth = 80
        vim.opt.cursorline = true
        --------------------------------------------------------------------------------
        -- Tabs & spaces.
        --------------------------------------------------------------------------------
        vim.o.expandtab = true
        vim.o.shiftwidth = 4
        vim.o.softtabstop = 4
        vim.o.tabstop = 4
        --------------------------------------------------------------------------------
        -- Other.
        --------------------------------------------------------------------------------
        vim.o.langmap =
            'йЙцЦуУкКеЕнНгГшШщЩзЗхХъЪфФыЫвВаАпПрРоОлЛдДжЖэЭяЯчЧсСмМиИтТьЬбБюЮ\\,;qQwWeErRtTyYuUiIoOpP[{]}aAsSdDfFgGhHjJkKlL;:\'"zZxXcCvVbBnNmM\\,<.>?'
        vim.o.history = 200
        vim.o.ignorecase = true
        vim.o.smartcase = vim.o.ignorecase
        vim.o.spell = true
        vim.opt.listchars = {
            -- eol = '↴',
            -- extends = '◣',
            -- nbsp = "␣",
            -- precedes = '◢',
            -- space = '⋅',
            -- trail = "·",
            extends = '…',
            leadmultispace = ' ', -- ...but don't show any when they're at the start
            multispace = '·', -- show chars if I have multiple spaces between text
            nbsp = '○',
            precedes = '…',
            tab = '◃―▹',
            trail = '●',
        }
        vim.o.list = true
        vim.o.cindent = true
        vim.o.autochdir = vim.fn.system('git rev-parse --is-inside-work-tree') ~= 'true'
        vim.o.shell = 'zsh'
        vim.o.path = vim.o.path .. '**'
    '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/alarm/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    # EDITOR = "hx";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
