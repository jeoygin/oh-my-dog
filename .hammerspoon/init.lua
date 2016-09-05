require 'extensions'

local mainScreen = '0,0'
local secondScreen = '-1,0'

local mod0 = {"cmd", "alt", "ctrl"}
local mod1 = {"cmd", "alt"}
local mod2 = {"cmd", "ctrl"}
local mod3 = {"cmd", "alt", "shift"}
local mod4 = {"cmd", "ctrl", "shift"} 

-- Set window animation off. It's much smoother.
hs.window.animationDuration = 0

local windowLayout = {
    {"Safari",  nil,          mainScreen,   hs.layout.left50,    nil, nil},
    {"Mail",    nil,          mainScreen,   hs.layout.right50,   nil, nil},
    {"Google Chrome",  nil,   mainScreen,   hs.layout.maximized, nil, nil},
    {"iTerm2",  nil,          secondScreen, hs.layout.maximized, nil, nil},
    {"iTunes",  "iTunes",     mainScreen,   hs.layout.maximized, nil, nil},
    {"iTunes",  "MiniPlayer", mainScreen,   nil, nil, hs.geometry.rect(0, -48, 400, 48)},
}
hs.layout.apply(windowLayout)

-- Set grid size.
hs.grid.GRIDWIDTH  = 6
hs.grid.GRIDHEIGHT = 3
hs.grid.MARGINX    = 0
hs.grid.MARGINY    = 0

switcher = hs.window.switcher.new(hs.window.filter.new():setCurrentSpace(true):setDefaultFilter())

hs.hotkey.bind('alt', 'tab' , function() switcher:next() end)

hs.hotkey.bind(mod4, 'I', launchOrCycleFocus("iTerm2"))
hs.hotkey.bind(mod4, 'C', launchOrCycleFocus("Google Chrome"))
hs.hotkey.bind(mod4, 'F', launchOrCycleFocus("Finder"))
hs.hotkey.bind(mod4, 'W', launchOrCycleFocus("企业微信"))
hs.hotkey.bind(mod4, 'Q', launchOrCycleFocus("QQ"))

hs.hotkey.bind(mod0, "H", function()
  hs.hints.windowHints()
end)

hs.hotkey.bind(mod0, "1", function()
  local win = hs.window.focusedWindow()
  win:moveToScreen(mainScreen)
end)

hs.hotkey.bind(mod0, "2", function()
  local win = hs.window.focusedWindow()
  win:moveToScreen(secondScreen)
end)

hs.hotkey.bind(mod0, "Left", function()
  hs.window.focusedWindow():moveOneScreenWest()
end)

hs.hotkey.bind(mod0, "Right", function()
  hs.window.focusedWindow():moveOneScreenEast()
end)

hs.hotkey.bind(mod0, "Up", function()
  hs.window.focusedWindow():moveOneScreenNorth()
end)

hs.hotkey.bind(mod0, "Down", function()
  hs.window.focusedWindow():moveOneScreenSouth()
end)

hs.hotkey.bind(mod0, "F", function()
  hs.window.focusedWindow():toggleFullScreen()
end)

hs.hotkey.bind(mod1, "F", function()
  hs.window.focusedWindow():maximize(0)
end)

hs.hotkey.bind(mod1, "C", function()
  hs.window.focusedWindow():centerOnScreen()
end)

hs.hotkey.bind(mod1, "H", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = f.x - sf.w / 10
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "L", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = f.x + sf.w / 10
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "J", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.y = f.y + sf.h / 10
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "K", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.y = f.y - sf.h / 10
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "U", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = f.x - sf.w / 10
  f.y = f.y - sf.h / 10
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "I", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = f.x + sf.w / 10
  f.y = f.y - sf.h / 10
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "N", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = f.x - sf.w / 10
  f.y = f.y + sf.h / 10
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "M", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = f.x + sf.w / 10
  f.y = f.y + sf.h / 10
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = sf.x
  f.y = sf.y
  f.w = sf.w / 2
  f.h = sf.h
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = sf.x + (sf.w / 2)
  f.y = sf.y
  f.w = sf.w / 2
  f.h = sf.h
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = sf.x
  f.y = sf.y
  f.w = sf.w
  f.h = sf.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = sf.x
  f.y = sf.y + (sf.h / 2)
  f.w = sf.w
  f.h = sf.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind(mod3, "Up", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = sf.x
  f.y = sf.y
  f.w = sf.w / 2
  f.h = sf.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind(mod3, "Right", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = sf.x + (sf.w / 2)
  f.y = sf.y
  f.w = sf.w / 2
  f.h = sf.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind(mod3, "Down", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = sf.x + (sf.w / 2)
  f.y = sf.y + (sf.h / 2)
  f.w = sf.w / 2
  f.h = sf.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind(mod3, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.x = sf.x
  f.y = sf.y + (sf.h / 2)
  f.w = sf.w / 2
  f.h = sf.h / 2
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "[", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.w = f.w - sf.w / 10 
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "]", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.w = f.w + sf.w / 10 
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "-", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.h = f.h - sf.h / 10 
  win:setFrame(f)
end)

hs.hotkey.bind(mod1, "=", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local sf = screen:frame()

  f.h = f.h + sf.h / 10 
  win:setFrame(f)
end)

hs.hotkey.bind(mod2, 'Left',  function()
  hs.window.focusedWindow():focusWindowWest()
end)
hs.hotkey.bind(mod2, 'Right', function()
  hs.window.focusedWindow():focusWindowEast()
end)
hs.hotkey.bind(mod2, 'Up',    function()
  hs.window.focusedWindow():focusWindowNorth()
end)
hs.hotkey.bind(mod2, 'Down',  function()
  hs.window.focusedWindow():focusWindowSouth()
end)

hs.hotkey.bind(mod2, 'J', hs.grid.pushWindowDown)
hs.hotkey.bind(mod2, 'K', hs.grid.pushWindowUp)
hs.hotkey.bind(mod2, 'H', hs.grid.pushWindowLeft)
hs.hotkey.bind(mod2, 'L', hs.grid.pushWindowRight)
hs.hotkey.bind(mod2, 'N', hs.grid.pushWindowNextScreen)
hs.hotkey.bind(mod2, 'P', hs.grid.pushWindowNextScreen)

hs.hotkey.bind(mod2, '[', hs.grid.resizeWindowThinner)
hs.hotkey.bind(mod2, ']', hs.grid.resizeWindowWider)
hs.hotkey.bind(mod2, '-', hs.grid.resizeWindowShorter)
hs.hotkey.bind(mod2, '=', hs.grid.resizeWindowTaller)

hs.hotkey.bind(mod4, '[', function() hs.grid.adjustWidth(-1)  end)
hs.hotkey.bind(mod4, ']', function() hs.grid.adjustWidth(1)   end)
hs.hotkey.bind(mod4, '-', function() hs.grid.adjustHeight(-1) end)
hs.hotkey.bind(mod4, '=', function() hs.grid.adjustHeight(1)  end)

local mouseCircle = nil
local mouseCircleTimer = nil

function mouseHighlight()
    -- Delete an existing highlight if it exists
    if mouseCircle then
        mouseCircle:delete()
        if mouseCircleTimer then
            mouseCircleTimer:stop()
        end
    end
    -- Get the current co-ordinates of the mouse pointer
    mousepoint = hs.mouse.getAbsolutePosition()
    -- Prepare a big red circle around the mouse pointer
    mouseCircle = hs.drawing.circle(hs.geometry.rect(mousepoint.x-40, mousepoint.y-40, 80, 80))
    mouseCircle:setStrokeColor({["red"]=1,["blue"]=0,["green"]=0,["alpha"]=1})
    mouseCircle:setFill(false)
    mouseCircle:setStrokeWidth(5)
    mouseCircle:show()

    -- Set a timer to delete the circle after 3 seconds
    mouseCircleTimer = hs.timer.doAfter(3, function() mouseCircle:delete() end)
end
hs.hotkey.bind(mod0, "D", mouseHighlight)

hs.hotkey.bind(mod0, "R", function()
  hs.reload()
end)

function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        hs.reload()
    end
end

local caffeine = hs.menubar.new()
function setCaffeineDisplay(state)
    if state then
        caffeine:setTitle("AWAKE")
    else
        caffeine:setTitle("SLEEPY")
    end
end

function caffeineClicked()
    setCaffeineDisplay(hs.caffeinate.toggle("displayIdle"))
end

if caffeine then
    caffeine:setClickCallback(caffeineClicked)
    setCaffeineDisplay(hs.caffeinate.get("displayIdle"))
end

hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()
hs.alert.show("Config loaded")
