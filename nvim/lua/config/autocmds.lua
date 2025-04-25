-- lua/config/autocmds.lua

-- Automatically jump to the last known cursor position when reopening a file
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end
})

-- File type specific settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = "dart",
    command = "setlocal tabstop=2 shiftwidth=2 expandtab",
})

