local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local awful = require("awful")

-- Set colors
local title_color =  beautiful.mpd_song_title_color or beautiful.wibar_fg or '#808080'
local artist_color = beautiful.mpd_song_artist_color or beautiful.wibar_fg or '#808080'
local paused_color = beautiful.mpd_song_paused_color or beautiful.normal_fg or '#808080'

local widget_buttons = gears.table.join(
                    awful.button({ }, 1, function() awful.spawn("mpc -h bucCelLati@0.0.0.0 toggle") end),
                    awful.button({ }, 4, function() awful.spawn("mpc -h bucCelLati@0.0.0.0 prev") end),
                    awful.button({ }, 5, function() awful.spawn("mpc -h bucCelLati@0.0.0.0 next") end)
                )

local mpd_title = wibox.widget{
    text = "---------",
    align = "center",
    valign = "center",
    widget = wibox.widget.textbox
}

-- Main widget
local mpd_song = wibox.widget{
    mpd_title,
    layout = wibox.layout.fixed.horizontal,
    buttons = widget_buttons
}

local artist_fg
local artist_bg
awesome.connect_signal("evil::mpd", function(status)
    awful.spawn("notify-send " .. status)
    if status == "paused" then
        artist_fg = paused_color
        title_fg = paused_color
    else
        artist_fg = artist_color
        title_fg = title_color
    end

    -- Escape &'s
    -- title = string.gsub(title, "&", "&amp;")
    -- artist = string.gsub(artist, "&", "&amp;")

    mpd_title.markup =
        "<span foreground='" .. title_fg .."'>"
        .. status .. "</span>"
    -- mpd_artist.markup =
    --     "<span foreground='" .. artist_fg .."'>"
    --     .. artist .. "</span>"
end)

return mpd_song