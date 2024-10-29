vim.g.mapleader = " "

local keymap = vim.keymap

-- Shift + arrow keys to select text
keymap.set('i', '<S-Up>', '<Esc>v<Up>i', { noremap = true, silent = true })
keymap.set('i', '<S-Down>', '<Esc>v<Down>i', { noremap = true, silent = true })
keymap.set('i', '<S-Left>', '<Esc>v<Left>i', { noremap = true, silent = true })
keymap.set('i', '<S-Right>', '<Esc>v<Right>i', { noremap = true, silent = true })
keymap.set('n', '<S-Up>', 'v<Up>', { noremap = true, silent = true })
keymap.set('n', '<S-Down>', 'v<Down>', { noremap = true, silent = true })
keymap.set('n', '<S-Left>', 'v<Left>', { noremap = true, silent = true })
keymap.set('n', '<S-Right>', 'v<Right>', { noremap = true, silent = true })
keymap.set('v', '<S-Up>', '<Up>', { noremap = true, silent = true })
keymap.set('v', '<S-Down>', '<Down>', { noremap = true, silent = true })
keymap.set('v', '<S-Left>', '<Left>', { noremap = true, silent = true })
keymap.set('v', '<S-Right>', '<Right>', { noremap = true, silent = true })

-- Option (Alt) + Up/Down to move text
keymap.set('i', '<A-Up>', '<Esc>:m .-2<CR>==gi', { noremap = true, silent = true })
keymap.set('i', '<A-Down>', '<Esc>:m .+1<CR>==gi', { noremap = true, silent = true })
keymap.set('n', '<A-Up>', ':m .-2<CR>==', { noremap = true, silent = true })
keymap.set('n', '<A-Down>', ':m .+1<CR>==', { noremap = true, silent = true })
keymap.set('v', '<A-Up>', ':m \'<-2<CR>gv=gv', { noremap = true, silent = true })
keymap.set('v', '<A-Down>', ':m \'>+1<CR>gv=gv', { noremap = true, silent = true })

keymap.set("n", "<leader>a", "ggVG")
keymap.set("n", "<leader>c", '"*y')
keymap.set("n", "<leader>v", '"+p')

keymap.set("n", "x", '"_x') -- Dont copy cut text

-- Window splits
keymap.set("n", "<leader>d", "<C-w>v") -- Split vertically
keymap.set("n", "<leader>s", ":split<CR>:term<CR>") -- Split horizontally
keymap.set("n", "<leader>x", ":close<CR>") -- Close current split window
keymap.set("n", "<leader>z", "<C-w>=") -- Make split window 50/50

-- Tabs
keymap.set("n", "<leader>t", ":tabnew<CR>") -- Open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- Close current tab
keymap.set("n", "<leader><Tab>", ":tabn<CR>") -- Tab cycle

-- plugin keymaps
keymap.set("n", "<leader>m", ":MaximizerToggle<CR>") -- Maximizer
keymap.set("n", "<leader>n", ":NvimTreeToggle<CR>") -- Open/Close filetree

-- Navigator keymaps
keymap.set("n", "<leader><Left>", ":TmuxNavigateLeft<CR>")
keymap.set("n", "<leader><Right>", ":TmuxNavigateRight<CR>")
keymap.set("n", "<leader><Up>", ":TmuxNavigateUp<CR>")
keymap.set("n", "<leader><Down>", ":TmuxNavigateDown<CR>")

-- telescope
keymap.set('n', '<leader>f', require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true })
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>")

-- Save and run Makefile
keymap.set("n", "<leader>b", ":w<CR>:!./compile.sh<CR>")

-- Save and close file
keymap.set("n", "<leader>w", ":w!<CR>")
keymap.set("n", "<leader>q", ":q<CR>")
