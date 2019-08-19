local gears = require("gears")
local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

-- Set colors
local active_color = "#808080"
local muted_color = "#404040"
local active_background_color = "#404040"
local muted_background_color = "#303030"
-- ^ca(4, amixer sset Master 10%+ )^ca(5, amixer sset Master 10%- )^i(./
local widget_buttons = gears.table.join(
    awful.button({ }, 1, function() awful.spawn("amixer -D pulse set Master 1+ toggle") end),
    awful.button({ }, 4, function() awful.spawn("amixer sset Master 10%+") end),
    awful.button({ }, 5, function() awful.spawn("amixer sset Master 10%-") end)
)

local icon = wibox.widget{
    align = "center",
    valign = "center",
    widget = wibox.widget.imagebox,
    image = beautiful.vol_icon,
    resize = false,
}

local volume_bar = wibox.widget{
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
    background_color = active_background_color,
    border_width  = 0,
    border_color  = beautiful.border_color,
    widget        = wibox.widget.progressbar,
}

local vol_group = wibox.widget{
    icon,
    volume_bar,
    layout = wibox.layout.fixed.horizontal,
    spacing = 10,
    buttons = widget_buttons,
}

awesome.connect_signal("evil::volume", function(volume, muted)
    local bg_color
    local fill_color
    local image
    if muted then
        fill_color = muted_color
        bg_color = muted_background_color
        image = beautiful.vol_icon_muted
    else
        fill_color = active_color
        bg_color = active_background_color
        image = beautiful.vol_icon
    end
    icon.image = image
    volume_bar.value = volume
    volume_bar.color = fill_color
    volume_bar.background_color = bg_color
end)

return vol_group