local AleGroup = require 'ale.groups.AleGroup'

local AleState = AleGroup:extend()

AleState.__name = 'AleState'

function AleState:new()
    local ext = AleState.super.new(self)

    ext.child = nil
    ext.parent = nil
    ext.persistentUpdate = false

    return ext
end

function AleState:create() end

function AleState:tryUpdate(elapsed)
    if self.child then
        self.child:tryUpdate(elapsed)
    end

    if self.child == nil or self.persistentUpdate then
        self:update(elapsed)
    end
end

function AleState:draw()
    AleState.super.draw(self)

    if self.child then
        self.child:draw()
    end
end

function AleState:openChild(sub)
    if self.child then
        AleState:closeChild()
    end

    self.child = sub

    sub.parent = self
    sub.create()
end

function AleState:closeChild()
    if self.child then
        self.child.destroy()
        self.child = nil
    end
end

function AleState:destroy()
    AleState:closeChild()

    AleState.super.destroy(self)
end

return AleState
