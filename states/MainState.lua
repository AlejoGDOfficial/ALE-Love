local ALEState = require('ale.ALEState')

local MainState = setmetatable({}, { __index = ALEState })

MainState.__index = MainState

function MainState:new()
    local obj = ALEState:new()

    setmetatable(obj, MainState)

    return obj
end

local Player = require('objects.Player')

local player = Player:new(20, 20, 100)

function MainState:load()
    self:add(player)

    ALEState.load(self)
end

function MainState:update(elapsed)
    ALEState.update(self, elapsed)
end

return MainState
