vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "


vim.g.colorscheme = "everblush"

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- personal addons / lsp configs

--require('lspconfig').harper_ls.setup({})
require('lspconfig').pyright.setup({})
--require('lspconfig').nim_langserver.setup({})

require('lspconfig').nim_langserver.setup{}

--require('lspconfig').deno.setup{}

require('lspconfig').gopls.setup{}

vim.opt.relativenumber = true

require('lspconfig').clangd.setup {
  -- You can add custom settings here
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = require('lspconfig.util').root_pattern("compile_commands.json", ".git"),
}

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

return {
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
  },
} 
