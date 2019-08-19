local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
beautiful.init("~/.config/awesome/themes/custom/theme.lua")

-- Set colors
local active_color = beautiful.cpu_bar_active_color or "#808080"
local background_color = beautiful.cpu_bar_background_color or "#404040"

local icon = wibox.widget{
    align = "center",
    valign = "center",
    widget = wibox.widget.imagebox,
    image = beautiful.cpu_icon,
    resize = false,
}

local cpu_bar = wibox.widget{
    max_value     = 100,
    value         = 50,
    forced_height = 10,
    margins       = {
        top = 5,
        bottom = 5,
    },
    forced_width  = 100,
    shape         = gears.shape.rectangle,
    bar_shape     = gears.shape.rectangle,
    color         = active_color,
    background_color = background_color,
    border_width  = 0,
    border_color  = beautiful.border_color,
    widget        = wibox.widget.progressbar,
}

local cpu_group = wibox.widget{
    icon,
    cpu_bar,
    layout = wibox.layout.fixed.horizontal,
    spacing = 10,
}

awesome.connect_signal("evil::cpu", function(value)
    -- Use this if you want to display usage percentage
    cpu_bar.value = value
    -- Use this if you want to display idle percentage
    -- cpu_bar.value = tonumber(100 - value)
end)

return cpu_group