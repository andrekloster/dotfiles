return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")
        dashboard.section.header.val = {
            [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ]],
            [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ]],
            [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ]],
            [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ]],
            [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ]],
            [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ]],
        }
        dashboard.section.buttons.val = {
            dashboard.button("t", "Open NeoTree", ":NvimTreeOpen<CR>"),
            dashboard.button("e", "New file", ":ene <BAR> startinsert <CR>"),
            dashboard.button("f", "Find file", ":Telescope find_files <CR>"),
            dashboard.button("g", "Grep text", ":Telescope live_grep <CR>"),
            dashboard.button("q", "Quit Neovim", ":qa<CR>"),
        }

        local function footer()
            return "v0.9.4"
        end

        dashboard.section.footer.val = footer()
        alpha.setup(dashboard.opts)
    end,
}
