local AleMeta = require 'ale.config.AleMeta'

local AleG = {}

AleG.state = nil

function AleG.init()
    AleG.state = AleMeta.initialState:new()
end

function AleG.update(elapsed)
    AleG.state:update(elapsed)
end

function AleG.draw()
    AleG.state:draw()
end

return AleG
