function love.load()
  require "assets"
  require "window"
  require "panel"
  require "var"
  require "desktop"
  require "internet"
  require "files"
  require "antivirus"
  require "help"
  require "chat"
  require "settings"
  require "system"
  require "loading"
  require "elements"
  require "virus1"
  require "dialogue"
  require "viewer"
  require "virus2"
  loadPre()
end
function love.update(dt)
  delta = dt
  time = time + dt
  fps = love.timer.getFPS()
  sys.s = 60/fps
  sys.w = love.graphics.getWidth()
  sys.h = love.graphics.getHeight()
  sys.sw = sys.w/1920
  sys.sh = sys.h/1080
  minim = sys.h+10
  sys.mouse.x = love.mouse.getX()
  sys.mouse.y = love.mouse.getY()
  if love.keyboard.isDown("escape") == true and pause.esc == false and loaded == true and pause.p == false then
    love.audio.pause()
    pause.esc = true
    pause.p = true
    sys.mouse.p.p = false
  end
  if fade == 1 and fadeOpacity < 255 and pause.p == false then
    fadeOpacity = fadeOpacity + 5
    if scene == 0 and love.keyboard.isDown("1") == true then
      v1.complete = true
    elseif scene == 0 and love.keyboard.isDown("2") == true then
      v1.complete = true
      v2.complete = true
    end
  elseif fade == 0  and fadeOpacity > 0 and pause.p == false then
    fadeOpacity = fadeOpacity - 5
  end
  if scene == 1 and pause.p == false then
    updateSystem(dt)
  end
  if loaded == true and pause.p == false then
    if v1.yes == true and v1.complete == false then
      v1.timer = v1.timer + dt
    end
    if v1.yes == true and v1.timer >= 5 then
      scene = 2
      if v1.explodeintrotimer <= 7.8 then
        v1.explodeintrotimer = v1.explodeintrotimer + dt
      end
    end
  end
end
function love.mousepressed(x, y, button)
  if scene ~= 0 then
    sys.mouse.p.x = x
    sys.mouse.p.y = y
    if button ~= 1 then
      sys.mouse.p.p = false
    end
    if button == 1 then
      sys.mouse.p.p = true
    end
    if v1.msgs[v1.c.chat.msgs] ~= nil then
      if string.len(v1.msgs[v1.c.chat.msgs]) == string.len(v1.c.chat.msg) and v1.yes == true then
        v1.c.chat.next = false
      end
    end
    if v2.msgs[v2.c.chat.msgs] ~= nil then
      if string.len(v2.msgs[v2.c.chat.msgs]) == string.len(v2.c.chat.msg) and v2.start == true then
        v2.c.chat.next = false
      end
    end
  end
end
function love.keyreleased(key)
   if key == "f11" then
     if scene == 2 then
      v1.c.chat.msgs = v1.c.chat.msgs + 1
    elseif scene == 3 then
      v2.c.chat.msgs = v2.c.chat.msgs + 1
    end
   end
   if key == "f10" then
     if scene == 2 then
       v1.c.health = v1.c.health - 5
       v1.spm = v1.spm + 0.5*(sys.h/1080)
     elseif scene == 3 then
       v2.c.health = v2.c.health - 5
       v2.spm = v2.spm + 0.20*(sys.h/1080)
     end
   end
   if key == "escape" then
     pause.esc = false
   end
end
function love.keypressed(key)
  if key == "backspace" and layer[1] == 2 and v1.yes == false then
    internet.url = string.sub(internet.url, 1, string.len(internet.url)-1)
    if internet.url ~= internet.urlold then
      win[2].update = true
      internet.blink = true
      internet.blinkTimer = 0
    end
  end
  if key == "return" or key == "kpenter" then
    if layer[1] == 2 then
      internet.urlc = internet.url
      win[2].update = true
      internet.load = 0
    elseif layer[1] == 1 and chat.msg ~= "" then
      sendMessage(2, chat.msg)
      if chat.status == 1 then
        chatReply(string.lower(chat.msg))
      end
      chat.msg = ""
    end
  end
  if key == "backspace" and layer[1] == 1 and v1.yes == false then
    chat.msg = string.sub(chat.msg, 1, string.len(chat.msg)-1)
    if chat.msg ~= chat.msgold then
      win[1].update = true
      chat.blink = true
      chat.blinkTimer = 0.5
    end
  end
  if key == "z" then
    if v1.msgs[v1.c.chat.msgs] ~= nil then
      if string.len(v1.msgs[v1.c.chat.msgs]) == string.len(v1.c.chat.msg) and v1.yes == true then
        v1.c.chat.next = false
      end
    end
    if v2.msgs[v2.c.chat.msgs] ~= nil then
      if string.len(v2.msgs[v2.c.chat.msgs]) == string.len(v2.c.chat.msg) and v2.start == true then
        v2.c.chat.next = false
      end
    end
  end
end
function love.mousereleased(x, y, button)
  if scene ~= 0 then
    sys.mouse.p.p = false
    start.p = false
    for i=1,6 do
      icon[i].cl = false
    end
    file.p = false
    mplay.drag = false
    vplay.drag = false
    mplay.pr = false
    vplay.pr = false
    if layer[1] == 1 then
      win[1].update = true
    end
  end
end
function love.draw()
  if pause.p == true then
    drawPause()
  elseif scene == 1 then
    drawSystem()
  elseif scene == 0 then
    drawLoading()
  elseif scene == 2 then
    drawVirusFight1()
  elseif scene == 3 then
    drawVirusFight2()
  elseif scene == 666 then
    drawBSOD()
  end
end
