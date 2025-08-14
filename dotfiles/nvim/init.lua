vim.opt.number=true
vim.opt.autoindent=true
vim.opt.wildmode={"longest","list"}
vim.opt.textwidth=80
vim.opt.syntax="on"
vim.opt.cursorline=true
vim.opt.ttyfast=true

vim.opt.termguicolors = true
vim.cmd('colorscheme onehalflight')
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	 { "nvim-treesitter/nvim-treesitter" },
	 { "jghauser/mkdir.nvim" },
	 { "f-person/git-blame.nvim" } ,
	 { "folke/which-key.nvim" },
	 { "nvim-tree/nvim-web-devicons" }
})
