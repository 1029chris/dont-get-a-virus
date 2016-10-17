function drawVirusFight2()
  drawDesktop()
  floatingShotgun()
  drawBullets()
  drawVirus2()
  drawAntivirusFight()
  drawPopups()
  love.graphics.print(#v2.sg)
  if v2.fightStart == true then
    v2.fightTimer = v2.fightTimer + delta
    v2.c.money =  v2.c.money + delta*(#v2.pop.p+1)
    v2.attackNextTimer = v2.attackNextTimer + delta
    v2.attackTimer = v2.attackTimer - delta
  end
  if v2.currentAttack == "first" then
    v2FirstAttack()
  elseif v2.currentAttack == "rShotgun" then
    v2RandomShotgunAttack()
  elseif v2.currentAttack == "shotgunRow" then
    v2ShotgunRowAttack()
  elseif v2.currentAttack == "popup" then
    v2PopupAttack()
  elseif v2.currentAttack == "popupShotgun" then
    v2ShotgunPopupAttack()
  elseif v2.currentAttack == "shotgunBundle" then
    shotgunBundleAttack()
  elseif v2.currentAttack == "shotgunSpiral" then
    shotgunSpiralAttack()
  elseif v2.currentAttack == "shotgunFast" then
    superFastShotgunAttack()
  elseif v2.currentAttack == "shotgun" then
    v2ShotgunAttack()
  end
  if v2.nextAttack <= v2.attackNextTimer then
    local na = math.random(1,8)
    if na == 1 then
      v2.currentAttack = "rShotgun"
    elseif na == 2 then
      v2.currentAttack = "shotgunRow"
    elseif na == 3 then
      v2.currentAttack = "popup"
    elseif na == 4 then
      v2.currentAttack = "popupShotgun"
    elseif na == 5 then
      v2.currentAttack = "shotgunBundle"
    elseif na == 6 then
      v2.currentAttack = "shotgunSpiral"
    elseif na == 7 then
      v2.currentAttack = "shotgunFast"
    elseif na == 8 then
      v2.currentAttack = "shotgun"
    end
    v2.nextAttack = math.random(5,20)
    if na == 3 or na == 4 then
      v2.nextAttack = 5
    end
    v2.attackNextTimer = 0
  end
  if v2.fightTimer >= v2.popupTimer then
    v2.popupTimer = v2.popupTimer + math.random(10,20)
    addPopup(true)
  end
  if v2.popshoty < sys.h+1000 then
    if v2.popshots == false then
      v2.c.fire:play()
      v2.popshots = true
    end
    love.graphics.setColor(256,256,256)
    love.graphics.draw(v2.popshot, v2.popshotx+math.random(-v2.popshotsh,v2.popshotsh),
    v2.popshoty+math.random(-v2.popshotsh,v2.popshotsh), v2.popshotr+math.rad(math.random(-v2.popshotsh,v2.popshotsh)), 1, 1, 300, 200)
    if v2.popshotsh > 0 then
      v2.popshotsh = v2.popshotsh - 0.5*sys.s
    end
    v2.popshoty = v2.popshoty + v2.popshotm*sys.s
    v2.popshotm = v2.popshotm + 0.75*sys.s
    v2.popshotr = v2.popshotr + math.rad(1*sys.s)
    if v2.explodeFrame <= 89 then
      love.graphics.setColor(255,255,255)
      love.graphics.draw(expl.pic, expl.frames[math.floor(v2.explodeFrame)], sys.w/2, sys.h/2, 0, 2.5, 2.5, 320/2,240/2)
      v2.explodeFrame = v2.explodeFrame + 1*sys.s
      v1.explosionSound:play()
    end
  end
  if start.o == true then
    drawMenu()
  end
  if start.o == true and sys.mouse.p.p == true and sys.mouse.p.x > 255 or sys.mouse.p.y < sys.h-380 then
    start.o = false
  end
  drawStart()
  if v2.c.chat.msgs == 1 or v2.c.chat.msgs == 6 then
    v2.c.xd = sys.w/2
    v2.c.yd = sys.h/3
    if v2.c.chat.msgs == 6 then
      v2.c.handp = "fist"
    elseif v2.c.chat.msgs == 1 then
      v2.c.handp = "gunfront"
    end
  elseif v2.c.chat.msgs == 2 then
    v2.c.xd = sys.w/3
    v2.c.yd = sys.h/1.7
    v2.c.handp = "gunup"
  elseif v2.c.chat.msgs == 3 then
    v2.c.xd = sys.w/3
    v2.c.yd = sys.h/3
    v2.c.handp = "idle"
  elseif v2.c.chat.msgs == 4 then
    v2.c.xd = sys.w/1.7
    v2.c.yd = sys.h/1.7
  elseif v2.c.chat.msgs == 5 then
    v2.c.xd = sys.w/2
    v2.c.yd = sys.h/2
    win[4].x = sys.w/2
    win[4].y = sys.h-sys.h/4
  elseif v2.c.chat.msgs == 10 then
    v2.c.xd = sys.w/2
    v2.c.yd = sys.h/2
    v2.c.handp = "gunidle"
    if v2.c.cockgunplay == false then
      v2.c.cockgun:play()
      v2.c.cockgunplay = true
    end
  elseif v2.c.chat.msgs == 11 then
    v2.c.handp = "spread"
  elseif v2.c.chat.msgs == 12 then
    v2.c.handp = "fist"
  elseif v2.c.chat.msgs == 14 then
    v2.c.handp = "idle"
  elseif v2.c.chat.msgs == 19 then
    v2.c.xd = sys.w/4
    v2.c.yd = sys.h/4
    v2.c.handp = "gunpoint"
    antivirus.scanning = true
  elseif v2.c.chat.msgs == 22 then
    v2.c.handp = "idle"
    v2.c.xd = sys.w/2
    v2.c.yd = sys.h/4
  elseif v2.c.chat.msgs == 24 then
    v2.fightStart = true
    if v2.currentAttack ~= "shotgun" then
      v2.c.handp = "idle"
    end
  end
  if v2.fightStart == true then
    music.tension2:stop()
    music.battle2:play()
  end
end
function drawPopup(id)
  love.graphics.setCanvas(v2.pop.p[id].cvs)
  drawUpBox(0, 0, v2.pop.p[id].w, v2.pop.p[id].h, 4)
  love.graphics.setColor(255,255,255)
  love.graphics.draw(window.bar, 3, 3, 0, (v2.pop.p[id].w-6)/643, 1)
  drawXBox(v2.pop.p[id].w-22, 5)
  --drawMinBox(v2.pop.p[id].w-40, 5)
  love.graphics.setColor(240, 240, 240)
  if v2.pop.p[id].ad == 1 then
    love.graphics.print("FREE PHONE!!!", 28, 9)
  elseif v2.pop.p[id].ad == 2 then
    love.graphics.print("CURE FOOT FUNGUS!!", 28, 9)
  elseif v2.pop.p[id].ad == 3 then
    love.graphics.print("YOU WON!!!", 28, 9)
  elseif v2.pop.p[id].ad == 4 then
    love.graphics.print("BIG PENIS!!!", 28, 9)
  elseif v2.pop.p[id].ad == 5 then
    love.graphics.print("SEXY SINGLES!!!", 28, 9)
  elseif v2.pop.p[id].ad == 6 then
    love.graphics.print("VIRUS ALERT!!!", 28, 9)
  elseif v2.pop.p[id].ad == 7 then
    love.graphics.print("SHOOT THE TABLET!!", 28, 9)
  elseif v2.pop.p[id].ad == 8 then
    love.graphics.print("POPUP BLOCKER!!!", 28, 9)
  elseif v2.pop.p[id].ad == 9 then
    love.graphics.print("A Letter for You.", 28, 9)
  elseif v2.pop.p[id].ad == 10 then
    love.graphics.print("PC BOOSTER!!!", 28, 9)
  end
  love.graphics.setColor(256, 256, 256)
  love.graphics.draw(win[2].icon16, 6, 5)
  drawDownBox(8, 31, v2.pop.p[id].w-16, v2.pop.p[id].h-39, 4)
  love.graphics.draw(v2.pop.a[v2.pop.p[id].ad], 8, 31, 0, (v2.pop.p[id].w-16)/640, (v2.pop.p[id].h-39)/400)
  love.graphics.setCanvas()
end
function addPopup(rand, x, y, w, h, ad, dup, m)
  if notification.sound3:isPlaying() == true then
    notification.sound3:rewind()
  else
    notification.sound3:play()
  end
  if rand == true then
    table.insert(v2.pop.p, 1, {
      w = math.random(300,800),
      ad = math.random(1,10),
      d = false,
      s = 0.2,
      exit = false,
      add = false,
      dup = true
    })
    v2.pop.p[1].h = v2.pop.p[1].w/math.random(1.4,1.6,1.8,2)
    v2.pop.p[1].x = math.random(0,sys.w-v2.pop.p[1].w)
    v2.pop.p[1].y = math.random(0,sys.h-v2.pop.p[1].h)
    v2.pop.p[1].cvs = love.graphics.newCanvas(v2.pop.p[1].w, v2.pop.p[1].h)
    if v2.pop.p[1].d == false then
      drawPopup(1)
      v2.pop.p[1].d = true
    end
  elseif rand == false then
    table.insert(v2.pop.p, 1, {x=x,y=y,w=w,h=h,ad=ad,d=false,s=0.2,exit=false,add=false,dup=dup,m=m})
    v2.pop.p[1].cvs = love.graphics.newCanvas(v2.pop.p[1].w, v2.pop.p[1].h)
    if v2.pop.p[1].d == false then
      drawPopup(1)
      v2.pop.p[1].d = true
    end
  end
end
function drawPopups()
  v2.pop.hov = 0
  for i=1,#v2.pop.p do
    love.graphics.setColor(255,255,255)
    love.graphics.draw(v2.pop.p[i].cvs, v2.pop.p[i].x,v2.pop.p[i].y,0,v2.pop.p[i].s)
  end
  for i=#v2.pop.p, 1, -1 do
    if v2.pop.hov == 0 and sys.mouse.x >= v2.pop.p[i].x and sys.mouse.x <= v2.pop.p[i].x+v2.pop.p[i].w
    and sys.mouse.y >= v2.pop.p[i].y and sys.mouse.y <= v2.pop.p[i].y+v2.pop.p[i].h then
      v2.pop.hov = i
    end
  end
  for i=1,#v2.pop.p do
    if v2.pop.p[i].s < 1 and v2.pop.p[i].exit == false then
      v2.pop.p[i].s = v2.pop.p[i].s + (0.075/v2.pop.p[i].s)*sys.s
      if v2.pop.p[i].s > 1 then
        v2.pop.p[i].s = 1
      end
    elseif v2.pop.p[i].s > 0 and v2.pop.p[i].exit == true then
      v2.pop.p[i].s = v2.pop.p[i].s - (0.4*v2.pop.p[i].s)*sys.s
      if v2.pop.p[i].s < 0.1 then
        v2.pop.p[i].s = 0
      end
    end
    if mouseClick(v2.pop.p[i].x+v2.pop.p[i].w-22, v2.pop.p[i].y+5, 16, 16) == true and v2.pop.p[i].exit == false and v2.pop.hov == i then
      v2.pop.p[i].exit = true
      if v2.pop.p[i].m == true then
        music.tension2:play()
        scene = 3
        for i=1,#v2.pop.p do
          v2.pop.p[i].exit = true
        end
      end
    elseif mouseClick(v2.pop.p[i].x+8, v2.pop.p[i].y+31, v2.pop.p[i].w-16, v2.pop.p[i].h-39) == true
    and v2.pop.p[i].exit == false and v2.pop.hov == i and v2.pop.p[i].dup == true then
      v2.pop.p[i].exit = true
      if #v2.pop.p <= 6 then
        v2.pop.add = true
      end
    end
    if v2.pop.p[i].exit == true and v2.pop.p[i].s <= 0 then
      table.remove(v2.pop.p, i)
      collectgarbage("collect")
      break
    end
  end
  if v2.pop.add == true and #v2.pop.p <= 6 then
    addPopup(true)
    addPopup(true)
    v2.pop.add = false
  end
end
function drawVirus2()
  love.graphics.setColor(255,255,255)
  playAnimation(v2.c.idle, true, v2.c.x+v2.shakex, v2.c.y+v2.shakey, v2.c.r, v2.c.s, 125, 125, 0.5)
  love.graphics.stencil(drawVirus2Stencil, "replace", 1)
  love.graphics.setStencilTest("greater", 0)
  love.graphics.draw(v2.c.pupil, v2.c.x-26+math.random(-0.7+(v2.shakex/10),0.7+(v2.shakex/10)),
  v2.c.y-57+math.random(-0.7+(v2.shakey/10),0.7+(v2.shakey/10)),v2.c.r,v2.c.s)
  love.graphics.draw(v2.c.pupil, v2.c.x+21+math.random(-0.7,0.7),v2.c.y-57+math.random(-0.7,0.7),v2.c.r,v2.c.s)
  love.graphics.setStencilTest()
  v2.c.sp = math.sqrt(math.abs(v2.c.xd - v2.c.x)*2 + math.abs(v2.c.yd - v2.c.y)*2)/5
  v2.c.sp = v2.c.sp * v2.spm
  v2.c.angle = math.atan2((v2.c.yd - v2.c.y), (v2.c.xd - v2.c.x))
  v2.c.spx = v2.c.sp * math.cos(v2.c.angle)
  v2.c.spy = v2.c.sp * math.sin(v2.c.angle)
  if v2.c.x > v2.c.xd then
    if v2.c.x + v2.c.spx <= v2.c.xd then
      v2.c.x = v2.c.xd
    else
      v2.c.x = v2.c.x + v2.c.spx
    end
  elseif v2.c.x < v2.c.xd then
    if v2.c.x + v2.c.spx >= v2.c.xd then
      v2.c.x = v2.c.xd
    else
      v2.c.x = v2.c.x + v2.c.spx
    end
  end
  if v2.c.y > v2.c.yd then
    if v2.c.y + v2.c.spy <= v2.c.yd then
      v2.c.y = v2.c.yd
    else
      v2.c.y = v2.c.y + v2.c.spy
    end
  elseif v2.c.y < v2.c.yd then
    if v2.c.y + v2.c.spy >= v2.c.yd then
      v2.c.y = v2.c.yd
    else
      v2.c.y = v2.c.y + v2.c.spy
    end
  end
  if v2.currentAttack ~= "first" and v2.c.chat.msgs == 24 then
    if v2.c.x == v2.c.xd and v2.c.y == v2.c.yd then
      v2.c.xd = math.random(125, sys.w-125)
      v2.c.yd = math.random(125, sys.h/2)
    end
  end
  if v2.shake > 0 and v2.c.chat.msgs == 24 then
    v2.shakex = math.random(v2.shake,-v2.shake)
    v2.shakey = math.random(v2.shake,-v2.shake)
    v2.shake = v2.shake - 0.3*sys.s
  elseif v2.shake < 0 and v1.c.chat.msgs == 24 then
    v2.shake = 0
    v2.shakex = 0
    v2.shakey = 0
  end
  handOpa("idle",v2.c.handsOp)
  handOpa("fist",v2.c.fistOp)
  handOpa("gunup",v2.c.gunupOp)
  handOpa("gunfront",v2.c.gunfrontOp)
  handOpa("gunidle",v2.c.gunidleOp)
  handOpa("gunpoint",v2.c.gunpointOp)
  handOpa("spread",v2.c.spreadOp)
  if v2.c.handsOp ~= 0 then
    love.graphics.setColor(256,256,256,v2.c.handsOp)
    love.graphics.draw(v2.c.idle.hands, v2.c.x+v2.shakex, v2.c.y+v2.shakey, v2.c.r, v2.c.s, v2.c.s, 125, 125)
  end
  if v2.c.fistOp ~= 0 then
    love.graphics.setColor(256,256,256,v2.c.fistOp)
    love.graphics.draw(v2.c.idle.fist, v2.c.x+v2.shakex+math.random(-0.2,0.2), v2.c.y+v2.shakey+math.random(-0.2,0.2), v2.c.r, v2.c.s, v2.c.s, 125, 125)
  end
  if v2.c.gunidleOp ~= 0 then
    love.graphics.setColor(256,256,256,v2.c.gunidleOp)
    love.graphics.draw(v2.c.idle.gunidle, v2.c.x+v2.shakex, v2.c.y+v2.shakey, v2.c.r, v2.c.s, v2.c.s, 125, 125)
  end
  if v2.c.gunfrontOp ~= 0 then
    love.graphics.setColor(256,256,256,v2.c.gunfrontOp)
    love.graphics.draw(v2.c.gunfront, v2.c.x+v2.shakex, v2.c.y+v2.shakey, v2.c.r, v2.c.s, v2.c.s, 125, 125)
  end
  if v2.c.gunupOp ~= 0 then
    love.graphics.setColor(256,256,256,v2.c.gunupOp)
    love.graphics.draw(v2.c.gunup, v2.c.x+v2.shakex, v2.c.y+v2.shakey, v2.c.r, v2.c.s, v2.c.s, 125, 125)
  end
  if v2.c.spreadOp ~= 0 then
    love.graphics.setColor(256,256,256,v2.c.spreadOp)
    love.graphics.draw(v2.c.idle.spread, v2.c.x+v2.shakex, v2.c.y+v2.shakey, v2.c.r, v2.c.s, v2.c.s, 125, 125)
  end
  if v2.c.gunpointOp ~= 0 then
    v2.gun.rt = math.atan2((win[4].y+win[4].h/2 - v2.c.y), (win[4].x+win[4].w/2 - v2.c.x))
    if v2.gun.r > v2.gun.rt then
      if v2.gun.r - math.rad((2*sys.s)*di) < v2.gun.rt then
        v2.gun.r = v2.gun.rt
      else
        v2.gun.r = v2.gun.r - math.rad((2*sys.s)*di)
      end
    elseif v2.gun.r < v2.gun.rt then
      if v2.gun.r + math.rad((2*sys.s)*di) > v2.gun.rt then
        v2.gun.r = v2.gun.rt
      else
        v2.gun.r = v2.gun.r + math.rad((2*sys.s)*di)
      end
    end
    love.graphics.setColor(256,256,256,v2.c.gunpointOp)
    love.graphics.draw(v2.c.idle.handright, v2.c.x+v2.shakex, v2.c.y+v2.shakey, v2.c.r, v2.c.s, v2.c.s, 125, 125)
    love.graphics.draw(v2.c.gunleft, v2.c.x-82+v2.shakex, v2.c.y+35+v2.shakey, v2.gun.r+math.rad(-90), 1.2, 1.2, 45, 10)
  end
  v2.mTime = v2.mTime + delta
  if v2.mTime > 6 and v2.c.chat.msgs == 17 and win[4].ex == true then
    nextChatv2(18)
  elseif win[4].ex == false and v2.c.chat.msgs >= 17 and v2.c.chat.msgs <= 18 then
    nextChatv2(19)
  elseif v2.mTime > 1 and v2.c.chat.msgs == 19 and win[4].ex == false then
    nextChatv2(20)
  elseif v2.c.chat.msgs == 21 and av.gun == 98 then
    nextChatv2(22)
  end
  if v2.c.chat.time >= 2 and v2.msgs[v2.c.chat.msgs] ~= nil then
    drawBubble(v2.c.x+50, v2.c.y-160, 300, 115, v2.c.chat.msg)
    if mouseClick(v2.c.x+50,v2.c.y-160,300,110) == true and v2.c.chat.next == false and v2.c.chat.msgs ~= 18 then
      nextChatv2()
    end
    if v2.msgs[v2.c.chat.msgs] ~= nil then
      if string.len(v2.msgs[v2.c.chat.msgs]) ~= string.len(v2.c.chat.msg) then
        v2.c.chat.char = v2.c.chat.char + v2.c.chat.sp*(60/love.timer.getFPS())
        v2.c.chat.msg = string.sub(v2.msgs[v2.c.chat.msgs], 1, math.floor(v2.c.chat.char))
      end
    end
  else
    v2.c.chat.time = v2.c.chat.time + delta
  end
end
function drawVirus2Stencil()
  love.graphics.setShader(mask_effect)
  playAnimation(v2.c.idle.mask, true, v2.c.x+v2.shakex, v2.c.y+v2.shakey, v2.c.r, v2.c.s, 125, 125, 0.5)
  love.graphics.setShader()
end
function handOpa(hand,opa)
  if v2.c.handp == hand then
    if opa < 256 then
      if hand == "idle" then
        v2.c.handsOp = v2.c.handsOp + 16
      elseif hand == "fist" then
        v2.c.fistOp = v2.c.fistOp + 16
      elseif hand == "gunfront" then
        v2.c.gunfrontOp = v2.c.gunfrontOp + 16
      elseif hand == "gunidle" then
        v2.c.gunidleOp = v2.c.gunidleOp + 16
      elseif hand == "gunup" then
        v2.c.gunupOp = v2.c.gunupOp + 16
      elseif hand == "gunpoint" then
        v2.c.gunpointOp = v2.c.gunpointOp + 16
      elseif hand == "spread" then
        v2.c.spreadOp = v2.c.spreadOp + 16
      end
    end
  else
    if opa > 0 then
      if hand == "idle" then
        v2.c.handsOp = v2.c.handsOp - 16
      elseif hand == "fist" then
        v2.c.fistOp = v2.c.fistOp - 16
      elseif hand == "gunfront" then
        v2.c.gunfrontOp = v2.c.gunfrontOp - 16
      elseif hand == "gunidle" then
        v2.c.gunidleOp = v2.c.gunidleOp - 16
      elseif hand == "gunup" then
        v2.c.gunupOp = v2.c.gunupOp - 16
      elseif hand == "gunpoint" then
        v2.c.gunpointOp = v2.c.gunpointOp - 16
      elseif hand == "spread" then
        v2.c.spreadOp = v2.c.spreadOp - 16
      end
    end
  end
end

function nextChatv2(messag)
  v2.c.chat.next = true
  if messag == nil then
    v2.c.chat.msgs = v2.c.chat.msgs + 1
  else
    v2.c.chat.msgs = messag
  end
  v2.c.chat.char = 0
  v2.c.chat.msg = ""
  v2.mTime = 0
end
function addShotgun(x,y,d,b)
  local rot = math.atan2((win[4].y+win[4].h/2 - y), (win[4].x+win[4].w/2 - x))
  table.insert(v2.sg, 1, {x=x,y=y,r=rot,d=d,b=b,t=0,op=0,ra=math.rad(45),rem=false,remp=false,f=false})
  if v2.c.cockgun:isPlaying() == true then
    v2.c.cockgun:rewind()
  else
    v2.c.cockgun:play()
  end
end
function floatingShotgun()
  for i=1,#v2.sg do
    love.graphics.setColor(256,256,256,v2.sg[i].op)
    love.graphics.draw(v2.c.shotgun, v2.sg[i].x, v2.sg[i].y, v2.sg[i].r+v2.sg[i].ra, 1, 1, 150, 60)
  end
  love.graphics.setColor(256,256,256,256)
  for i=1,#v2.sg do
    v2.sg[i].t = v2.sg[i].t + delta
    if v2.sg[i].ra > math.rad(0) and v2.sg[i].remp == false then
      v2.sg[i].ra = v2.sg[i].ra - math.rad(5)*sys.s
    elseif v2.sg[i].ra <= 0 and v2.sg[i].remp == false then
      v2.sg[i].ra = 0
    end
    if v2.sg[i].t >= v2.sg[i].d and v2.sg[i].f == false then
      local x1 = math.cos(v2.sg[i].r+math.rad(90))*(v2.sg[i].x-15-v2.sg[i].x)
      -math.sin(v2.sg[i].r+math.rad(90))*(v2.sg[i].y-140-v2.sg[i].y)+v2.sg[i].x
      local y1 = math.sin(v2.sg[i].r+math.rad(90))*(v2.sg[i].x-15-v2.sg[i].x)
      +math.cos(v2.sg[i].r+math.rad(90))*(v2.sg[i].y-140-v2.sg[i].y)+v2.sg[i].y
      local x2 = math.cos(v2.sg[i].r+math.rad(90))*(v2.sg[i].x-25-v2.sg[i].x)
      -math.sin(v2.sg[i].r+math.rad(90))*(v2.sg[i].y-140-v2.sg[i].y)+v2.sg[i].x
      local y2 = math.sin(v2.sg[i].r+math.rad(90))*(v2.sg[i].x-25-v2.sg[i].x)
      +math.cos(v2.sg[i].r+math.rad(90))*(v2.sg[i].y-140-v2.sg[i].y)+v2.sg[i].y
      local x3 = math.cos(v2.sg[i].r+math.rad(90))*(v2.sg[i].x-30-v2.sg[i].x)
      -math.sin(v2.sg[i].r+math.rad(90))*(v2.sg[i].y-140-v2.sg[i].y)+v2.sg[i].x
      local y3 = math.sin(v2.sg[i].r+math.rad(90))*(v2.sg[i].x-30-v2.sg[i].x)
      +math.cos(v2.sg[i].r+math.rad(90))*(v2.sg[i].y-140-v2.sg[i].y)+v2.sg[i].y
      if v2.sg[i].b == 1 then
        addBullet(x1,y1,v2.sg[i].r+math.rad(4),10,"v1",2)
        addBullet(x3,y3,v2.sg[i].r-math.rad(4),10,"v1",2)
      end
      if math.random(1,8) == 8 then
        addBullet(x2,y2,v2.sg[i].r,10,"v1",5)
      else
        addBullet(x2,y2,v2.sg[i].r,10,"v1",1)
      end
      v2.sg[i].f = true
      if v2.c.fire:isPlaying() == true then
        v2.c.fire:rewind()
      else
        v2.c.fire:play()
      end
    end
    if v2.sg[i].op < 256 and v2.sg[i].remp == false then
      v2.sg[i].op = v2.sg[i].op + 20*sys.s
    end
    if v2.sg[i].op > 256 then
      v2.sg[i].op = 256
    end
    if v2.sg[i].remp == true then
      v2.sg[i].op = v2.sg[i].op - 20*sys.s
      v2.sg[i].ra = v2.sg[i].ra + math.rad(5)*sys.s
    end
    if v2.sg[i].t > v2.sg[i].d+0.5 then
      v2.sg[i].remp = true
    end
    if v2.sg[i].t > v2.sg[i].d+1 then
      v2.sg[i].rem = true
    end
    if v2.sg[i].rem == true then
      table.remove(v2.sg, i)
      return
    end
  end
end
function v2FirstAttack()
  if v2.fightTimer > v2.firstAttack and v2.firstAttack <= 13 then
    local hole = math.random(1,math.floor(sys.w/130)-2)
    v2.spm = 2
    v2.c.xd = math.random(125,sys.w-125)
    for i=1,math.floor(sys.w/130)+1 do
      if i <= hole+2 and i >= hole then
      else
        table.insert(v2.sg, 1, {x=i*140-50,y=200,r=math.rad(90),d=0.5,b=1,t=0,op=0,ra=math.rad(45),rem=false,remp=false,f=false})
      end
    end
    v2.firstAttack = v2.firstAttack + 1.8-(v2.firstAttack/10)
    if v2.firstAttack >= 12 then
      v2.spm = 1
    end
  end
  if v2.fightTimer > v2.firstAttack and v2.firstAttack > 13 and v2.firstAttack <= 18 then
    addPopup(true)
    v2.firstAttack = v2.firstAttack + 1
  end
end
function v2RandomShotgunAttack()
  if v2.attackTimer <= 0 then
    v2.attackTimer = 0.4
    addShotgun(math.random(0,sys.w),math.random(0,sys.h/2),0.5,1)
  end
end
function v2ShotgunRowAttack()
  if v2.attackTimer <= 0 then
    v2.attackTimer = 1
    local hole = math.random(1,math.floor(sys.w/130)-2)
    for i=1,math.floor(sys.w/130)+1 do
      if i <= hole+2 and i >= hole then
      else
        table.insert(v2.sg, 1, {x=i*140-50,y=200,r=math.rad(90),d=0.5,b=1,t=0,op=0,ra=math.rad(45),rem=false,remp=false,f=false})
      end
    end
  end
end
function v2PopupAttack()
  if v2.attackTimer <= 0 then
    v2.attackTimer = 1
    addPopup(true)
  end
end
function v2ShotgunAttack()
  v2.c.handp = "gunpoint"
  if v2.attackTimer <= 0 then
    local xx = math.cos(v2.gun.r+math.rad(90))*(v2.c.x-82+150-v2.c.x-82)
    -math.sin(v2.gun.r+math.rad(90))*(v2.c.y+35-275-v2.c.y+35)+v2.c.x-82
    local yy = math.sin(v2.gun.r+math.rad(70))*(v2.c.x-82+150-v2.c.x-82)
    +math.cos(v2.gun.r+math.rad(90))*(v2.c.y+35-275-v2.c.y+35)+v2.c.y+35
    addBullet(xx,yy,v2.gun.r+math.rad(4),10,"v1",2)
    addBullet(xx,yy,v2.gun.r-math.rad(4),10,"v1",2)
    if math.random(1,8) == 8 then
      addBullet(xx,yy,v2.gun.r,10,"v1",5)
    else
      addBullet(xx,yy,v2.gun.r,10,"v1",1)
    end
    if v2.c.fire:isPlaying() == true then
      v2.c.fire:rewind()
    else
      v2.c.fire:play()
    end
    if v2.c.health <= 50 and math.random(1,3) == 1 then
      for i=1,3 do
        addShotgun(math.random(0,sys.w),math.random(0,sys.h/2),0.5,1)
      end
    end
    v2.attackTimer = 1
  end
end
function v2ShootingPopupAttack()
end
function v2ShotgunPopupAttack()
  if v2.attackTimer <= 0 then
    v2.attackTimer = 1.5
    addPopup(true)
    addShotgun(math.random(0,sys.w),math.random(0,sys.h/2),2,1)
  end
end
function shotgunBundleAttack()
  if v2.attackTimer <= 0 then
    v2.attackTimer = 2
    for i=1,8 do
      addShotgun(math.random(0,sys.w),math.random(0,sys.h/2),0.5,1)
    end
  end
end
function shotgunSpiralAttack()
  if v2.attackTimer <= 0 then
    v2.attackTimer = 1.5
    local xx = math.random(0,sys.w)
    local yy = math.random(0,sys.h)
    local dd = math.random(1,8)
    for i=1,8 do
      table.insert(v2.sg, 1, {x=xx,y=yy,r=math.rad(45*i),d=dd,b=1,t=0,op=0,ra=math.rad(45),rem=false,remp=false,f=false})
    end
  end
end
function superFastShotgunAttack()
  if v2.attackTimer <= 0 then
    v2.attackTimer = 0.1
    addShotgun(math.random(0,sys.w),math.random(0,sys.h/2),0.5,2)
  end
end
