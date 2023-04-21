vim.cmd("autocmd!")

vim.scriptencoding = "utf-8"

-- encodings
vim.o.encoding = "utf-8"
vim.o.fileencoding = "utf-8"

-- line number
vim.o.number = true
-- vim.wo.relativenumber = true

vim.o.title = true

-- indent
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true

vim.o.cursorline = true

-- show <Tab> and <EOL>
vim.o.list = true
vim.o.listchars = 'tab:>-,trail:-,eol:↲'

vim.g.mapleader = ','

print(vim.scriptencoding)
print(vim.o.encoding)
print(vim.o.fileencoding)
print(vim.o.number)
print(vim.wo.relativenumber)
print(vim.o.title)
print(vim.o.autoindent)
print(vim.o.smartindent)
print(vim.o.breakindent)
print(vim.o.cursorline)
print(vim.o.list)
print(vim.o.listchars)