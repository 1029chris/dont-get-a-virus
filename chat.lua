function drawChat()
  drawDownBox(8, 70, win[1].w-17, win[1].h-160, 4)
  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("fill", 8, 70, win[1].w-17, win[1].h-160, 0.5)
  drawDownBox(8, 320, win[1].w-17, 70, 4)
  love.graphics.setColor(250, 250, 250)
  love.graphics.rectangle("fill", 8, 320, win[1].w-17, 70)
  drawUpBox(178, 321, 62, 68, 2)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print("Send", 186, 350)
  love.graphics.setColor(255, 255, 255)
  drawDownBox(45, 31, win[1].w-53, 30, 2)
  if chat.status == 0 then
    love.graphics.draw(chat.offline, 215, 36)
  elseif chat.status == 1 then
    love.graphics.draw(chat.online, 215, 36)
  end
  love.graphics.setColor(255, 255, 255)
  love.graphics.draw(chat.profile, 6, 30)
  love.graphics.setColor(colors.font.dark)
  love.graphics.print(chat.profilename, 50, 41)
  love.graphics.setColor(colors.font.friend)
  if #msg.msgs <= 15 then
    for i=1,#msg.msgs do
      love.graphics.print("Friend: " .. msg.msgs[i], 12, 310 - (15*i))
    end
  elseif #msg.msgs >= 15 then
    for i=1,15 do
      love.graphics.print("Friend: " .. msg.msgs[i], 12, 310 - (15*i))
    end
  end
end
function updateChat()
  if msg.new == true then
    win[1].update = true
    msg.new = false
  end
end
function sendMessage(message)
end
