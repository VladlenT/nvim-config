require("config.lazy");

vim.g.have_nerd_font = true;

-- Disabling because of "nerd-tree"
vim.g.loaded_netrw = 1;
vim.g.loaded_netrwPlugin = 1;

vim.o.autowriteall = true;
vim.opt.showmode = false;
vim.opt.background = 'dark';

vim.opt.breakindent = true;
vim.opt.expandtab = true;

vim.opt.clipboard = 'unnamedplus';

vim.opt.hlsearch = true
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

--
vim.opt.signcolumn = 'yes';

-- Reset search highligh on "Esc" in "Normal" mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')


-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

vim.opt.mouse = 'a';
vim.opt.number = true;

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

vim.opt.splitright = true;
vim.opt.splitbelow = true;
vim.opt.shiftwidth = 4;

-- Displays which-key popup sooner
vim.opt.timeoutlen = 500

vim.opt.undofile = true;
-- Decrease update time
vim.opt.updatetime = 250

-- Source current file
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>");

-- Execute lua script under cursor
vim.keymap.set("n", "<space>x", "<cmd>:.lua<CR>");

-- Execute lua script under selection
vim.keymap.set("v", "<space>x", "<cmd>:lua<CR>");

--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
