local State = require('backend.State')

local MainState = setmetatable({}, { __index = State })

MainState.__index = MainState

function MainState:new()
    self = State:new()

    setmetatable(self, MainState)

    return self
end

local Player = require('objects.Player')

local player = Player:new(20, 20)

function MainState:load()
    self:add(player)
end

return MainState
