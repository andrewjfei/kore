local colours = {
    dark_dark = "#1d1d1d",
    dark_normal = "#2d2d2d",
    dark_light = "#444444",

    light_dark = "#747474",
    light_normal = "#b4b4b4",
    light_light = "#e4e4e4",

    red_dark = "#d94426",
    red_normal = "#ff7f66",
    red_light = "#ffbfb3",

    green_dark = "#63a145",
    green_normal = "#b1bd75",
    green_light = "#d2ecc6",

    orange_dark = "#ee7c2b",
    orange_normal = "#ffa666",
    orange_light = "#ffd2b3",

    blue_dark = "#406abf",
    blue_normal = "#75b6d7",
    blue_light = "#c2d1f0",

    pink_dark = "#e05299",
    pink_normal = "#df9fb5",
    pink_light = "#fccfe6",

    cyan_dark = "#2e9e95",
    cyan_normal = "#8bc1b8",
    cyan_light = "#c4eeea",

    yellow_dark = "#e8ba30",
    yellow_normal = "#e8cd7d",
    yellow_light = "#fff2cc",
}

return {
    normal = {
        a = { bg = colours.orange_normal, fg = colours.dark_normal },
        b = { bg = colours.dark_light, fg = colours.light_normal },
        c = { bg = colours.dark_normal, fg = colours.light_dark },
    },
    insert = {
        a = { bg = colours.green_normal, fg = colours.dark_normal },
        b = { bg = colours.dark_light, fg = colours.light_normal },
        c = { bg = colours.dark_normal, fg = colours.light_dark },
    },
    visual = {
        a = { bg = colours.cyan_normal, fg = colours.dark_normal },
        b = { bg = colours.dark_light, fg = colours.light_normal },
        c = { bg = colours.dark_normal, fg = colours.light_dark },
    },
    replace = {
        a = { bg = colours.red_normal, fg = colours.dark_normal },
        b = { bg = colours.dark_light, fg = colours.light_normal },
        c = { bg = colours.dark_normal, fg = colours.light_dark },
    },
    command = {
        a = { bg = colours.yellow_normal, fg = colours.dark_normal },
        b = { bg = colours.dark_light, fg = colours.light_normal },
        c = { bg = colours.dark_normal, fg = colours.light_dark },
    },
    inactive = {
        a = { bg = colours.light_dark, fg = colours.dark_normal },
        b = { bg = colours.dark_light, fg = colours.light_normal },
        c = { bg = colours.dark_normal, fg = colours.light_dark },
    },
}
