function loadVar()
  icons = {}
  icons[32] = {
    chat = love.graphics.newImage("assets/icon_32_chat.png"),
    internet = love.graphics.newImage("assets/icon_32_internet.png"),
    files = love.graphics.newImage("assets/icon_32_files.png"),
    file = love.graphics.newImage("assets/icon_32_file.png"),
    help = love.graphics.newImage("assets/icon_32_help.png"),
    torrentr = love.graphics.newImage("assets/icon_32_torrentr.png"),
    settings = love.graphics.newImage("assets/icon_32_settings.png")
  }
  sys = {}
  sys.width = love.graphics.getWidth()
  sys.height = love.graphics.getHeight()
  sys.mouse = {}
  sys.mouse.p = {}
  sys.mouse.x = love.mouse.getX
  sys.mouse.y = love.mouse.getY
  sys.mouse.p.x = 0
  sys.mouse.p.y = 0
  sys.mouse.p.p = false
  sys.mouse.drag = false
  panel = {}
  panel.thick = 30
  panel.x = 0
  panel.y = 600-panel.thick
  panel.width = sys.width
  panel.height = panel.thick
  panel.s = {}
  panel.s.x = panel.x + 5
  panel.s.y = panel.y + 5
  panel.s.width = 65
  panel.s.height = 20
  panel.s.activate = false
  panel.b = {}
  panel.b[1] = 0
  panel.b[2] = 0
  panel.b[3] = 0
  panel.b[4] = 0
  panel.b[5] = 0
  panel.b[6] = 0
  panel.b[7] = 0
  test = false
  win = {}
  win[1] = {}
  win[1].x = 100
  win[1].y = 100
  win[1].w = 250
  win[1].h = 400
  win[1].px = win[1].x
  win[1].py = win[1].y
  win[1].ex = true
  win[1].cvs = love.graphics.newCanvas(win[1].w, win[1].h)
  win[1].fd = false
  win[1].s = 0
  win[1].min = false
  win[1].miny = 0
  win[1].title = "Chat"
  win[1].layer = 0
  win[1].panel = 0
  win[1].oldlayer = 0
  win[1].hov = false
  win[1].hover = false
  win[2] = {}
  win[2].x = 100
  win[2].y = 100
  win[2].w = 550
  win[2].h = 450
  win[2].px = win[2].x
  win[2].py = win[2].y
  win[2].ex = true
  win[2].cvs = love.graphics.newCanvas(win[2].w, win[2].h)
  win[2].fd = false
  win[2].s = 0
  win[2].min = false
  win[2].miny = 0
  win[2].title = "Internet"
  win[2].layer = 0
  win[2].panel = 0
  win[2].oldlayer = 0
  win[2].hov = false
  win[2].hover = false
  win[3] = {}
  win[3].x = 100
  win[3].y = 100
  win[3].w = 450
  win[3].h = 400
  win[3].px = win[3].x
  win[3].py = win[3].y
  win[3].ex = true
  win[3].cvs = love.graphics.newCanvas(win[3].w, win[3].h)
  win[3].fd = false
  win[3].s = 0
  win[3].min = false
  win[3].miny = 0
  win[3].title = "Files"
  win[3].layer = 0
  win[3].panel = 0
  win[3].oldlayer = 0
  win[3].hov = false
  win[3].hover = false
  winOpen = true
  start = {}
  start.cvs = love.graphics.newCanvas(250, 350)
  start.o = false
  start.p = false
  layer = {}
  layer[1] = 0
  layer[2] = 0
  layer[3] = 0
  layer[4] = 0
  layer[5] = 0
  layer[6] = 0
  layer[7] = 0
  desktop = {}
  desktop.bg = {
    hills = love.graphics.newImage("assets/bg_hills.png")
  }
  desktop.bg.current = desktop.bg.hills
end
