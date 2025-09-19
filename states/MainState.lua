local ALEState = require('ale.ALEState')

local MainState = setmetatable({}, { __index = ALEState })

MainState.__index = MainState

function MainState:new()
    local obj = ALEState:new()

    setmetatable(obj, MainState)

    return obj
end

local Player = require('objects.Player')

local player = Player:new(0, 0, 100)
player:screenCenter()
player.color.red = 0
player.color.green = 150

function MainState:load()
    self:add(player)

    ALEState.load(self)
end

local ALEMath = require('ale.ALEMath')

local curTime = 0

function MainState:update(elapsed)
    curTime = curTime + elapsed

    local mouseX, mouseY = love.mouse.getPosition()

    player.x = ALEMath.fpsLerp(player.x, mouseX - player.size / 2, 0.5, elapsed)
    player.y = ALEMath.fpsLerp(player.y, mouseY - player.size / 2, 0.5, elapsed)

    ALEState.update(self, elapsed)
end

return MainState
