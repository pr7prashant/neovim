local M = {
    'mg979/vim-visual-multi',
    init = function()
        -- Don't skip VM's own `[`/`]` (goto prev/next cursor) mappings just because
        -- which-key claims `[`/`]` globally. VM maps them buffer-locally only while
        -- a VM session is active, so which-key's groups still work everywhere else.
        -- This also silences the "VM has started with warnings" message.
        vim.g.VM_check_mappings = 0
    end,
}

return M
