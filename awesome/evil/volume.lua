-- Provides:
-- evil::volume
--      volume percentage (integer)
--      muted (boolean)
local awful = require("awful")

local get_volume = [[
    bash -c "
    amixer get Master | grep 'Front Left:' | awk '{print $5, $6}' | tr -d '[]%'
	"]]

local function emit_volume_info()
	awful.spawn.easy_async(get_volume,
		function(stdout)
            local volume = stdout:match('(%w+) ')
			local muted = stdout:match('off')

			if muted ~= nil then
				awesome.emit_signal("evil::volume", tonumber(volume), true)
			else
				awesome.emit_signal("evil::volume", tonumber(volume), false)
			end
		end
	)
end

-- Run once to initialize widgets
emit_volume_info()

-- Sleeps until pactl detects an event (volume up/down/toggle mute)
local volume_script = [[
    bash -c '
    pactl subscribe 2> /dev/null | grep --line-buffered "sink"
    ']]

-- Kill old pactl subscribe processes
awful.spawn.easy_async_with_shell("ps x | grep 'pactl subscribe' | grep -v grep | awk '{print $1}' | xargs kill", function ()
    -- Run emit_volume_info() with each line printed
    awful.spawn.with_line_callback(volume_script, {
        stdout = function(line)
            emit_volume_info()
        end
    })

end)