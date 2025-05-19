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
