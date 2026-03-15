local M = {}

function M.setup()
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }
    local modes = { 'n', 'v', 'o' }

    -- Primary Movement: M=Left, N=Down, E=Up, I=Right
    keymap(modes, 'm', 'h', opts)
    keymap(modes, 'n', 'j', opts)
    keymap(modes, 'e', 'k', opts)
    keymap(modes, 'i', 'l', opts)

    -- Capital Movement
    keymap(modes, 'M', 'H', opts)
    keymap(modes, 'N', 'J', opts)
    keymap(modes, 'E', 'K', opts)
    keymap(modes, 'I', 'L', opts)

    -- Restore old HJKL functions
    keymap(modes, 'h', 'm', opts)
    keymap(modes, 'j', 'n', opts)
    keymap(modes, 'k', 'e', opts)
    keymap(modes, 'l', 'i', opts)

    -- Restore Capital functions
    keymap(modes, 'H', 'M', opts)
    keymap(modes, 'J', 'N', opts)
    keymap(modes, 'K', 'E', opts)
    keymap(modes, 'L', 'I', opts)

    -- Window Navigation
    keymap('n', '<C-w>m', '<C-w>h', opts)
    keymap('n', '<C-w>n', '<C-w>j', opts)
    keymap('n', '<C-w>e', '<C-w>k', opts)
    keymap('n', '<C-w>i', '<C-w>l', opts)
end

return M