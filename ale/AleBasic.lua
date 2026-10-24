AleBasic = Classic:extend()

function AleBasic:new()
    local ext = AleBasic.super.new(self)

    ext.active = true
    ext.alive = true
    ext.visible = true
    ext.exists = true

    ext.cameras = {}

    return ext
end

function AleBasic:update(elapsed)

end

function AleBasic:draw()

end

function AleBasic:destroy()

end

function AleBasic:toString()
    return 'AleBasic'
end

return AleBasic
