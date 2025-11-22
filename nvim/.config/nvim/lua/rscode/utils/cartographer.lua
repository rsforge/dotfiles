local M = {}

M.modes = {
    '',
    'n',
    '!',
    'i',
    'c',
    'v',
    'x',
    's',
    'o',
    't',
    'l',
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

---Check whether @mode is a valid mode
---To be a valid mode, it has to be in regi.config.keymap_config.modes
---@param mode string
---@return boolean
function M.valid_mode(mode)
    for _, m in pairs(M.modes) do
        if m == mode then
            return true
        end
    end

    return false
end

--- Check whether @tree contains a branch
--- Branch being regi.KeymapBranch
---@param tree regi.Keymap | regi.KeymapBranch
---@return boolean
function M.contains_branch(tree)
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

--- Parse a string of valid modes into an array
--- Will throw error if mode is not valid
---@param str string
---@return table
function M.parse_modes(str)
    local modes = {}

    if string.len(str) > 1 then
        for mode in str:gmatch('.') do
            if not M.valid_mode(mode) then
                vim.notify('Invalid mode "' ..
                           mode ..
                           '" while parsing modes\nAvailable modes are: ' ..
                           vim.json.encode(M.modes),
                           vim.log.levels.ERROR)
            else
                table.insert(modes, mode)
            end
        end
    else
        if not M.valid_mode(str) then
                vim.notify('Invalid mode "' ..
                           str ..
                           '" while parsing modes\nAvailable modes are: ' ..
                           vim.json.encode(M.modes),
                           vim.log.levels.ERROR)
        else
            table.insert(modes, str)
        end
    end

    return modes
end

--- Traverse a keymap tree
--- Finding all nodes in a tree and then mapping them
---@param tree regi.KeymapTree
---@param info regi.KeymapBranchInfo
---@param depth? integer
function M.recursive_map(tree, info, depth)
    if tree.opts then
        info.opts = vim.tbl_deep_extend('force', info.opts, tree.opts)
    end

    if type(tree[1]) == "string" then
        if info.opts then
            info.opts.desc = ((type(tree[2]) == "string") and tree[2] or '')
        end
        vim.keymap.set(info.modes, info.keymap, tree[1], info.opts)
        tree[1] = nil
        if type(tree[2]) == "string" then
            tree[2] = nil
        end
    end

    for key, branch in pairs(tree) do
        if key ~= 'opts' and not vim.tbl_isempty(branch) then
            ---@type regi.KeymapBranchInfo
            local branch_info = vim.deepcopy(info, true)

            branch_info.modes = (depth == 0) and M.parse_modes(key) or info.modes
            branch_info.keymap = (depth > 0) and (info.keymap or '') .. key or info.keymap

            if type(branch) == "table" and M.contains_branch(branch) then
                M.recursive_map(branch, branch_info, depth + 1)
            else
                if type(branch) == "table" then
                    local opts = branch.opts and vim.tbl_deep_extend('force', branch_info.opts, branch.opts) or branch_info.opts
                    if opts then
                        opts.desc = ((type(branch[2]) == "string") and branch[2] or '')
                    end
                    vim.keymap.set(branch_info.modes, branch_info.keymap, branch[1], opts)
                elseif type(branch) == "string" then
                    vim.keymap.set(branch_info.modes, branch_info.keymap, branch, branch_info.opts)
                end
            end
        end
    end
end

function M.map(tree, opts)
    if vim.tbl_isempty(tree) then
        vim.notify('Cartographer: Failed to map keys; empty tree table received', vim.log.levels.WARN)
    end

    local options = opts and vim.tbl_deep_extend('force', M.default_opts, vim.deepcopy(opts, true)) or vim.deepcopy(M.default_opts, true)

    M.recursive_map(vim.deepcopy(tree, true), { keymap = '', modes = {}, opts = options }, 0)
end

return M
