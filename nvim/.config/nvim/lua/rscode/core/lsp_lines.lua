local M = {}

function M.init()

end

function M.config()
    local lsp_lines = require('lsp_lines')

    lsp_lines.setup()
end

return M
