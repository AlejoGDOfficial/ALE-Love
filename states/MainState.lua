local ALEState = require('ale.ALEState')

local MainState = ALEState:extend()

local Player = require('objects.Player')

local player = Player:new(0, 0, 100)
player:screenCenter()
player.color.red = 0
player.color.green = 155

function MainState:load()
    self.super:load()

    self:add(player)
end

local ALEMath = require('ale.ALEMath')

local curTime = 0

function MainState:update(elapsed)
    self.super:update(elapsed)

    curTime = curTime + elapsed

    local mouseX, mouseY = love.mouse.getPosition()

    player.x = ALEMath.fpsLerp(player.x, mouseX - player.size / 2, 0.5, elapsed)
    player.y = ALEMath.fpsLerp(player.y, mouseY - player.size / 2, 0.5, elapsed)

    ALEState.update(self, elapsed)
end

function love.mousepressed(x, y, isTouch, pressed)
    player.color.blue = 155
    player.color.green = 55
end

function love.mousereleased(x, y, isTouch, pressed)
    player.color.blue = 255
    player.color.green = 155
end

return MainState
