local Terminal = {}

function Terminal.setup(colours)
    -- black
    vim.g.terminal_color_0 = colours.background
    vim.g.terminal_color_8 = colours.background_alt

    -- red
    vim.g.terminal_color_1 = colours.red
    vim.g.terminal_color_9 = colours.red_alt

    -- green
    vim.g.terminal_color_2 = colours.green
    vim.g.terminal_color_10 = colours.green_alt

    -- yellow
    vim.g.terminal_color_3 = colours.yellow
    vim.g.terminal_color_11 = colours.yellow_alt

    -- blue
    vim.g.terminal_color_4 = colours.blue
    vim.g.terminal_color_12 = colours.blue_alt

    -- magenta
    vim.g.terminal_color_5 = colours.magenta
    vim.g.terminal_color_18 = colours.magenta_alt

    -- cyan
    vim.g.terminal_color_6 = colours.cyan
    vim.g.terminal_color_14 = colours.cyan_alt

    -- white
    vim.g.terminal_color_7 = colours.foreground_alt
    vim.g.terminal_color_15 = colours.foreground
end

return Terminal
