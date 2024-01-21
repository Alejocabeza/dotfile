local opt = vim.opt

vim.g.mapleader = " "
vim.g.autoformat = true

vim.g.root_spec = { "lsp", { ".git", "lua" }, "cwd" }

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.number = true

vim.opt.relativenumber = true
vim.opt.autowrite = true
vim.opt.completeopt = "menu,menuone,noselect"
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize", "help", "globals", "skiprtp", "folds" }
vim.opt.conceallevel = 3
vim.opt.confirm = true
vim.opt.cursorline = false
vim.opt.formatoptions = "jcroqlnt"
vim.opt.grepformat = "%f:%l:%c:%m"
vim.opt.grepprg = "rg --vimgrep"
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.smartindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = "fish"
vim.opt.fillchars = {
	foldopen = "",
	foldclose = "",
	-- fold = "⸱",
	fold = " ",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
opt.list = true
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
vim.opt.virtualedit = "block"
vim.opt.wildmode = "longest:full,full"
vim.opt.backupskip = { "/tmp/*", "/private/tmp/*" }
vim.opt.inccommand = "split"
vim.opt.ignorecase = true -- Case insensitive searching UNLESS /C or capital in search
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.wrap = false -- No Wrap lines
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.path:append({ "**" }) -- Finding files - Search down into subfolders
vim.opt.wildignore:append({ "*/node_modules/*", "*/vendor/*", "*/var/*" })
vim.opt.splitbelow = true -- Put new windows below current
vim.opt.splitright = true -- Put new windows right of current
vim.opt.splitkeep = "cursor"
vim.opt.mouse = "a"
vim.opt.swapfile = false

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })

vim.cmd([[au BufNewFile,BufRead *.astro setf astro]])
vim.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

if vim.fn.has("nvim-0.8") == 1 then
	vim.opt.cmdheight = 0
end

if vim.fn.has("nvim-0.10") == 1 then
	opt.smoothscroll = true
end

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldtext = "v:lua.require'util'foldtext()"

if vim.fn.has("nvim-0.9.0") == 1 then
	vim.opt.statuscolumn = [[%!v:lua.require'util'.statuscolumn()]]
end

-- HACK: causes freezes on <= 0.9, so only enable on >= 0.10 for now
if vim.fn.has("nvim-0.10") == 1 then
	vim.opt.foldmethod = "expr"
	vim.opt.foldexpr = "v:lua.require'util'.foldexpr()"
else
	vim.opt.foldmethod = "indent"
end

vim.o.formatexpr = "v:lua.require'util'.formatexpr()"

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
