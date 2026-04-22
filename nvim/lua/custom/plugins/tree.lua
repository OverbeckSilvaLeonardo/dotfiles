return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("nvim-tree").setup({
      sort = { sorter = "case_sensitive" },
      view = { width = 30, side = "left" },
      renderer = { group_empty = true },
      filters = { dotfiles = false, git_ignored = false },
    })

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        require("nvim-tree.api").tree.open()
      end,
    })

    vim.keymap.set("n", "<C-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<M-b>", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
  end,
}
