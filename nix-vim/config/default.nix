{
  # Import all your configuration modules here
  imports = [
    ./options.nix
    ./colorscheme.nix
    ./keymaps.nix
  ];

  viAlias = true;
  vimAlias = true;
  withNodeJs = true;
  
# TODO: Do we need these?
#vim.wo.signcolumn = 'yes'
#vim.cmd [[ hi NotifyBackground guibg = #000000 ]]

  clipboard = {
    register = "unnamedplus";
    providers = {
      wl-copy.enable = true;
      xclip.enable = true;
    };
  };
}
# vim: ts=2 sw=2 et
