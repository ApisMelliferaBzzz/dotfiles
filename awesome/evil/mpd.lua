-- Provides:
-- evil::mpd
--      artist (string)
--      song (string)
--      paused (boolean)
local awful = require("awful")
local naughty = require("naughty")

local function emit_info()
    awful.spawn.easy_async("mpc -h bucCelLati@0.0.0.0 current -f '%artist% - %title% (%date% - %album%)'",
		function(stdout)
			-- naughty.notification({title = "stdout", text = "stdout", timeout = 100})
            -- local artist = stdout:match('(.*)@@')
			-- -- awful.spawn("notify-send test" .. artist)
            -- local title = stdout:match('@@(.*)@')
            -- title = string.gsub(title, '^%s*(.-)%s*$', '%1')
            -- local status = stdout:match('%[(.*)%]')
            -- status = string.gsub(status, '^%s*(.-)%s*$', '%1')

            -- local paused
            -- if status == "playing" then
            --     paused = false
            -- else
            --     paused = true
            -- end

            awesome.emit_signal("evil::mpd", stdout)
        end
    )
end

-- Run once to initialize widgets
emit_info()

-- Sleeps until mpd changes state (pause/play/next/prev)
local mpd_script = [[
  sh -c '
    mpc -h bucCelLati@0.0.0.0 idleloop player
  ']]

-- Kill old mpc idleloop player process
awful.spawn.easy_async_with_shell("ps x | grep 'mpc -h bucCelLati@0.0.0.0 idleloop player' | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Emit song info with each line printed
    awful.spawn.with_line_callback(mpd_script, {
        stdout = function(line)
            emit_info()
        end
    })
end)