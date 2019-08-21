-------------------------------
--  "Zenburn" awesome theme  --
--    By Adrian C. (anrxc)   --
-------------------------------

local themes_path = "/home/bee/.config/awesome/themes/"
local awful = require("awful")
-- local themes_path = require("gears.filesystem").get_themes_dir()
local dpi = require("beautiful.xresources").apply_dpi

-- {{{ Main
local theme = {}
-- theme.wallpaper = awful.spawn("xsetroot -solid '#808080'")
theme.wallpaper1 = themes_path .. "custom/wallpaper1.jpg"
theme.wallpaper2 = themes_path .. "custom/wallpaper2.jpg"
-- }}}

-- {{{ Styles
theme.font      = "Terminus (TTF) 11"

-- {{{ Colors
theme.fg_normal  = "#666666"
theme.fg_focus   = "#666666"
theme.fg_urgent  = "#ffffff"
theme.bg_normal  = "#202020"
theme.bg_focus   = "#101010"
theme.bg_urgent  = "#404040"
theme.bg_systray = theme.bg_normal
-- }}}

-- {{{ Borders
theme.useless_gap   = 30
theme.border_width  = 0
theme.border_normal = "#3F3F3F"
theme.border_focus  = "#6F6F6F"
theme.border_marked = "#CC9393"
-- }}}

-- {{{ Titlebars
theme.titlebar_bg_focus  = "#101010"
theme.titlebar_bg_normal = "#202020"
-- }}}

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- [taglist|tasklist]_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- titlebar_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- Example:
--theme.taglist_bg_focus = "#CC9393"
-- }}}

-- {{{ Widgets
-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.fg_widget        = "#AECF96"
--theme.fg_center_widget = "#88A175"
--theme.fg_end_widget    = "#FF5656"
--theme.bg_widget        = "#494B4F"
--theme.border_widget    = "#3F3F3F"
-- }}}

-- {{{ Mouse finder
theme.mouse_finder_color = "#CC9393"
-- mouse_finder_[timeout|animate_timeout|radius|factor]
-- }}}

theme.mem_icon = themes_path .. "custom/panel/mem.png"
theme.cpu_icon = themes_path .. "custom/panel/cpu.png"
theme.vol_icon = themes_path .. "custom/panel/spkr.png"
theme.vol_icon_muted = themes_path .. "custom/panel/spkr_muted.png"

-- {{{ Menu
-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_height = dpi(20)
theme.menu_width  = dpi(100)
-- }}}

-- {{{ Icons
-- {{{ Taglist
theme.taglist_squares_sel   = themes_path .. "custom/taglist/squarefz.png"
theme.taglist_squares_unsel = themes_path .. "custom/taglist/squarez.png"
--theme.taglist_squares_resize = "false"
-- }}}

-- {{{ Misc
theme.awesome_icon           = themes_path .. "custom/awesome-icon.png"
theme.menu_submenu_icon      = themes_path .. "default/submenu.png"
-- }}}

-- {{{ Layout
theme.layout_tile       = themes_path .. "custom/layouts/tile.png"
theme.layout_max        = themes_path .. "custom/layouts/max.png"
theme.layout_floating   = themes_path .. "custom/layouts/floating.png"
-- }}}

-- {{{ Titlebar
theme.titlebar_close_button_focus  = themes_path .. "custom/titlebar/close_focus.png"
theme.titlebar_close_button_normal = themes_path .. "custom/titlebar/close_normal.png"

theme.titlebar_minimize_button_normal = themes_path .. "default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path .. "default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_focus_active  = themes_path .. "custom/titlebar/ontop_focus_active.png"
theme.titlebar_ontop_button_normal_active = themes_path .. "custom/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path .. "custom/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_inactive = themes_path .. "custom/titlebar/ontop_normal_inactive.png"

theme.titlebar_sticky_button_focus_active  = themes_path .. "custom/titlebar/sticky_focus_active.png"
theme.titlebar_sticky_button_normal_active = themes_path .. "custom/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path .. "custom/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_inactive = themes_path .. "custom/titlebar/sticky_normal_inactive.png"

theme.titlebar_floating_button_focus_active  = themes_path .. "custom/titlebar/floating_focus_active.png"
theme.titlebar_floating_button_normal_active = themes_path .. "custom/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_inactive  = themes_path .. "custom/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_inactive = themes_path .. "custom/titlebar/floating_normal_inactive.png"

theme.titlebar_maximized_button_focus_active  = themes_path .. "custom/titlebar/maximized_focus_active.png"
theme.titlebar_maximized_button_normal_active = themes_path .. "custom/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path .. "custom/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_inactive = themes_path .. "custom/titlebar/maximized_normal_inactive.png"
-- }}}
-- }}}

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
