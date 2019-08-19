local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")
beautiful.init("~/.config/awesome/themes/custom/theme.lua")

-- Set colors
local active_color = beautiful.ram_bar_active_color or "#808080"
local background_color = beautiful.ram_bar_background_color or "#404040"

local icon = wibox.widget{
    align = "center",
    valign = "center",
    widget = wibox.widget.imagebox,
    image = beautiful.mem_icon,
    resize = false,
}

local ram_bar = wibox.widget{
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

local mem_group = wibox.widget{
    icon,
    ram_bar,
    layout = wibox.layout.fixed.horizontal,
    spacing = 10,
}

awesome.connect_signal("evil::ram", function(used, total)
    local used_ram_percentage = (used / total) * 100
    ram_bar.value = used_ram_percentage

    if used_ram_percentage > 80 then
        ram_bar.color = '#700'
    end
end)

return mem_group