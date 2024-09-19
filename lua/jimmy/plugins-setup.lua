-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  
  -- General plugins
  use("wbthomason/packer.nvim") -- Packer
  use ("williamboman/mason.nvim") -- Mason
  use("williamboman/mason-lspconfig.nvim") -- Mason LSP
  use("neovim/nvim-lspconfig") -- LSP Config
  use("williamboman/nvim-lsp-installer") -- LSP Installer
  use("petertriho/nvim-scrollbar") -- Scrollbar
  use("prettier/vim-prettier") -- Prettier
  use("github/copilot.vim") -- CoPilot
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
    config = function()
      local telescope = require("telescope")

      -- first setup telescope
      telescope.setup({
        -- your config
      })

      -- then load the extension
      telescope.load_extension("live_grep_args")
    end
  }
  use {
    'L3MON4D3/LuaSnip',
    requires = { 'rafamadriz/friendly-snippets' }
  } -- Snippets
  use("hrsh7th/nvim-cmp") -- Completion
  use("saadparwaiz1/cmp_luasnip") -- Snippets for completion
  use("hrsh7th/cmp-nvim-lsp") -- LSP for completion
  use("soulis-1256/eagle.nvim") -- Hover for completion

  -- Theme & UI
  use("nvim-lua/plenary.nvim") -- Dependancy for many plugins
  use({"ellisonleao/gruvbox.nvim", as = "gruvbox" }) -- Gruvbox
  use("nvim-treesitter/nvim-treesitter") -- Treesitter
  use("christoomey/vim-tmux-navigator") -- Navigation between splits
  use("szw/vim-maximizer") -- maximize & restore current window
  use("numToStr/Comment.nvim") -- Comment plugin
  use("nvim-tree/nvim-tree.lua") -- Filetree
  use("nvim-tree/nvim-web-devicons") -- Dev icons
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes etc.
  use("windwp/nvim-ts-autotag") -- autoclose tags
  use({
    'glepnir/galaxyline.nvim',
    branch = 'main',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
  }) -- statusline
  use("luochen1990/rainbow") -- rainbow brackets

  if packer_bootstrap then
    require("packer").sync()
  end
end)
