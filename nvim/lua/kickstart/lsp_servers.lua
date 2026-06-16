return {
  -- clangd = {},
  gopls = {},
  pyright = {
    root_markers = { 'manage.py', 'pyproject.toml', 'requirements.txt', 'setup.py', 'setup.cfg', '.git' },
    settings = {
      python = {
        analysis = {
          diagnosticMode = 'workspace',
          typeCheckingMode = 'basic',
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          autoImportCompletions = true,
          -- extraPaths can be added here if your django project has a non-standard layout
        },
      },
    },
  },
  jinja_lsp = {
    filetypes = { 'jinja', 'jinja2', 'html', 'htmldjango', 'django' },
  },
  -- rust_analyzer = {},

  -- vtsls handles TS/JS; Vue plugin hooked in via @vue/typescript-plugin for .vue script blocks
  vtsls = {
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    settings = {
      vtsls = {
        tsserver = {
          globalPlugins = {
            {
              name = '@vue/typescript-plugin',
              location = vim.fn.stdpath 'data' .. '/mason/packages/vue-language-server/node_modules/@vue/language-server',
              languages = { 'vue' },
              configNamespace = 'typescript',
            },
          },
        },
      },
    },
  },

  -- vue_ls handles .vue SFC template/style; hybrid mode pairs with vtsls above
  vue_ls = {},

  stylua = {}, -- Used to format Lua code

  -- Special Lua Config, as recommended by neovim help docs
  lua_ls = {
    on_init = function(client)
      if client.workspace_folders then
        local path = client.workspace_folders[1].name
        if path ~= vim.fn.stdpath 'config' and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc')) then return end
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
        runtime = {
          version = 'LuaJIT',
          path = { 'lua/?.lua', 'lua/?/init.lua' },
        },
        workspace = {
          checkThirdParty = false,
          -- NOTE: this is a lot slower and will cause issues when working on your own configuration.
          --  See https://github.com/neovim/nvim-lspconfig/issues/3189
          library = vim.tbl_extend('force', vim.api.nvim_get_runtime_file('', true), {
            '${3rd}/luv/library',
            '${3rd}/busted/library',
          }),
        },
      })
    end,
    settings = {
      Lua = {},
    },
  },
}
