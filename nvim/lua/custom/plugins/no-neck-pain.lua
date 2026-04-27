return {
  'shortcuts/no-neck-pain.nvim',
  keys = {
    { '<leader>z', '<cmd>NoNeckPain<cr>', desc = '[Z]en center toggle' },
  },
  opts = {
    width = 120,
    buffers = {
      right = { enabled = false },
    },
  },
}
