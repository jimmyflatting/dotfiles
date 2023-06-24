local telescope_setup, telescope = pcall(require, "telescope")
if not telescope_setup then
  return
end

local actions_setup, actions = pcall(require, "telescope.actions")
if not actions_setup then
  return
end

telescope.setup({
  defaults = {
    mapping = {
      i = {
        ["<C-Up>"] = actions.move_selection_previous,
        ["<C-Down>"] = actions.move_selection_next,
      }
    }
  }
})

telescope.load_extension("fzf")
