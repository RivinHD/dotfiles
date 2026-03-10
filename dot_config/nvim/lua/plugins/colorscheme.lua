return {
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            overrides = function(colors) -- add/modify highlights
                local theme = colors.theme
                local makeDiagnosticColor = function(color)
                    local c = require("kanagawa.lib.color")
                    return { fg = color, bg = c(color):blend(theme.ui.bg, 0.95):to_hex() }
                end

                return {
                    Pmenu                      = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
                    PmenuSel                   = { fg = "NONE", bg = theme.ui.bg_p2 },
                    PmenuSbar                  = { bg = theme.ui.bg_m1 },
                    PmenuThumb                 = { bg = theme.ui.bg_p2 },

                    DiagnosticVirtualTextHint  = makeDiagnosticColor(theme.diag.hint),
                    DiagnosticVirtualTextInfo  = makeDiagnosticColor(theme.diag.info),
                    DiagnosticVirtualTextWarn  = makeDiagnosticColor(theme.diag.warning),
                    DiagnosticVirtualTextError = makeDiagnosticColor(theme.diag.error),
                }
            end,
            theme = "dragon", -- Load "wave" theme
            background = {    -- map the value of 'background' option to a theme
                dark = "dragon",
                light = "lotus"
            },
        },
        config = function()
            -- Load the colorscheme
            vim.cmd([[colorscheme kanagawa]])
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        opts = {},
    },
}
