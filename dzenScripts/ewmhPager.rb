#!/usr/bin/ruby
#https://github.com/jblake/ewmhpager/blob/master/ewmhpager

def parse_xprop( data )

  cardinal = data.match( /\(CARDINAL\) = (\d+(?:, \d+)*)/ )
  if ( cardinal ) then
    return cardinal[1].split( ", " ).map { |c| c.to_i }
  end

  utf8string = data.match( /\(UTF8_STRING\) = "([^"\\]*(?:(?:\\\\|\\"|", ")[^"\\]*)*)"/ )
  if ( utf8string ) then
    return utf8string[1].split( "\", \"" ).map { |s| s.gsub( /\\(.)/, "\\1" ) }
  end

  window = data.match( /\(WINDOW\): window id # (0x[0-9a-f]+(?:, 0x[0-9a-f]+)*)/ )
  if ( window ) then
    return window[1].split( ", " )
  end

  return nil

end

def root_prop( prop )

  xprop = IO.popen( "-", "r" ) do | pipe |
    if ( not pipe ) then
      Kernel.exec( "xprop", "-root", prop )
    end

    pipe.read()
  end

  return parse_xprop( xprop )

end

def window_prop( window, prop )

  xprop = IO.popen( "-", "r" ) do | pipe |
    if ( not pipe ) then
      Kernel.exec( "xprop", "-id", window, prop )
    end

    pipe.read( )
  end

  return parse_xprop( xprop )

end

desktop_names = root_prop( "_NET_DESKTOP_NAMES" )
this_desktop = root_prop( "_NET_CURRENT_DESKTOP" )[0]
current_window = root_prop( "_NET_ACTIVE_WINDOW" )[0]

window_list = root_prop( "_NET_CLIENT_LIST_STACKING" )

n = 1
desktop_names.each_index( ) do | i |

  if ( n < 13 ) then
    desktop_names[i] = "F#{n}"
  end

  n += 1

end

windows = { }
if ( window_list ) then
  window_list.each( ) do | id |

    name = window_prop( id, "_NET_WM_NAME" )
    if ( name ) then
      name = name[0].gsub( /(#)/, '\\\\\\1' )
    else
      name = "unknown"
    end

    windows[id] = { }
    windows[id][:name] = name
    windows[id][:desktop] = window_prop( id, "_NET_WM_DESKTOP" )[0]

  end
end

desktop_names.each_index( ) do | i |
  desktop = desktop_names[i]

  if ( i == this_desktop ) then
    # $stdout.write( "${alignr}${color #00ff00}#{desktop}${color}\n" )
    $stdout.write( "^ca(1,wmctrl -s #{i})^i(/home/bee/.dzen/icons/tag_curr.xpm)^ca()" )
  else
    # $stdout.write( "${alignr}#{desktop}\n" )
    $stdout.write( "^ca(1,wmctrl -s #{i})^i(/home/bee/.dzen/icons/tag.xpm)^ca()" )
  end

  window_list.each( ) do | id |
    win = windows[id]
    if ( win[:desktop] == i ) then

      # if ( id == current_window ) then
        # $stdout.write( "${color #ff0000}#{win[:name]}${color}\n" )
        # $stdout.write( "^ca(1,wmctrl -s " $i ")^i(/home/bee/.dzen/icons/tag_curr.xpm)^ca()" )
      # else
        # $stdout.write( "#{win[:name]}\n" )
      # end

    end
  end

  # $stdout.write( "\n" )
end