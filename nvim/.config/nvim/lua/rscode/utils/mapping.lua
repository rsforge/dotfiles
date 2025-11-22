local M = {}

M.modes = {
    ['']  = true, -- TODO: test table blank key
    ['n'] = true,
    ['!'] = true,
    ['i'] = true,
    ['c'] = true,
    ['v'] = true,
    ['x'] = true,
    ['s'] = true,
    ['o'] = true,
    ['t'] = true,
    ['l'] = true,
}

M.default_opts = {
    buffer = nil,
    noremap = true,
    nowait = false,
    silent = true,
    expr = false,
    script = false,
    unique = false,
    desc = nil,
    callback = nil,
    replace_keycodes = nil,
}

function M.valid_mode(mode)
    return M.modes[mode] and true or false
end

---Check whether or not a given table contains mappings while ignoring all opts.
---Example table { ..., x = { ... } } contains branch, as 'x' is a non-empty table
---@param tree table | nil
---@return boolean
function M.contains_branch(tree)
    if not tree or type(tree) ~= 'table' then
        return false
    end

    local tmp_opts = tree.opts
    tree.opts = nil

    for _, v in pairs(tree) do
        if type(v) == 'table' and vim.tbl_count(v) ~= 0 then
            tree.opts = tmp_opts
            return true
        end
    end

    tree.opts = tmp_opts
    return false
end

---Convert string of modes into a table. As well as validate the modes. 'ni' = { 'n', 'i' }
---@param str string
---@return table
function M.parse_modes(str)
    local modes = {}

    if string.len(str) > 1 then
        for mode in str:gmatch('.') do
            if not M.valid_mode(mode) then
                vim.notify('Failed to load mappings. Invalid mode: "' .. mode .. '" see :help map-modes for available modes', vim.log.levels.WARN)
            end
            table.insert(modes, mode)
        end
    else
        if not M.valid_mode(str) then
            vim.notify('Failed to load mappings. Invalid mode: "' .. str .. '" see :help map-modes for available modes', vim.log.levels.WARN)
        end
        table.insert(modes, str)
    end

    return modes
end

function M.recursive_map(tree, prev_node, depth)
    prev_node.opts = tree.opts and vim.tbl_deep_extend('force', prev_node.opts or {}, tree.opts) or prev_node.opts

    for suffix, branch in pairs(tree) do
        if suffix ~= 'opts' then
            local node = {}
            node.lhs = ((depth >= 1) and ((prev_node.lhs or '') .. suffix) or (prev_node.lhs or ''))
            node.modes = ((depth == 0) and M.parse_modes(suffix) or (prev_node.modes or {}))
            node.opts = prev_node.opts

            if M.contains_branch(branch) then
                M.recursive_map(branch, node, (depth or 0) + 1)
            else
                if ((type(branch) == 'table') and (vim.tbl_count(branch) > 0) or false) then
                    node.opts = branch.opts and vim.tbl_deep_extend('force', prev_node.opts or {}, branch.opts) or prev_node.opts
                    node.rhs = branch[1]
                    node.opts.desc = branch[2]

                    M.map_node(node)
                end
            end
        end
    end
end

function M.map_node(node)
    vim.validate("modes", node.modes, "table")
    vim.validate("lhs", node.lhs, "string")
    vim.validate("rhs", node.rhs, { "string", "function" })
    vim.validate("opts", node.opts, "table")

    node.opts = vim.deepcopy(node.opts)

    if type(node.rhs) == 'function' then
        node.opts.callback = node.rhs
        node.rhs = ''
    end

    if node.opts.buffer then
        local bufnr = node.opts.buffer == true and 0 or node.opts.buffer
        node.opts.buffer = nil
        for _, mode in pairs(node.modes) do
            vim.api.nvim_buf_set_keymap(bufnr, mode, node.lhs, node.rhs, node.opts)
        end
    else
        for _, mode in pairs(node.modes) do
            vim.api.nvim_set_keymap(mode, node.lhs, node.rhs, node.opts)
        end
    end
end

function M.load(tree, opts)
    if not M.contains_branch(tree) then
        return
    end

    local node = {
        opts = (opts and vim.tbl_deep_extend('force', M.default_opts, opts) or M.default_opts),
    }

    M.recursive_map(tree, node, 0)
end

return M
