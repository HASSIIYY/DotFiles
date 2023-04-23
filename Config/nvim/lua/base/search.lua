--[[ Variables ]]--
local opt = vim.opt	-- Variable for configuring Neovim options


--[[ Search ]]--
-- Ignore case when searching
-- If we now enter "IGNORE", then it will find "ignore" as well
opt.ignorecase = true

-- Do not ignore case if there are uppercase characters
-- If we write "Ignore", then it will only search for "Ignore"
opt.smartcase = true

-- Highlight found text objects
opt.showmatch = true

