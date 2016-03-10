function drawWindow(id)
  if win[id].update == true then
    love.graphics.setCanvas(win[id].cvs)
    drawUpBox(0, 0, win[id].w, win[id].h, 4)
    love.graphics.setColor(256,256,256)
    if win[id].bar == "active" then
      love.graphics.draw(window.bar, 0+3, 0+3, 0, (win[id].w-7)/643, 1)
    else
      love.graphics.draw(window.barGrey, 0+3, 0+3, 0, (win[id].w-7)/643, 1)
    end
    drawXBox(win[id].w-22, 5)
    drawMinBox(win[id].w-40, 5)
    love.graphics.setColor(240, 240, 240)
    love.graphics.print(win[id].title, 28, 9)
    love.graphics.setColor(256, 256, 256)
    love.graphics.draw(win[id].icon16, 6, 5)
    if id == 4 then
      drawAntivirus()
    elseif id == 1 then
      drawChat()
    elseif id == 2 then
      drawInternet()
    end
    love.graphics.setCanvas()
    win[id].update = false
  end
  if(sys.mouse.x >= win[id].x and sys.mouse.x <= win[id].x+win[id].w
  and sys.mouse.y >= win[id].y and sys.mouse.y <= win[id].y+win[id].h and win[id].ex == false) then
    win[id].hov = true
    winHover = true
  else
    win[id].hov = false
  end
  if layer[1] ~= 0 and win[id].ex == false then
    if win[id].layer ~= 1 and win[layer[1]].hov == true then
      win[id].hover = false
    elseif win[id].layer ~= 1 and win[id].layer ~= 2 and layer[1] ~= 0 and layer[2] ~= 0 then
      if win[layer[1]].hov == true or win[layer[2]].hov == true then
        win[id].hover = false
      else
        win[id].hover = true
      end
    elseif win[id].hov == false then
      win[id].hover = false
    else
      win[id].hover = true
    end
  end
  if win[id].hov == false then
    win[id].hover = false
  end
  if sys.mouse.y >= sys.h-panel.thick then
    win[id].hover = false
  end
  if win[id].ex == true then
    win[id].hover = false
  end
  if(sys.mouse.p.x >= win[id].x and sys.mouse.p.x <= win[id].x+win[id].w
  and sys.mouse.p.y >= win[id].y and sys.mouse.p.y <= win[id].y+win[id].h) then
  else
    win[id].hover = false
  end
  if win[id].hover == true and sys.mouse.p.p == true and sys.mouse.drag == false then
    layer.sentToFront = id
  end
  if(sys.mouse.p.p == true and sys.mouse.p.x >= win[id].x+2 and sys.mouse.p.x <= (win[id].x+2)+(win[id].w-44)
  and sys.mouse.p.y >= win[id].y+2 and sys.mouse.p.y <= win[id].y+22 and win[id].hover == true) then
    sys.mouse.drag = true
  end
  if sys.mouse.p.p == false then
    sys.mouse.drag = false
    win[id].px = win[id].x
    win[id].py = win[id].y
  end
  if sys.mouse.drag == true and win[id].min == false and win[id].ex == false and layer[1] == id then
    win[id].x = win[id].px + (sys.mouse.x - sys.mouse.p.x)
    win[id].y = win[id].py + (sys.mouse.y - sys.mouse.p.y)
  end
  if (sys.mouse.p.p == true and sys.mouse.p.x >= win[id].x+win[id].w-22 and sys.mouse.p.x <= (win[id].x+win[id].w-22)+16 and win[id].ex == false
  and sys.mouse.drag == false and sys.mouse.p.y >= win[id].y+5 and sys.mouse.p.y <= (win[id].y+5)+16 and win[id].hover == true) then
    win[id].ex = true
  end
  if win[id].ex == true and win[id].s ~= 0 then
    win[id].s = win[id].s - 0.2
  elseif win[id].ex == false and win[id].s ~= 0 then
    win[id].s = win[id].s + 0.2
  end
  if win[id].s <= 0 then
    win[id].s = 0
  elseif win[id].s >= 1 then
    win[id].s = 1
  end
  if (win[id].min == false and sys.mouse.p.p == true and sys.mouse.p.x >= win[id].x+win[id].w-40
  and sys.mouse.p.x <= (win[id].x+win[id].w-40)+16 and sys.mouse.drag == false and sys.mouse.p.y >= win[id].y+5
  and sys.mouse.p.y <= (win[id].y+5)+16 and win[id].hover == true) then
    win[id].min = true
  end
  if win[id].min == true and win[id].miny < minim then
    win[id].y = win[id].y + 150
    win[id].miny = win[id].miny + 150
  end
  if win[id].miny > minim then
    win[id].miny = minim
  end
  if win[id].min == false and win[id].miny > 0 then
    win[id].y = win[id].y - 150
    win[id].miny = win[id].miny - 150
  end
  if win[id].miny < 0 then
    win[id].miny = 0
  end
  if id == 4 then
    updateAntivirus()
  elseif id == 1 then
    updateChat()
  end
  if id == layer[1] and win[id].bar == "grey" then
    win[id].bar = "active"
    win[id].update = true
  elseif id ~= layer[1] and win[id].bar == "active" then
    win[id].bar = "grey"
    win[id].update = true
  end
  love.graphics.setColor(255,255,255)
end
function orderWindows()
  if layer.sentToFront ~= 0 and layer[1] ~= layer.sentToFront then
    if win[layer.sentToFront].layer ~= 0 then
      table.remove(layer, win[layer.sentToFront].layer)
    end
    table.insert(layer, 1, layer.sentToFront)
    win[layer.sentToFront].oldlayer = win[layer.sentToFront].layer
    win[layer.sentToFront].layer = 1
    layer.sentToFront = 0
  end
  for i=1,6 do
    closeWindow(7-i)
  end
  for i=1,6 do
    setWindow(7-i)
    setPanel(7-i)
    drawWindow(7-i)
  end
end
function setWindow(id)
  if layer[id] ~= nil then
    win[layer[id]].oldlayer = win[layer[id]].layer
    win[layer[id]].layer = id
  end
end
function setPanel(id)
  if win[id].ex == false and win[id].pan == 0 then
    table.insert(panel.b, id)
    win[id].pan = #panel.b
  end
  if win[id].ex == true and win[id].pan ~= 0 then
   table.remove(panel.b, win[id].panel)
   for i=1,#panel.b do
     if panel.b[i] == id then
       table.remove(panel.b, i)
     end
   end
   win[id].pan = 0
  end
end
function closeWindow(id)
  if win[id].ex == true and win[id].s == 0 then
    win[id].exit = true
    win[id].oldlayer = win[id].layer
  else
    win[id].exit = false
  end
  if win[id].layer ~= 0 and win[id].exit == true then
    table.remove(layer, win[id].layer)
    win[id].oldlayer = win[id].layer
    win[id].layer = 0
  end
end
