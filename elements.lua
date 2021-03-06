function drawXBox(x, y)
  love.graphics.setColor(colors.win.normal)
  love.graphics.rectangle("fill", x, y, 16, 16)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print("X", x+2.5, y+4.5)
  love.graphics.setColor(colors.win.light)
  love.graphics.setLineWidth(1.5)
  love.graphics.line(x, y+16, x, y, x+16, y)
  love.graphics.setColor(colors.win.dark)
  love.graphics.line(x, y+16, x+16, y+16, x+16, y)
end
function drawMinBox(x, y)
  love.graphics.setColor(colors.win.normal)
  love.graphics.rectangle("fill", x, y, 16, 16)
  love.graphics.setColor(colors.font.dark)
  love.graphics.setLineWidth(3.5)
  love.graphics.line(x+3, y+8, x+13, y+8)
  love.graphics.setColor(colors.win.light)
  love.graphics.setLineWidth(1.5)
  love.graphics.line(x, y+16, x, y, x+16, y)
  love.graphics.setColor(colors.win.dark)
  love.graphics.line(x, y+16, x+16, y+16, x+16, y)
end
function drawUpBox(x, y, w, h, t)
  love.graphics.setColor(colors.win.normal)
  love.graphics.rectangle("fill", x, y, w, h)
  love.graphics.setLineWidth(t-0.5)
  love.graphics.setColor(colors.win.light)
  love.graphics.line(x, y+h, x, y, x+w, y)
  love.graphics.setColor(colors.win.dark)
  love.graphics.line(x, y+h, x+w, y+h, x+w, y)
  love.graphics.setColor(255,255,255)
end
function drawDownBox(x, y, w, h, t)
  love.graphics.setColor(colors.win.normal)
  love.graphics.rectangle("fill", x, y, w, h)
  love.graphics.setLineWidth(t-0.5)
  love.graphics.setColor(colors.win.dark)
  love.graphics.line(x, y+h, x, y, x+w, y)
  love.graphics.setColor(colors.win.light)
  love.graphics.line(x, y+h, x+w, y+h, x+w, y)
  love.graphics.setColor(255,255,255)
end
function drawBlueBox(x, y, w, h, t)
  love.graphics.setColor(0, 0, 120)
  love.graphics.rectangle("fill", x, y, w, h)
  love.graphics.setLineWidth(t-0.5)
  love.graphics.setColor(0,0,180)
  love.graphics.line(x, y+h, x, y, x+w, y)
  love.graphics.setColor(0, 0, 80)
  love.graphics.line(x, y+h, x+w, y+h, x+w, y)
  love.graphics.setColor(255,255,255)
end
function drawBubble(x,y,w,h,m)
  love.graphics.setColor(255,255,255)
  love.graphics.rectangle("fill", x+20, y, w-40, h)
  love.graphics.rectangle("fill", x, y+20, w, h-40)
  love.graphics.draw(v1.corner, x, y, 0, 2)
  love.graphics.draw(v1.corner, x+w, y, 0, -2, 2)
  love.graphics.draw(v1.corner, x+w, y+h, 0, -2, -2)
  love.graphics.draw(v1.cornerSpike, x, y+h-20, 0, 2)
  love.graphics.setColor(0,0,0)
  love.graphics.setLineWidth(1.5)
  love.graphics.line(x+20, y+1, x+w-20, y+1)
  love.graphics.line(x+30, y+h-1, x+w-20, y+h-1)
  love.graphics.line(x+1, y+20, x+1, y+h-20)
  love.graphics.line(x+w-1, y+20, x+w-1, y+h-20)
  love.graphics.setFont(pixeloperator)
  love.graphics.printf(m,x+15,y+15,w-30)
  love.graphics.setFont(pressstart)
end
