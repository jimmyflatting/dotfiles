local opt = vim.opt

-- line numbers
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = true

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

-- Markline
function mark_line(direction)
    if direction == "start" then
        vim.cmd('normal! m`^')
    elseif direction == "end" then
        vim.cmd('normal! m`$')
    elseif direction == "left" then
        vim.cmd('normal! ma')
    elseif direction == "right" then
        vim.cmd('normal! mA')
    elseif direction == "up" then
        vim.cmd('normal! m-')
    elseif direction == "down" then
        vim.cmd('normal! m+')
    end
end
