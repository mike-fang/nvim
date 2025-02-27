vim.g.echo_source = 0

vim.g.config_dir = vim.fn.expand("$HOME/.config/nvim/")
vim.g.userpath_maps = vim.g.config_dir .. 'lua/user/maps.lua'
vim.g.userpath_config = vim.g.config_dir .. 'lua/user/config.lua'
vim.g.userpath_plugins = vim.g.config_dir .. 'lua/plugins/plugins.lua'

require('user.maps')
require("config.lazy")
require('user.config')

-- Python venv
vim.g.python3_host_prog = vim.fn.expand("$HOME/.config/nvim/.venv/bin/python3")

--- Reload the entire configuration
function reload_config()
    for name,_ in pairs(package.loaded) do
        if name:match('^user') then
            package.loaded[name] = nil
        end
    end

    require('user')

    -- Reload after/ directory
    local glob = vim.fn.stdpath('config') .. '/after/**/*.lua'
    local after_lua_filepaths = vim.fn.glob(glob, true, true)

    for _, filepath in ipairs(after_lua_filepaths) do
        dofile(filepath)
    end

    vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end
