vim.g.mapleader = " "

local keymap = vim.keymap

-- general keymaps
keymap.set("i", "<C-Left>", "v:lua.mark_line('start')", { expr = true })
keymap.set("i", "<C-Right>", "v:lua.mark_line('end')", { expr = true })
keymap.set("n", "<C-Left>", "v:lua.mark_line('start')", { expr = true })
keymap.set("n", "<C-Right>", "v:lua.mark_line('end')", { expr = true })

keymap.set("i", "<S-Left>", "v:lua.mark_line('left')", { expr = true })
keymap.set("i", "<S-Right>", "v:lua.mark_line('right')", { expr = true })
keymap.set("n", "<S-Left>", "v:lua.mark_line('left')", { expr = true })
keymap.set("n", "<S-Right>", "v:lua.mark_line('right')", { expr = true })

keymap.set("i", "<S-Up>", "v:lua.mark_line('up')", { expr = true })
keymap.set("n", "<S-Up>", "v:lua.mark_line('up')", { expr = true })
keymap.set("i", "<S-Down>", "v:lua.mark_line('down')", { expr = true })
keymap.set("n", "<S-Down>", "v:lua.mark_line('down')", { expr = true })

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
keymap.set("n", "<leader>b", ":w<CR>:make<CR>")
