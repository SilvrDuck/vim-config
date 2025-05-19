-- Description: Bépo layout configuration for Vim

-- Insert mode: NBSP (U+202F) → <Esc>
vim.keymap.set({'n','v','o','s','i','c','t'}, '<Char-0x202F>', '<Esc>', { noremap = true, silent = true, desc = 'Use nbsp as <Esc>' })

-- Regular keys mapping
local function escape(str)
    -- You need to escape these characters to work correctly
    local escape_chars = [[;,."|\]]
    return vim.fn.escape(str, escape_chars)
end
  
local be_num_lowr = [[$"«»()@+-/*=%]]
local qw_num_lowr = [[`1234567890-=]]
local be_num_uppr = [[#1234567890°`]]
local qw_num_uppr = [[~!@#$%^&*()_+]]
local be_lowr = [[bépoè^vdljzwauie,ctsrnmçêàyx.k’qghf]]
local qw_lowr = [[qwertyuiop[]asdfghjkl;'\yzxcvbnm,./]]
local be_uppr = [[BÉPOÈ!VDLJZWAUIE;CTSRNMÇÊÀYX:K?QGHF]]
local qw_uppr = [[QWERTYUIOP{}ASDFGHJKL:"|YZXCVBNM<>?]]
  
vim.opt.langmap = vim.fn.join({
    -- | `to` should be first     | `from` should be second
    escape(be_num_lowr) .. ';' .. escape(qw_num_lowr),
    escape(be_num_uppr) .. ';' .. escape(qw_num_uppr),
    escape(be_lowr) .. ';' .. escape(qw_lowr),
    escape(be_uppr) .. ';' .. escape(qw_uppr),
}, ',')

-- Control key mapping
local ascii_letter = '[A-Za-z]'

---@param be string  -- Bépo string
---@param qw string  -- Qwerty string (same length)
local function map_ctrl(be, qw)
  -- split each string into an array of UTF-8 characters
  local be_chars = vim.fn.split(be, '\\zs')
  local qw_chars = vim.fn.split(qw, '\\zs')

  -- if the two tables don’t have exactly the same number of chars,
  -- something is wrong with our source data – abort loudly
  assert(#be_chars == #qw_chars,
         'Bépo/Qwerty tables differ: ' .. #be_chars .. ' vs ' .. #qw_chars)

  for i = 1, #be_chars do
    local b = be_chars[i]
    local q = qw_chars[i]
    -- only plain ASCII letters can form a Ctrl-<char> sequence
    if b:match(ascii_letter) and q:match(ascii_letter) then
      local lhs = '<C-' .. b .. '>'
      local rhs = '<C-' .. q .. '>'
      vim.keymap.set({'n','v','o','s','i','c','t'}, lhs, rhs,
                     { noremap = true, silent = true,
                       desc = 'Bépo-Ctrl → Qwerty-Ctrl' })
    end
  end
end

map_ctrl(be_lowr, qw_lowr)
