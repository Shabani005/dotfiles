vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

vim.deprecate = function() return end


-- vim.g.colorscheme = "gruber-darker"
-- vim.g.set.guicursor =
-- vim.cmd.colorscheme("gruber-darker")
-- bootstrap lazy and all plugins
vim.opt.guicursor = ""
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"
local lspconfig = vim.lsp.config
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

-- {
--   "blazkowolf/gruber-darker.nvim",
--   priority = 1000, -- Make sure it loads before other start plugins
--   config = function()
--     vim.cmd.colorscheme("gruber-darker")
--   end,
-- }

-- { "blazkowolf/gruber-darker.nvim" }

vim.o.clipboard = "unnamedplus"

-- personal addons / lsp configs

--require('lspconfig').harper_ls.setup({})
require("lspconfig").pyright.setup({})
-- vim.lsp.config.pyright.setup({})
require('lspconfig').nim_langserver.setup({})

-- vim.lsp.config.pyright = {
--   cmd = { "pyright-langserver", "--stdio" },
--   root_dir = vim.fs.dirname(vim.fs.find(
--     { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
--     { upward = true }
--   )[1]),
-- }

-- vim.lsp.start(vim.lsp.config.pyright)


require('lspconfig').nim_langserver.setup{}

--require('lspconfig').deno.setup{}

require('lspconfig').gopls.setup{}

require('lspconfig').zls.setup{}

require('lspconfig').asm_lsp.setup{}
require('lspconfig').omnisharp.setup{
  cmd = { "OmniSharp" }
}

-- vim.lsp.config('sonarlint') 

-- require('lspconfig').c3lsp.setup{}

require('lspconfig').c3_lsp.setup{}

require('lspconfig').serve_d .setup{
  cmd = {"serve-d"},
  filetypes = {"d"}
}


require('lspconfig').rust_analyzer.setup{}

vim.opt.relativenumber = true

--require('lspconfig').c3lsp = {
  --default_config = {
    --cmd = { "/home/shabani/thirdparty/server/bin/release/c3lsp" },
    --filetypes = { "c3" },
    --root_dir = require('lspconfig.util').root_pattern("c3.toml", ".git"),
  --}
--}
-- require('lspconfig').c3lsp.setup{}


require('lspconfig').clangd.setup {
  -- You can add custom settings here
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp", "cu" },
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

