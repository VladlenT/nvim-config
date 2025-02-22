return {
    'rebelot/kanagawa.nvim',
    -- Make theme load before "lualine"
    priority = 100,
    config = function()
        require('kanagawa').load('wave')
    end
}
