local AleGroup = require 'ale.groups.AleGroup'

local AleState = AleGroup:extend()

AleState.__name = 'AleState'

function AleState:new()
    local ext = AleState.super.new(self)

    ext.subState = nil

    ext:create()

    return ext
end

function AleState:create() end

return AleState
