-- Alias for quick access to the hotkey installation method
local map = vim.api.nvim_set_keymap 
local opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- Method for setting hotkeys (Normal)
function nm(key, command) 
	map('n', key, command, opts)
end

-- Method for setting hotkeys (Insert)
function im(key, command)
	map('i', key, command, opts)
end

-- Method for setting hotkeys (Visual)
function vm(key, command)
	map('v', key, command, opts)
end

-- Method for setting hotkeys (Visual Block)
function xm(key, command)
	map('x', key, command, opts)
end

-- Method for setting hotkeys (Terminal)
function tm(key, command)
	map('t', key, command, term_opts)
end

-- Method for setting hotkeys (Command)
function cm(key, command)
	map('c', key, command, opts)
end

-- Method for setting hotkeys (All)
function m(key, command)
	map('', key, command, opts)
end
