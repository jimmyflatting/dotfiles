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
  
  use("wbthomason/packer.nvim") -- Packer
  use("nvim-lua/plenary.nvim") -- Dependancy for many plugins
  use({ "catppuccin/nvim", as = "catppuccin" })
  use("nvim-treesitter/nvim-treesitter") -- Treesitter
  use("christoomey/vim-tmux-navigator") -- Navigation between splits
  use("szw/vim-maximizer") -- maximize & restore current window
  
  use("tpope/vim-surround")
  use("vim-scripts/ReplaceWithRegister")
  
  use("numToStr/Comment.nvim") -- Comment plugin
  use("nvim-tree/nvim-tree.lua") -- Filetree
  use("nvim-tree/nvim-web-devicons") -- Dev icons
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- fuzzy finder dependancy
  use({ "nvim-telescope/telescope.nvim", branch = "0.1.x" }) -- fuzzy finder
  
  use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes etc.
  use("windwp/nvim-ts-autotag") -- autoclose tags
  use({"neoclide/coc.nvim", branch = 'release'})
  use("prettier/vim-prettier")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
