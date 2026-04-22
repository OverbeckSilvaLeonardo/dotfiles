return {
  'FabijanZulj/blame.nvim',
  cmd = { 'BlameToggle' },
  keys = {
    { '<leader>gb', '<cmd>BlameToggle<cr>', desc = '[G]it [b]lame toggle' },
  },
  opts = {
    date_format = '%Y-%m-%d',
    merge_consecutive = true,
  },
}
