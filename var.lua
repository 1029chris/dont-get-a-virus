function loadWin(id, w, h, title, ico, ico16)
  win[id] = {}
  win[id].w = w
  win[id].h = h
  win[id].x = math.random(100, sys.w-win[id].w-100)
  win[id].y = math.random(10, sys.h-win[id].h-100)
  win[id].px = win[id].x
  win[id].py = win[id].y
  win[id].ex = true
  win[id].cvs = love.graphics.newCanvas(win[id].w, win[id].h)
  win[id].fd = false
  win[id].s = 0
  win[id].min = false
  win[id].miny = 0
  win[id].title = title
  win[id].layer = 0
  win[id].panel = 0
  win[id].oldlayer = 0
  win[id].hov = false
  win[id].hover = false
  win[id].update = true
  win[id].icon32 = ico
  win[id].icon16 = ico16
  win[id].exit = true
  win[id].bar = "grey"
  win[id].pan = 0
end
function loadIcon(id, x, y)
  icon[id] = {}
  icon[id].x = x
  icon[id].y = y
  icon[id].ico = win[id].icon32
  icon[id].layer = id
  icon[id].hl = false
  icon[id].cl = false
end
function loadVar()
  di = 0.75
  panel = {}
  panel.thick = 30
  panel.x = 0
  panel.y = 600-panel.thick
  panel.width = sys.w
  panel.height = panel.thick
  panel.s = {}
  panel.s.x = panel.x + 5
  panel.s.y = panel.y + 5
  panel.s.width = 65
  panel.s.height = 20
  panel.s.activate = false
  panel.s.dis = 185
  panel.b = {}
  test = false
  win = {}
  loadWin(1, 250, 400, "Chat", icons[32].chat, icons[16].chat)
  loadWin(2, 650, 550, "Internet", icons[32].internet, icons[16].internet)
  loadWin(3, 450, 400, "Files", icons[32].files, icons[16].files)
  loadWin(4, 200, 150, "Antivirus", icons[32].antivirus, icons[16].antivirus)
  loadWin(5, 450, 400, "Help", icons[32].help, icons[16].help)
  loadWin(6, 400, 550, "Settings", icons[32].settings, icons[16].settings)
  loadWin(7, 400, 400, "Image Viewer", nil, icons[16].image)
  loadWin(8, 400, 300, "Video Player", nil, icons[16].video)
  loadWin(9, 250, 150, "Music Player", nil, icons[16].music)
  loadWin(10, 350, 500, "Document Viewer", nil, icons[16].document)
  loadWin(11, 400, 600, "First Time Setup", nil, icons[16].help)
  win[4].crazy = false
  win[4].crazyLeft = false
  win[4].crazyUp = false
  icon = {}
  for i=1,6 do
    loadIcon(i, 10, 10+(90*i-90))
  end
  winOpen = true
  winHover = false
  minim = sys.h+10
  start = {}
  start.cvs = love.graphics.newCanvas(250, 350)
  start.o = false
  start.p = false
  start.x = 0
  start.y = 600-30-350+2
  layer = {}
  layer.sentToFront = 0
  desktop.bg.current = 0
  antivirus.prog = 0
  antivirus.status = "Not Scanning"
  antivirus.scanning = false
  av = {}
  av.wings = 0
  av.gun = 0
  av.transform = false
  av.charge = 40
  av.fireb = false
  av.fire = false
  av.bullets = {}
  av.shake = 0
  av.shakex = 0
  av.shakey = 0
  av.health = 50
  av.dead = false
  chat.status = 0
  chat.profilename = "Best Friend"
  chat.msg = ""
  chat.msgold = ""
  chat.blink = false
  chat.blinkTimer = 0.5
  colors = {}
  colors.win = {}
  colors.win.light = {220,220,220}
  colors.win.dark = {135,135,135}
  colors.win.normal = {192,192,192}
  colors.font = {}
  colors.font.dark = {50,50,50}
  colors.font.friend = {240,10,10}
  colors.font.you = {10,10,240}
  colors.font.light = {240,240,240}
  notify = {}
  notify.yes = false
  notify.title = ""
  notify.body = ""
  notify.op = 0
  notify.sound = false
  notify.x = sys.w-258
  notify.y = sys.h-135
  notify.timer = 0
  msg = {}
  msg.new = false
  msg.c = 1
  msg.r = {}
  msg.msgs = {}
  msgs = {}
  internet.url = "www.homepage.com"
  internet.urlold = internet.url
  internet.urlc = internet.url
  internet.load = 0
  internet.blinkTimer = 0
  internet.blink = false
  v1.yes = false
  v1.timer = 0
  v1.shakemin = 0
  v1.shakemax = 0
  v1.introplay = false
  v1.explodeintro = false
  v1.explodeintrotimer = 0
  v1.fightTimer = 60
  v1.turretTimer = 0
  v1.turretAbi = 0
  v1.spm = 1
  v1.abis = 1
  v1.left = false
  v1.shake = 0
  v1.shakex = 0
  v1.shakey = 0
  v1.explodeEndFrame = 1
  if v1.complete == nil then
    v1.complete = false
  end
  v1.fightMinute = 5
  v1.c.x = 0
  v1.c.y = 0
  v1.c.s = 1
  v1.c.r = 0
  v1.c.xd = 0
  v1.c.yd = 0
  v1.c.spx = 0
  v1.c.spy = 0
  v1.c.sp = 1
  v1.c.angle = 0
  v1.c.load = false
  v1.c.eyex = 0
  v1.c.eyey = 0
  v1.c.eyetx = 0
  v1.c.eyety = 0
  v1.c.chat.time = 0
  v1.c.health = 100
  v1.msgs = {}
  v1.c.chat.next = false
  v1.c.chat.msgs = 1
  v1.c.chat.msg = ""
  v1.c.chat.sp = 0.5
  v1.c.chat.char = 0
  v1.turretTimer2 = 0
  v1.specialAbi = false
  v1.bulletSpeed = 0
  v1.specialAbiTime = 70
  v1.t = {}
  v1.t.time = 0
  v1.t.t = {}
  v1.t.x = -1000*sys.sw
  v1.lid = {}
  v1.lid.lowy = 25
  v1.lid.upy = -25
  v1.lid.lowyd = 25
  v1.lid.upyd = -25
  v1.lid.bTimer = math.random(4,8)
  v1.lid.b = false
  v1.prevChar = 0
  v2.pop.p = {}
  v2.pop.add = false
  v2.pop.hov = 0
  v2.msgs = {}
  v2.c.x = sys.w/2
  v2.c.y = sys.h/2
  v2.c.s = 1
  v2.c.r = 0
  v2.c.xd = 0
  v2.c.yd = 0
  v2.c.spx = 0
  v2.c.spy = 0
  v2.c.sp = 1
  v2.c.angle = 0
  v2.c.health = 100
  v2.c.money = 0
  v2.startTime = 0
  v2.start = false
  v2.startPopups = 10
  if v2.complete == nil then
    v2.complete = false
  end
  v2.popshotx = sys.w/2
  v2.popshoty = sys.h/2
  v2.popshotsh = 10
  v2.popshotm = -15
  v2.popshotr = 0
  v2.popshots = false
  v2.c.chat = {}
  v2.c.chat.next = false
  v2.c.chat.msgs = 1
  v2.c.chat.msg = ""
  v2.c.chat.sp = 0.5
  v2.c.chat.char = 0
  v2.c.chat.time = 0
  v2.c.handp = "gunfront"
  v2.explodeFrame = 1
  v2.mTime = 0
  v2.gun = {}
  v2.gun.rt = 0
  v2.gun.r = 0
  v2.fightStart = false
  v2.bullets = {}
  v2.sg = {}
  v2.fightTimer = 0
  v2.firstAttack = 0
  v2.spm = 1
  v2.shake = 0
  v2.shakex = 0
  v2.shakey = 0
  v2.attackTimer = 0
  v2.currentAttack = "first"
  v2.attackNextTimer = 0
  v2.nextAttack = 20
  v2.popupTimer = 60
  v2.shotgunTimer = 10
  v2.musicfade = 1
  v2.rowTimer = 0.5
  v2.rowGun = 0
  v2.rowDown = 0
  v2.rowLeft = false
  v2.prevChar = 0
  v2.fadeThing = -1000*sys.sw
  v2.v1gun = 203
  v2.v1gunTimer = 1
  v2.v1gunFire = false
  v2.lid = {}
  v2.lid.lowy = 25
  v2.lid.upy = -25
  v2.lid.lowyd = 25
  v2.lid.upyd = -25
  v2.lid.bTimer = math.random(4,8)
  v2.lid.b = false
  v2.maskFrame = 0
  v2.c.eyex = 0
  v2.c.eyey = 0
  v2.c.eyetx = 0
  v2.c.eyety = 0
  expl.deb[1].x = 0
  expl.deb[1].y = 0
  expl.deb[1].ym = 5
  expl.deb[1].xm = -13
  expl.deb[1].r = math.rad(0)
  expl.deb[1].rm = math.rad(-2)
  expl.deb[2].x = 0
  expl.deb[2].y = 0
  expl.deb[2].ym = 7
  expl.deb[2].xm = 23
  expl.deb[2].r = math.rad(0)
  expl.deb[2].rm = math.rad(3)
  expl.deb[3].x = 0
  expl.deb[3].y = 0
  expl.deb[3].ym = 2
  expl.deb[3].xm = 10
  expl.deb[3].r = math.rad(0)
  expl.deb[3].rm = math.rad(1)
  expl.deb.load = false
  eraseGame = false
  std = {}
  std[1] = {}
  std[1].title = "Baby"
  std[1].hl = false
  std[2] = {}
  std[2].title = "Easy"
  std[2].hl = false
  std[3] = {}
  std[3].title = "Normal"
  std[3].hl = true
  std[4] = {}
  std[4].title = "Hard"
  std[4].hl = false
  std[5] = {}
  std[5].title = "Insane"
  std[5].hl = false
  std[6] = {}
  std[6].title = "Impossible"
  std[6].hl = false
  stre = {}
  stre[1] = {}
  stre[1].title = "Native"
  stre[1].hl = true
  modes = love.window.getFullscreenModes()
  for i=1,#modes do
    if modes[i].width >= 1000 and modes[i].height >= 720 and i <= 9 then
      table.insert(stre, {
        title = modes[i].width .. "x" .. modes[i].height,
        hl = false,
        w = modes[i].width,
        h = modes[i].height,
      })
    end
  end
  f = {}
  f.home = {}
  f.home[1] = {name="Documents",x=0,y=0,hl=false}
  f.home[2] = {name="Downloads",x=0,y=0,hl=false}
  f.home[3] = {name="Music",x=0,y=0,hl=false}
  f.home[4] = {name="Pictures",x=0,y=0,hl=false}
  f.home[5] = {name="Videos",x=0,y=0,hl=false}
  f.pictures = {}
  f.pictures[1] = {name="cat.jpg",x=0,y=0,hl=false}
  f.pictures[2] = {name="art.jpg",x=0,y=0,hl=false}
  f.documents = {}
  f.documents[1] = {name="Help",x=0,y=0,hl=false}
  f.documents[2] = {name="Credits",x=0,y=0,hl=false}
  f.music = {}
  f.music[1] = {name="chill.mp3",x=0,y=0,hl=false}
  f.music[2] = {name="rage.mp3",x=0,y=0,hl=false}
  f.music[3] = {name="sophie.mp3",x=0,y=0,hl=false}
  f.music[4] = {name="oyeah.mp3",x=0,y=0,hl=false}
  f.music[5] = {name="finale.mp3",x=0,y=0,hl=false}
  f.videos = {}
  f.videos[1] = {name="wtf.avi",x=0,y=0,hl=false}
  f.downloads = {}
  files = f.home
  file = {}
  file.title = "/User/"
  file.p = false
  file.back = false
  picture.img = 0
  doc = {}
  doc.doc = ""
  loadDocuments()
  mplay = {}
  mplay.volx = 232
  mplay.volpx = mplay.volx
  mplay.volxmax = 10+38+38+38+108
  mplay.volxmin = 10+38+38+38
  mplay.voly = win[9].h-39
  mplay.drag = false
  mplay.m = 0
  mplay.p = false
  mplay.pr = false
  mplay.title = "Nothing"
  mplay.bar = {}
  vplay = {}
  vplay.v = 0
  vplay.p = false
  vplay.pr = false
  vplay.volx = 232+150
  vplay.volpx = mplay.volx
  vplay.volxmax = 10+38+38+38+150+108
  vplay.volxmin = 10+38+38+38+150
  vplay.voly = win[8].h-39
  vplay.drag = false
end
function loadPre()
  love.graphics.setDefaultFilter("nearest", "nearest")
  love.graphics.setBackgroundColor(0, 0, 0)
  love.graphics.setNewFont()
  pressstart = love.graphics.newFont("fonts/pressstart.ttf", 12)
  pressstart:setFilter("nearest", "nearest")
  --pressstarts = love.graphics.newFont("fonts/pressstart.ttf", 10)
  --pressstarts:setFilter("nearest", "nearest")
  pixeloperatorb = love.graphics.newFont("fonts/pixel_operator/PixelOperator8-Bold.ttf", 16)
  pixeloperatorb:setFilter("nearest", "nearest")
  pixeloperator = love.graphics.newFont("fonts/pixel_operator/PixelOperator8.ttf", 16.5)
  pixeloperator:setFilter("nearest", "nearest")
  pixeloperators = love.graphics.newFont("fonts/pixel_operator/PixelOperator-Bold.ttf", 16)
  pixeloperators:setFilter("nearest", "nearest")
  love.graphics.setFont(pressstart)
  love.keyboard.setKeyRepeat(true)
  scene = 0
  loading = 0
  fade = 0
  loaded = false
  loadingId = 1
  time = 0
  fadeOpacity = 0
  pause = {}
  pause.p = false
  pause.esc = false
  sys = {}
  sys.s = 0
  sys.mouse = {}
  sys.mouse.p = {}
  sys.mouse.x = love.mouse.getX
  sys.mouse.y = love.mouse.getY
  sys.mouse.p.x = 0
  sys.mouse.p.y = 0
  sys.mouse.p.p = false
  sys.mouse.drag = false
  sys.w = love.graphics.getWidth()
  sys.h = love.graphics.getHeight()
  virus1Lose = 0
  virus1Pissed = false
  virus2Lose = 0
end
function loadRe()
  loading = 0
  sys.mouse.p.p = false
  fade = 0
  loaded = true
  loadingId = 1
  time = 0
  fadeOpacity = 0
  v1.c.monitorspin.f = 1
  v1.c.monitorspin.x = 330
  v1.c.monitorspin.y = -200
  v1.c.monitorspin.sp = 0.4
  v1.c.slime.f = 1
  v1.c.slime.x = 330
  v1.c.slime.y = 350
  v1.c.shine.r1 = 0
  v1.c.shine.r2 = 0
  v1.c.shine.s1 = 0
  v1.c.shine.s2 = 0
  v1.c.shine.s = -25
  v1.c.shine.sm1 = true
  v1.c.shine.sm2 = true
  v1.c.shine.ct = 0
  v1.c.shine.opa = 255
  v1.c.idle.f = 1
  v1.turret[1] = {r=math.rad(30),x=0,y=0,rt=math.rad(30),t=0,tl=1}
  v1.turret[2] = {r=math.rad(15),x=0,y=0,rt=math.rad(15),t=0,tl=2}
  v1.turret[3] = {r=math.rad(-15),x=0,y=0,rt=math.rad(-15),t=0,tl=3}
  v1.turret[4] = {r=math.rad(-30),x=0,y=0,rt=math.rad(-30),t=0,tl=4}
  expl.frame = 1
  loadVar()
  loadSave()
  loadDia()
  scene = 0
end
