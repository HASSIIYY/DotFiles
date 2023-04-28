# Cheat sheet on NeoVim commands
### NeoVim Service
- __:checkhealth__ - Check NeoVim for errors
- __:help <command/object>__ - Command or Object Help
- __:so %__ - Reread the file

### NeoVim Terminal
- __:Terminal <command>__ - Open a terminal in the same Tab
- __:TerminalTab <command>__ - Open a terminal in a new Tab
- __:TerminalSplit <command>__ - Open a terminal with Tab split horizontally
- __:TerminalVSplit <command>__ - Open a terminal with Tab split vertically

### NeoVim Treesitter
- __:TSInstall <language_to_install>__ - Installing the Tree Sitter language model
- __:TSInstallInfo__ - Information on installed language models
- __:TSUpdate__ - Updating language models



# Cheat sheet on NeoVim keymaps
## Main
- __<Space>__ - Space As Leader Key
- __fd/ав__ - Exiting modes by 'fd'


## Normal Mode
### Tabs
- __<leader>tn__ - Moving on to the next tab 
- __<leader>tp__ - Moving on to the previous tab
- __<leader>tc__ - Close Tab

### Plugins
- __<leader>u__ - Open UndoTree


## Insert Mode
### Plugins
- __<Ctrl>k__ - Select Prevvious Item 
- __<Ctrl>j__ - Select Next Item
- __<Ctrl>b__ - Scroll through the documents by -1 line
- __<Ctrl>f__ - Scroll through the documents by 1 line
- __<Ctrl>e__ - Exit CMP
- __<Ctrl><Space>__ - Select an item


## Visual Mode
### Plugins
- __gcc__ - Comment out the current line
- __gc__ - Comment out the selected block in Visual mode
