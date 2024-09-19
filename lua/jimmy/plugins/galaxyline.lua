require('galaxyline').short_line_list = { 'NvimTree', 'vista', 'dbui', 'packer' }

require("galaxyline").section.left[1] = {
  FileSize = {
    provider = "FileSize",
    condition = require("galaxyline.condition").checkwidth,
    separator = "|",
  },
}

require("galaxyline").section.left[2] = {
  FilePath = {
    provider = "FilePath",
    condition = require("galaxyline.condition").checkwidth,
    separator = " ",
  },
}

require("galaxyline").section.right[1] = {
  LSPClient = {
    provider = "GetLspClient",
    condition = require("galaxyline.condition").checkwidth,
    separator = " ",
  },
}

require("galaxyline").section.right[2] = {
  GitWorkspace = {
    provider = "GitBranch",
    condition = require("galaxyline.condition").checkwidth,
    separator = " | ",
    highlight = { "#282828", "#ebdbb2" },
    seprarator_highlight = { "#282828", "#282828" },
  },
}
