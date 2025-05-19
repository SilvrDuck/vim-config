-- Inspired by https://github.com/vscode-neovim/vscode-multi-cursor.nvim
local api = vim.api                           -- give the shorthand a value
local M = require('vscode-multi-cursor')
local k   = vim.keymap.set

-- Adds a new cursor to each matching next word
k('n', '<C-d>', 'mciw*<Cmd>nohl<CR>', { remap = true, desc = 'Add next word to multiselect' })

-- Allows to add a new cursor to each line of a ctrl+v or V selection
k({ "x" }, "I", function()
  local m  = api.nvim_get_mode().mode          -- "v", "V", or "\x16"
  local noselect = (m == "V" or m == "\x16")      -- true for big-V and block
  M.start_left_edge { no_selection = noselect }
end)

k({ "x" }, "A", function()
  local m  = api.nvim_get_mode().mode
  local noselect = (m == "V" or m == "\x16")
  M.start_right { no_selection = noselect }
end)