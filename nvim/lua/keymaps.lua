-- Leaderキー
vim.api.nvim_set_var('mapleader', ',')
-- vim.api.nvim_set_var('maplocalleader', '\\')im.g.mapleader = ","
-- インサートモードでjjをEscに割り当て
vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true })
