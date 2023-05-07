local map = vim.api.nvim_set_keymap
local opts = { noremap = trure, silent = true }

vim.g.mapleader = ' '

-- Insert --

-- Press jk fast to exit insert mode 
map("i", "jk", "<ESC>", opts)


-- Normal --
--
--NvimTree keymaps
map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)

--Telescope keymaps
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>bf', ':Telescope buffers<CR>', opts)
map('n', '<leader>hp', ':Telescope help_tags<CR>', opts)

map('n', '<leader>hp', ':Telescope help_tags<CR>', opts)

--Packer keymaps
map('n', '<leader>ps', ':PackerSync<CR>', opts)
map('n', '<leader>pc', ':PackerClean<CR>', opts)

--Git keymaps
map('n', '<leader>g', ':Neogit<CR>', opts)

--Formatting
map('n', '<leader>lf', ':lua vim.lsp.buf.formatting()<CR>', opts)

--Better navigation
map('n', '<C-h>', '<C-w>h', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)
map('n', '<C-l>', '<C-w>l', opts)


-- Visual --
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
