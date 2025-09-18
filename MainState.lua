local State = require('backend.State')

local MainState = setmetatable({}, { __index = State })

MainState.__index = MainState

function MainState:new()
    local obj = State:new()

    setmetatable(obj, MainState)

    return obj
end

local Player = require('objects.Player')

local player = Player:new(20, 20)

function MainState:load()
    self:add(player)
end

function MainState:update(elapsed)
    State.update(self, elapsed)
end

return MainState
