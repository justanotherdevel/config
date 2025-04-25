require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",      -- for Lua
    "tailwindcss", -- for Tailwind CSS
    "pyright",     -- for Python
  },
  automatic_installation = true,
})

local lspconfig = require("lspconfig")
local on_attach = require("lsp.on_attach").on_attach

lspconfig.lua_ls.setup({
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT for Neovim)
        version = "LuaJIT",
        -- Setup your Lua path
        path = vim.split(package.path, ";"),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
        disable = { 'missing-fields' }
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- Disable third-party library checks for faster performance
      },
      telemetry = {
        enable = false,
      },
    },
  },
})
require("typescript-tools").setup({
  on_attach = on_attach,
  autoStart = true,
  settings = {
    expose_as_code_action = { "organizeImports", "addMissingImports" }, -- Adds these as code actions
    inlay_hints = {
      parameter_names = { enabled = "all" },                            -- Show parameter names for all arguments
    },
  },
})

lspconfig.tailwindcss.setup({ on_attach = on_attach })
require("lsp.null-ls")

lspconfig.dartls.setup({
  on_attach = on_attach,
  cmd = { "dart", "language-server", "--protocol=lsp" },
  filetypes = { "dart" },
  init_options = {
    closingLabels = true,
    flutterOutline = true,
    onlyAnalyzeProjectsWithOpenFiles = true,
    outline = true,
    suggestFromUnimportedLibraries = true,
  },
  root_dir = require('lspconfig').util.root_pattern("pubspec.yaml"),

  -- root_dir = root_pattern("pubspec.yaml"),
  settings = {
    dart = {
      completeFunctionCalls = true,
      showTodos = true,
    },
  },
})

-- Python lsp
local util = require('lspconfig/util')

lspconfig.pyright.setup({
  on_attach = require("lsp.on_attach").on_attach, -- Replace with your on_attach function
  capabilities = require("cmp_nvim_lsp").default_capabilities(),
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        diagnosticMode = "workspace",
      },
    },
  },
  root_dir = util.root_pattern(".git", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt"),
})
