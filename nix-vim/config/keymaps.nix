{
  keymaps = [
    { action = "<Nop>"; key = "<Space>"; options = { silent = true; }; mode = [ "n" "v" ]; }
    { action = ">gv"; key = ">"; mode = [ "v" ]; }
    { action = "<gv"; key = "<"; mode = [ "v" ]; }
    { action = "<C-o>$"; key = "<A-e>"; options = { silent = true; }; mode = [ "i" ]; }
    { action = "<C-o>A;<ESC>"; key = "<A-;>"; options = { silent = true; }; mode = [ "i" ]; }
    { action = "<C-o>A;<ESC>"; key = "<A-;>"; options = { silent = true; }; mode = [ "i" ]; }
    { action = "A;<ESC>"; key = "<A-;>"; options = { silent = true; }; mode = [ "n" ]; }
    { action = "A;<ESC>"; key = "<A-;>"; options = { silent = true; }; mode = [ "n" ]; }
    { action = "<cmd>w<cr><esc>"; key = "<C-s>"; options = { desc = "Save file"; }; mode = [ "i" "x" "n" "s" ]; }
    { action = "<cmd>bn<cr>"; key = "<leader>bn"; options = { desc = "Next Buffer"; }; mode = [ "n" ]; }
    { action = "<cmd>bp<cr>"; key = "<leader>bp"; options = { desc = "Prev Buffer"; }; mode = [ "n" ]; }
    { action = "<cmd>e %<CR>"; key = "<leader>br"; options = { desc = "Reload Buffer"; }; mode = [ "n" ]; }
    {
      action = ''[[ (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n" <BAR> redraw<CR>]]'';
      key = "'<leader>.'";
      options = {
        desc = "Toggle Highlight Search";
        silent = true;
        expr = true;
      };
      mode = [ "n" ];
    }
    # { mode = [ "n" ]; key = "k"; action = ''"v:count == 0 ? 'gk' : 'k'"<cr>''; options = { expr = true; silent = true; }; }
    # { mode = [ "n" ]; key = "j"; action = ''"v:count == 0 ? 'gj' : 'j'"<cr>''; options = { expr = true; silent = true; }; }
    { mode = [ "n" ]; key = "<C-d>"; action = "<C-d>zz"; }
    { mode = [ "n" ]; key = "<C-u>"; action = "<C-u>zz"; }
    { mode = [ "n" ]; key = "<C-f>"; action = "<C-f>zz"; }
    { mode = [ "n" ]; key = "<C-b>"; action = "<C-b>zz"; }
    { mode = [ "n" ]; key = "<C-o>"; action = "<C-o>zz"; }
    { mode = [ "n" ]; key = "<C-i>"; action = "<C-i>zz"; }
    { mode = [ "n" ]; key = "n"; action = "nzz"; }
    { mode = [ "n" ]; key = "N"; action = "Nzz"; }
    { mode = [ "n" ]; key = "[o"; action = "O<ESC>"; }
    { mode = [ "n" ]; key = "]o"; action = "o<ESC>"; }
    {
      action = "vim.diagnostic.goto_prev";
      key = "[d";
      lua = true;
      options.desc = "Go to previous diagnostic message";
      mode = [ "n" ];
    }
    {
      action = "vim.diagnostic.goto_next";
      key = "]d";
      lua = true;
      options.desc = "Go to next diagnostic message";
      mode = [ "n" ];
    }
  ];
}
# vim: sw=2 ts=2 et
#
# -- yank Prefix
# vim.keymap.set({ 'n', 'v' }, '<leader>yo', '"_dP', { desc = 'Paste Over' })
# vim.keymap.set({ 'n', 'v' }, '<leader>yp', '"+p', { desc = 'Paste System' })
# vim.keymap.set({ 'n', 'v' }, '<leader>yy', '"+y', { desc = 'Yank to System' })
# vim.keymap.set({ 'n', 'v' }, '<leader>yd', '"+d', { desc = 'Delete to System' })
#
# -- q Prefix
# vim.keymap.set({ 'n', 'v' }, '<leader>qq', '<cmd>cclose<cr>', { desc = 'Close QuickFix' })
#
# -- Buffer related
# vim.keymap.set('n', '<leader>ba', '<cmd>bufdo bd<cr>', { desc = 'Close All Buffers' })
#
# -- terminal mode maps
# vim.keymap.set('t', '<C-n>', [[<C-\><C-n>]], { noremap = true })
