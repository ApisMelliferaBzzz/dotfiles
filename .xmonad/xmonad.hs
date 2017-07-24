--
-- xmonad example config file for xmonad-0.9
--
-- A template showing all available configuration hooks,
-- and how to override the defaults in your own xmonad.hs conf file.
--
-- Normally, you'd only override those defaults you care about.
--
-- NOTE: Those updating from earlier xmonad versions, who use
-- EwmhDesktops, safeSpawn, WindowGo, or the simple-status-bar asd
-- setup functions (dzen, xmobar) probably need to change
-- xmonad.hs, please see the notes below, or the following
-- link for more details:
--
-- http://www.haskell.org/haskellwiki/Xmonad/Notable_changes_since_0.8
--
 
--import XMonad
--import Data.Monoid
--import System.Exit
--import XMonad.Layout.Tabbed
--import XMonad.Hooks.DynamicLog
--import XMonad.Hooks.ManageDocks

--import qualified XMonad.StackSet as W
--import qualified Data.Map        as M
import XMonad.Hooks.Minimize
import XMonad.Layout.Minimize
import XMonad hiding ( (|||) )
-- Prompt
import XMonad.Prompt
import XMonad.Prompt.RunOrRaise (runOrRaisePrompt)
import XMonad.Prompt.AppendFile (appendFilePrompt)
-- Hooks
import XMonad.Operations
 
import System.IO
import System.Exit
import Data.Monoid

import XMonad.Util.Run
 
 
import XMonad.Actions.CycleWS
 
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.SetWMName
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.UrgencyHook
--import XMonad.Hooks.FadeInactive
import XMonad.Hooks.EwmhDesktops
 
import XMonad.Layout hiding ( (|||) )
--import XMonad.Layout.NoBorders (smartBorders, noBorders)
import XMonad.Layout.PerWorkspace (onWorkspace, onWorkspaces)
import XMonad.Layout.Reflect (reflectHoriz)
import XMonad.Layout.IM
import XMonad.Layout.SimpleFloat
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.LayoutHints
import XMonad.Layout.LayoutModifier
import XMonad.Layout.ToggleLayouts
import XMonad.Layout.SubLayouts
import XMonad.Layout.WindowNavigation
import XMonad.Layout.BoringWindows
import XMonad.Layout.Grid
import XMonad.Layout.Tabbed
import XMonad.Layout.Accordion
import XMonad.Layout.LayoutCombinators
import XMonad.Layout.Gaps
import XMonad.Layout.Simplest
import qualified XMonad.StackSet as W
import XMonad.Util.EZConfig
import XMonad.Layout.WindowArranger
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.MultiToggle
import XMonad.Layout.MultiToggle.Instances

import Data.Ratio ((%))
import Data.List
import XMonad.Actions.CycleWS (prevWS, nextWS)

import qualified XMonad.StackSet as W
import qualified Data.Map as M
 
-- The preferred terminal program, which is used in a binding below and by
-- certain contrib modules.
--
myTerminal      = "urxvtc"
 
-- Whether focus follows the mouse pointer.
myFocusFollowsMouse :: Bool
myFocusFollowsMouse = False
 
-- Width of the window border in pixels.
--
myBorderWidth   = 0
 
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask       = mod1Mask
 
-- NOTE: from 0.9.1 on numlock mask is set automatically. The numlockMask
-- setting should be removed from configs.
--
-- You can safely remove this even on earlier xmonad versions unless you
-- need to set it to something other than the default mod2Mask, (e.g. OSX).
--
-- The mask for the numlock key. Numlock status is "masked" from the
-- current modifier status, so the keybindings will work with numlock on or
-- off. You may need to change this on some systems.
--
-- You can find the numlock modifier by running "xmodmap" and looking for a
-- modifier with Num_Lock bound to it:
--
-- > $ xmodmap | grep Num
-- > mod2        Num_Lock (0x4d)
--
-- Set numlockMask = 0 if you don't have a numlock key, or want to treat
-- numlock status separately.
--
-- myNumlockMask   = mod2Mask -- deprecated in xmonad-0.9.1
------------------------------------------------------------
 
 
-- The default number of workspaces (virtual screens) and their names.
-- By default we use numeric strings, but any string may be used as a
-- workspace name. The number of workspaces is determined by the length
-- of this list.
--
-- A tagging example:
--
-- > workspaces = ["web", "irc", "code" ] ++ map show [4..9]
--
--myWorkspaces    = clickable . (map dzenEscape) $ ["α","β","γ","δ","ε","ζ","η","θ","ι","κ"]
--myWorkspaces    = [":1:",":2:",":3:",":4:",":5:"]
myWorkspaces :: [String]
myWorkspaces    = clickable . (map dzenEscape) $ ["✝","✝","✝","✝","✝","✝","✝","✝","✝","✝"]
  where 
    clickable l = [ "^ca(1,xdotool key alt+" ++ show (n) ++ ")" ++ ws ++ "^ca()" | (i,ws) <- zip [1..] l, let n = i ]

--fullscreenHook = composeOne [ isFullscreen -?> doFullFloat ]
-- Border colors for unfocused and focused windows, respectively.
--
--borderWidth' :: Dimension
--borderWidth' = 4
--myBorderWidth = 4
myNormalBorderColor  = "#202020"
myFocusedBorderColor = "#228899"

--myXmonadBar = "dzen2 -x '23' -y '0' -h '21' -fn '-*-*-*-*-*-*-12-*-*-*-*-*-*-*' -w '200' -ta 'l' -fg '#444444' -bg '#303030' -e 'onstart=lower'"
--myLeftBar = "sh ~/.config/dzenScripts/ewmhPanelLeft.sh | dzen2 -x 0 -y 0 -h 21 -w 1368 -ta l -fn 'Terminus:pixelsize=12' -bg '#333' -e 'onstart=lower' "
--myRightBar = "sh ~/.config/dzenScripts/ewmhPanelRight.sh | dzen2 -x 1368 -y 0 -h 21 -w 552 -ta l -fn 'Terminus:pixelsize=12' -bg '#333' -e 'onstart=lower' "
--myMpdBar = "sh ~/.xmonad/mpd.sh | dzen2 -x '214' -h '21' -w '1025' -fn '-*-terminus-*-*-*-*-12-*-*-*-*-*-*-*'            -ta 'l' -bg '#303030' -fg '#333333' -y '0'"
--myStatusBar = "sh /home/bee/.i3/xmodzen.sh | dzen2 -x '1239' -w '681' -h '21' -fn '-*-terminus-*-*-*-*-12-*-*-*-*-*-*-*' -ta 'r' -bg '#202020' -fg '#333333' -y '0' -p -u "
--myProgressBar = "sleep 3 && sh ~/.i3/progress_bar.sh | dzen2 -x '220' -w '1002' -h '2' -ta 'l' -bg '#333' -y '0' -title-name 'progress_bar' -e 'onstart=normal' "
-- -x '237'
--myMenuButton = "sh /home/bee/.xmonad/menubutt.sh | dzen2 -h '21' -x '0' -y '0' -w '23' -ta 'l' -fg '#558899' -bg '#202020' "
--myMenuButton = "sh /home/bee/.xmonad/menubutt.sh | dzen2 -h '21' -x '0' -y '0' -w '23' -fg '#558899' -bg '#202020' "
myBitmapsDir = "/home/bee/.dzen/icons/"
 
------------------------------------------------------------------------
-- Key bindings. Add, modify or remove key bindings here.
-- 

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
 
    -- launch a terminal
    [ ((modm , xK_Return), spawn $ XMonad.terminal conf)
 
    -- launch dmenu
--    , ((modm,               xK_p     ), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")
--    , ((0,               xK_Menu     ), spawn "exe=`dmenu_run` && eval \"exec $exe\"")
--    , ((0,               xK_Menu     ), spawn "sh /home/bee/.xmonad/menu.sh")
    , ((0                                 , xK_Super_L     ), spawn "mygtkmenu /home/bee/.i3/LaunchMenuTop")
    , ((modm                 .|. shiftMask, xK_p    ), spawn "gmrun")
    , ((0                                 , 0x1008ff10), spawn "amixer -q set Master toggle")
    , ((0                                 , 0x1008ff13), spawn "amixer set Master 3dB+"     )
    , ((0                                 , 0x1008ff11), spawn "amixer set Master 3dB-"     )
    , ((modm                              , xK_bracketleft),  prevWS)
    , ((modm                              , xK_bracketright), nextWS)
    , ((modm                              , xK_z    ), spawn "mpc -h bucCelLati@0.0.0.0 prev"     )
    , ((modm                              , xK_x    ), spawn "mpc -h bucCelLati@0.0.0.0 toggle"   )
    , ((modm                              , xK_c    ), spawn "mpc -h bucCelLati@0.0.0.0 next"     )
    , ((modm                              , xK_F4   ), kill)
    , ((modm                              , xK_space), sendMessage NextLayout)
    , ((modm                 .|. shiftMask, xK_space), setLayout $ XMonad.layoutHook conf)
    , ((modm                              , xK_n    ), refresh)    -- Resize viewed windows to the correct size
    , ((0                                 , xK_Pause), spawn "sh /home/bee/.i3/calendar.sh")
    , ((modm                              , xK_Tab  ), windows W.focusDown  )
    , ((modm                              , xK_j    ), windows W.focusDown  )
    , ((modm                              , xK_k    ), windows W.focusUp    )
    , ((modm                              , xK_m    ), windows W.focusMaster)
    , ((modm                 .|. shiftMask, xK_j    ), windows W.swapDown   )
    , ((modm                 .|. shiftMask, xK_k    ), windows W.swapUp     )
    --, ((modm                              , xK_F2   ), sendMessage  ToggleGaps)
    , ((modm                              , xK_F2   ), withFocused minimizeWindow)
    , ((modm                 .|. shiftMask, xK_F2   ), sendMessage RestoreNextMinimizedWin)
    , ((modm                              , xK_F3   ), sendMessage  ToggleLayout)
    --, ((modm                              , xK_f    ), sendMessage  Toggle FULL)
    , ((modm                              , xK_h    ), sendMessage  Shrink      )
    , ((modm                              , xK_l    ), sendMessage  Expand      )
    , ((modm                 .|. shiftMask, xK_h    ), sendMessage  MirrorShrink)
    , ((modm                 .|. shiftMask, xK_l    ), sendMessage  MirrorExpand)
    , ((modm .|. controlMask              , xK_s    ), sendMessage  Arrange         )
    , ((modm .|. controlMask .|. shiftMask, xK_s    ), sendMessage  DeArrange       )
    , ((modm .|. controlMask              , xK_Left ), sendMessage (MoveLeft      1))
    , ((modm .|. controlMask              , xK_Right), sendMessage (MoveRight     1))
    , ((modm .|. controlMask              , xK_Down ), sendMessage (MoveDown      1))
    , ((modm .|. controlMask              , xK_Up   ), sendMessage (MoveUp        1))
    , ((modm                 .|. shiftMask, xK_Left ), sendMessage (IncreaseLeft  10))
    , ((modm                 .|. shiftMask, xK_Right), sendMessage (IncreaseRight 10))
    , ((modm                 .|. shiftMask, xK_Down ), sendMessage (IncreaseDown  10))
    , ((modm                 .|. shiftMask, xK_Up   ), sendMessage (IncreaseUp    10))
    , ((modm .|. controlMask .|. shiftMask, xK_Left ), sendMessage (DecreaseLeft  10))
    , ((modm .|. controlMask .|. shiftMask, xK_Right), sendMessage (DecreaseRight 10))
    , ((modm .|. controlMask .|. shiftMask, xK_Down ), sendMessage (DecreaseDown  10))
    , ((modm .|. controlMask .|. shiftMask, xK_Up   ), sendMessage (DecreaseUp    10))
    , ((0                                 , xK_Print), spawn "scrot -e 'mv $f /home/bee/Media_storage/images 2>/dev/null'")
    -- Push window back into tiling
    , ((modm,               xK_t     ), withFocused $ windows . W.sink)
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1))
    , ((modm              , xK_period), sendMessage (IncMasterN (-1)))
 
    -- SUBLAYOUT
    , ((modm .|. controlMask              , xK_h    ), sendMessage $ pullGroup L)
    , ((modm .|. controlMask              , xK_l    ), sendMessage $ pullGroup R)
    , ((modm .|. controlMask              , xK_k    ), sendMessage $ pullGroup U)
    , ((modm .|. controlMask              , xK_j    ), sendMessage $ pullGroup D)

    , ((modm .|. controlMask              , xK_m    ), withFocused (sendMessage . MergeAll))
    , ((modm .|. controlMask              , xK_u    ), withFocused (sendMessage . UnMerge))

    , ((modm .|. controlMask              , xK_period), onGroup W.focusUp')
    , ((modm .|. controlMask              , xK_comma), onGroup W.focusDown')

    --, ((modm                              , xK_j    ), focusDown)
    --, ((modm                              , xK_k    ), focusUp  )
    -- Toggle the status bar gap
    -- Use this binding with avoidStruts from Hooks.ManageDocks.
    -- See also the statusBar function from Hooks.DynamicLog.
    --
    -- , ((modm              , xK_b     ), sendMessage ToggleStruts)
    -- Quit xmonad
    , ((modm .|. shiftMask, xK_e     ), io (exitWith ExitSuccess))
    --, ((modm .|. shiftMask, xK_q     ), spawn "shutdown")
    --, ((modm .|. shiftMask, xK_w     ), spawn "reboot")
 
    -- Restart xmonad
    , ((modm              , xK_q     ), spawn "killall conky && killall tint2 && killall dzen2 && killall compton && xmonad --recompile; xmonad --restart")
    ]
    ++
 
    --
    -- mod-[1..9], Switch to workspace N
    --
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    --
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
    ++
 
    --
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    --
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
 
 
------------------------------------------------------------------------
-- Mouse bindings: default actions bound to mouse events
--
button6 :: Button
button6 = 6
button7 :: Button
button7 = 7
button8 :: Button
button8 = 8
button9 :: Button
button9 = 9
button10 :: Button
button10 = 10
--additionalMouseBindings :: XConfig a -> [((ButtonMask, Button), Window -> X ())] -> XConfig a

myMouseBindings :: XConfig Layout -> M.Map (KeyMask, Button) (Window -> X ())
myMouseBindings (XConfig {XMonad.modMask = modm}) = M.fromList $
    -- mod-button1, Set the window to floating mode and move by dragging
    [
    ((modm, button1), (\w -> focus w >> mouseMoveWindow w
                                     >> windows W.shiftMaster))
 
    -- mod-button2, Raise the window to the top of the stack
    , ((modm, button2), (\w -> focus w >> windows W.shiftMaster))
 
    -- mod-button3, Set the window to floating mode and resize by dragging
    , ((modm, button3), (\w -> focus w >> mouseResizeWindow w
                                       >> windows W.shiftMaster))
 
    -- you may also bind events to the mouse scroll wheel (button4 and button5)
    --, ((0, button9), (\w -> focus w >> mouseMoveWindow w
    --                                   >> windows W.shiftMaster))
    ]
    -- 'additionalMouseBindings' 
    --[
    --((0, 8), (\w ->focus w >> mouseMoveWindow w
    --                                 >> windows W.shiftMaster))
    --]
 
------------------------------------------------------------------------
-- Layouts:
 
-- You can specify and transform your layouts by modifying these values.
-- If you change layout bindings be sure to use 'mod-shift-space' after
-- restarting (with 'mod-q') to reset your layout state to the new
-- defaults, as xmonad preserves your old layout settings by default.
--
-- * NOTE: XMonad.Hooks.EwmhDesktops users must remove the obsolete
-- ewmhDesktopsLayout modifier from layoutHook. It no longer exists.
-- Instead use the 'ewmh' function from that module to modify your
-- defaultConfig as a whole. (See also logHook, handleEventHook, and
-- startupHook ewmh notes.)
--
-- The available layouts.  Note that each layout is separated by |||,
-- which denotes layout choice.
--
myTabConfig = defaultTheme { inactiveBorderColor = "#202020"
                                   , inactiveTextColor = "#888888"
                                   , activeTextColor = "#aaaaaa"
                                   , activeColor = "#202020"
                                   , fontName = "terminus"
                                   , decoHeight = 21
                                   , decoWidth = 2000
                                   , inactiveColor = "#202020"
                                   , activeBorderColor = "#202020"}

--layoutHook = gaps [(U,18), (R,23)] $ Tall 1 (3/100) (1/2) ||| Full  -- leave gaps at the top and right
--myLayout = (gaps [(U,71),(R,50),(D,50),(L,50)] $ avoidStruts Full) ||| (gaps [(U,46),(R,25),(D,25),(L,25)] $ spacing 25 $ avoidStrutsOn [U] $ ResizableTall 1 (3/100) (1/2) [])
myLayout = minimize $ toggleLayouts ((gaps [(U,21),(D,21)] $ Full ) ||| (boringWindows $ gaps [(U,21),(D,21)] $ ResizableTall 1 (3/100) (1/2) [])) ((boringWindows $ gaps [(U,46),(R,25),(D,46),(L,25)] $ spacing 25 $  ResizableTall 1 (3/100) (1/2) []) ||| (boringWindows $ gaps [(U,46),(R,25),(D,46),(L,25)] $ spacing 25 $ Full))
-- $ mkToggle (NOBORDERS $ FULL $ EOT) 
-- $ simpleDeco shrinkText myTabConfig
 --where
    -- default tiling algorithm partitions the screen into two panes
    --tiled   = ResizableTall nmaster delta ratio
    --tiled   = ResizableTall 1 (3/100) (1/2) []
 
    -- The default number of windows in the master pane
    --nmaster = 1
 
    -- Default proportion of screen occupied by master pane
    --ratio   = 1/2
 
    -- Percent of screen to increment by when resizing panes
    --delta   = 3/100
 
------------------------------------------------------------------------
-- Window rules:
 
-- Execute arbitrary actions and WindowSet manipulations when managing
-- a new window. You can use this to, for example, always float a
-- particular program, or have a client always appear on a particular
-- workspace.
--
-- To find the property name associated with a program, use
-- > xprop | grep WM_CLASS
-- and click on the client you're interested in.
--
-- To match on the WM_NAME, you can use 'title' in the same way that
-- 'className' and 'resource' are used below.
--
myManageHook = composeAll 
    [ className =? "MPlayer"        --> doFloat
--    , className =? "Gimp"           --> doFloat
    , className =? "feh"           --> doFloat
    , isFullscreen                  --> doFullFloat
    , className =? "firefox"           --> doFloat
    , className =? "mpv"           --> doFloat
    , className =? "bomi"           --> doFloat
    , title =? "Cities: Skylines"           --> doFloat
    , title =? "Guilty Gear Xrd -SIGN-"           --> doFloat
    , className =? "Conky"          --> doCenterFloat
    , resource  =? "desktop_window" --> doIgnore
    , resource  =? "kdesktop"       --> doIgnore 
    ] <+> manageDocks

--fullscreenHook = composeOne     [ isFullscreen -?> doFullFloat ]
 
------------------------------------------------------------------------
-- Event handling
 
-- Defines a custom handler function for X Events. The function should
-- return (All True) if the default handler is to be run afterwards. To
-- combine event hooks use mappend or mconcat from Data.Monoid.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH event handling to your custom event hooks by
-- combining them with ewmhDesktopsEventHook.
--
myEventHook = handleEventHook defaultConfig <+> fullscreenEventHook <+> minimizeEventHook
 
------------------------------------------------------------------------
-- Status bars and logging
 
-- Perform an arbitrary action on each internal state change or X event.
-- See the 'XMonad.Hooks.DynamicLog' extension for examples.
--
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add EWMH logHook actions to your custom log hook by
-- combining it with ewmhDesktopsLogHook.
--
--myLogHook = return ()
myLogHook :: Handle -> X ()
myLogHook h = dynamicLogWithPP $ dzenPP
    {
        ppCurrent           =   dzenColor "#888888" "#202020" . pad
      , ppVisible           =   dzenColor "#888888" "#303030" . pad
      , ppHidden            =   dzenColor "#888888" "#303030" . pad
      , ppHiddenNoWindows   =   dzenColor "#444444" "#303030" . pad
      , ppUrgent            =   dzenColor "#202020" "#888888" . dzenStrip
      --, ppWsSep             =   ""
      --, ppSep               =   ""
--ebac54
      , ppLayout            =   dzenColor "#558899" "#303030" .
                                (\x -> case x of
                                    "✝"             ->      "^p(3;3)^i(/home/bee/.dzen/icons/tag_curr.png) "
                                    "Minimize Spacing 25 ResizableTall"             ->      "^p(3;3)^i(/home/bee/.i3/icons/tall.xbm) "
                                    --"Mirror Spacing 25 Tall"      ->      "^i(/home/bee/.i3/icons/mtall.xbm)"
                                    "Minimize Spacing 25 Full"             ->      "^p(3;3)^i(/home/bee/.i3/icons/xFullxGaps.xbm) "
                                    "Minimize Full"             ->      "^p(3;3)^i(/home/bee/.i3/icons/xFull.xbm) "
                                    "Minimize ResizableTall"             ->      "^p(3;3)^i(/home/bee/.i3/icons/tall.xbm) "
                                    --"Accordion"        ->      "^i(/home/bee/.i3/icons/accor.xbm)"
                                    _                  ->      x
                                ) . dzenEscape
      --, ppTitle             =   (" " ++) . dzenColor "#888888" "#303030" . dzenEscape
      , ppOutput            =   hPutStrLn h
    }

------------------------------------------------------------------------
-- Startup hook
 
-- Perform an arbitrary action each time xmonad starts or is restarted
-- with mod-q.  Used by, e.g., XMonad.Layout.PerWorkspace to initialize
-- per-workspace layout choices.
--
-- By default, do nothing.
--
-- * NOTE: EwmhDesktops users should use the 'ewmh' function from
-- XMonad.Hooks.EwmhDesktops to modify their defaultConfig as a whole.
-- It will add initialization of EWMH support to your custom startup
-- hook by combining it with ewmhDesktopsStartup.
--
--myStartupHook :: m1
--myStartupHook :: m0-- -> X ()
 
------------------------------------------------------------------------
-- Now run xmonad with all the defaults we set up.
 
-- Run xmonad with the settings you specify. No need to modify this.
--

--main = xmonad defaults
 
---- A structure containing your configuration settings, overriding
---- fields in the default config. Any you don't override, will
---- use the defaults defined in xmonad/XMonad/Config.hs
----
---- No need to modify this.
----

--defaults = defaultConfig {
--      -- simple stuff
--        terminal           = myTerminal,
--        focusFollowsMouse  = myFocusFollowsMouse,
--        borderWidth        = myBorderWidth,
--        modMask            = myModMask,
--        -- numlockMask deprecated in 0.9.1
--        -- numlockMask        = myNumlockMask,
--        workspaces         = myWorkspaces,
--        normalBorderColor  = myNormalBorderColor,
--        focusedBorderColor = myFocusedBorderColor,
 
--      -- key bindings
--        keys               = myKeys,
--        mouseBindings      = myMouseBindings,
 
--      -- hooks, layouts
--        layoutHook         = myLayout,
--        manageHook         = myManageHook,
--        handleEventHook    = myEventHook,
--        logHook            = myLogHook,
--        startupHook        = myStartupHook
----        borderWidth        = 2
--    }
main = do
    xmproc     <- spawnPipe "tint2 -c /home/bee/.config/tint2/tint2rc"
    --dzenLeftBar <- spawnPipe myLeftBar
    --dzenRightBar <- spawnPipe myRightBar
    --dzenLeftBar <- spawnPipe myXmonadBar
    --dzenRightBar <- spawnPipe myStatusBar
    --dzenCenterBar <- spawnPipe myMpdBar
    --dzenMenuButton <- spawnPipe myMenuButton
    --dzenProgressBar <- spawnPipe myProgressBar
    xmonad $ ewmh $ withUrgencyHook NoUrgencyHook $ defaultConfig 
        { terminal            = myTerminal
        , workspaces          = myWorkspaces
        , keys                = myKeys
        , modMask             = myModMask
        , focusFollowsMouse   = myFocusFollowsMouse
        , layoutHook          = myLayout
        --noFrillsDeco shrinkText myTabConfig $ 
        --, layoutHook          = gaps [(U,18), (R,23)] $ Tall 1 (3/100) (1/2) ||| Full  -- leave gaps at the top and right
        , manageHook          = myManageHook <+> doFloat
        , handleEventHook     = myEventHook
--        , startupHook         = myStartupHook
        , startupHook         = spawn "sh /home/bee/.xmonad/autostart.sh"
        --, logHook             = myLogHook dzenBar-- >> fadeInactiveLogHook 0xdddddddd
        , normalBorderColor   = myNormalBorderColor
        , focusedBorderColor  = myFocusedBorderColor
        , borderWidth         = myBorderWidth
}
