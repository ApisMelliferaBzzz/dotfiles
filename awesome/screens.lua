local awful = require("awful")
local beautiful = require("beautiful")
local wibox = require("wibox")
local gears = require("gears")
local rambar = require("widgets.ram_bar")
local mpd_song = require("widgets.mpd_song")
local cpu_bar = require("widgets.cpu_bar")
local volume_bar = require("widgets.volume_bar")
beautiful.init("~/.config/awesome/themes/custom/theme.lua")

-- Keyboard map indicator and switcher
mykeyboardlayout = awful.widget.keyboardlayout()

-- {{{ Wibar
-- Create a textclock widget
mytextclock = wibox.widget.textclock()

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
    awful.layout.suit.tile,
    -- awful.layout.suit.tile.left,
    -- awful.layout.suit.tile.bottom,
    -- awful.layout.suit.tile.top,
    -- awful.layout.suit.fair,
    -- awful.layout.suit.fair.horizontal,
    -- awful.layout.suit.spiral,
    -- awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.floating,
    -- awful.layout.suit.max.fullscreen,
    -- awful.layout.suit.magnifier,
    -- awful.layout.suit.corner.nw,
    -- awful.layout.suit.corner.ne,
    -- awful.layout.suit.corner.sw,
    -- awful.layout.suit.corner.se,
}
-- }}}

mysystray = wibox.widget.systray()

-- Create a wibox for each screen and add it
local taglist_buttons = gears.table.join(
                    awful.button({ }, 1, function(t) t:view_only() end),
                    -- awful.button({ modkey }, 1, function(t)
                    --                           if client.focus then
                    --                               client.focus:move_to_tag(t)
                    --                           end
                    --                       end),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    -- awful.button({ modkey }, 3, function(t)
                    --                           if client.focus then
                    --                               client.focus:toggle_tag(t)
                    --                           end
                    --                       end),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(t.screen) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(t.screen) end)
                )

local tasklist_buttons = gears.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  c:emit_signal(
                                                      "request::activate",
                                                      "tasklist",
                                                      {raise = true}
                                                  )
                                              end
                                          end),
                     awful.button({ }, 3, function()
                                              awful.menu.client_list({ theme = { width = 250 } })
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                          end))

local function set_wallpaper(s)
    -- Wallpaper
    if s.geometry.width == 1920 then
        gears.wallpaper.maximized(beautiful.wallpaper1, s, true)
    elseif s.geometry.width == 1200 then
        gears.wallpaper.maximized(beautiful.wallpaper2, s, true)
    else
        awful.spawn("xsetroot -solid '#e0e0e0'")
    end
    -- if beautiful.wallpaper then
    --     local wallpaper = beautiful.wallpaper
    --     -- If wallpaper is a function, call it with the screen
    --     if type(wallpaper) == "function" then
    --         wallpaper = wallpaper(s)
    --     end
    --     gears.wallpaper.maximized(wallpaper, s, true)
    -- else
        -- awful.spawn("xsetroot -solid '#e0e0e0'")
    -- end
end

-- Re-set wallpaper when a screen's geometry changes (e.g. different resolution)
screen.connect_signal("property::geometry", set_wallpaper)

local separator = wibox.widget.separator{
	opacity = 0,
	color = '#ff0000',
	shape = gears.shape.circle,
	forces_width = 0,
}

screenCount = screen:count()

-- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9", "0" }, 1, awful.layout.layouts[1])
if screenCount == 1 then
    sharedtaglist = screen[1]
else
    awful.tag({ "", "", "", "", "" }, 1, awful.layout.layouts[1])
    awful.tag({ "", "", "", "", "" }, 2, awful.layout.layouts[1])
    -- awful.tag{
    --     names = { "1", "2", "3", "4", "5" },
    --     screen = 1,
    --     layout = awful.layout.layouts[1]
    -- }
    -- awful.tag{
    --     names = { "6", "7", "8", "9", "0" },
    --     screen = 2,
    --     layout = awful.layout.layouts[1]
    -- }
    sharedtaglist1 = screen[1]
    sharedtaglist2 = screen[2]
end

for s = 1, screenCount do
    screen[s]:connect_signal("tag::history::update", function ()     
            -- get a list of all tags 
            local atags = awful.tag.gettags(s)
            -- set the standard icon
            for i, t in ipairs(atags) do
                awful.tag.seticon(beautiful.tag_empty, t)
            end
            -- get a list of all running clients
            local clist = client.get(s)
            for i, c in ipairs(clist) do
                -- get the tags on which the client is displayed
                local ctags = c:tags()
                for i, t in ipairs(ctags) do
                    -- and set their icon
                    awful.tag.seticon(beautiful.tag_full, t)
                end
            end
    end)
end

awful.screen.connect_for_each_screen(function(s)
    -- Wallpaper
    set_wallpaper(s)
    -- awful.spawn.with_shell("notify-send '" .. s.outputs.name .. "'")

    -- Each screen has its own tag table.
    -- awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    -- awful.spawn.with_shell("notify-send '" .. my_tags[s.index][1] .. "'")
    -- awful.tag(my_tags[s.index], s, awful.layout.layouts[1])

    -- Create a promptbox for each screen
    s.mypromptbox = awful.widget.prompt()
    -- Create an imagebox widget which will contain an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    s.mylayoutbox = awful.widget.layoutbox(s)
    s.mylayoutbox:buttons(gears.table.join(
                           awful.button({ }, 1, function () awful.layout.inc( 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(-1) end),
                           awful.button({ }, 4, function () awful.layout.inc( 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(-1) end)))
    -- Create a taglist widget
    s.mytaglist = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = taglist_buttons
    }

    -- Create a tasklist widget
    s.mytasklist = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
    }

    -- s.padding.top = s.padding.top+20
    -- s.padding.bottom = s.padding.bottom+20
    -- s.padding = {left=s.padding.left, right=s.padding.right, top=s.padding.top+20, bottom=s.padding.bottom}
    
    -- Create the wibox
    s.mywibox = awful.wibar({ position = "bottom", screen = s, height = 20 })

    -- Add widgets to the wibox
    s.mywibox:setup {
        layout = wibox.layout.align.horizontal,
        s.mytasklist, -- Middle widget
        separator,
        mysystray,
    }

	s.left = wibox.widget{
		layout = wibox.layout.fixed.horizontal,
		spacing = 10,
		s.mytaglist,
		s.mylayoutbox,
		mpd_song,
	}

	s.right = wibox.widget{
		layout = wibox.layout.fixed.horizontal,
		spacing = 10,
		mykeyboardlayout,
		volume_bar,
		cpu_bar,
		rambar,
		mytextclock,
	}

    s.topbox = awful.wibar({ position = "top", screen = s, height = 20 })

    s.topbox:setup {
		layout = wibox.layout.align.horizontal,
		s.left,
		separator,
		s.right,
    }
end)
