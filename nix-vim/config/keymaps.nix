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
  ];
}
# vim: sw=2 ts=2 et
