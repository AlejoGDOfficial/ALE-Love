local ALEObject = require('ale.ALEObject')

local ALEDrawable = ALEClass.extend(ALEObject)

function ALEDrawable:new(x, y)
    local this = ALEObject.new(self, x, y)

    this.cameras = { ALE_G.cameras.members[1] }

    this.alpha = 1

    this.color = {
        r = 255,
        g = 255,
        b = 255
    }

    this.graphic = nil

    this.visible = true

    this.__property.getters.width = function(s)
        return this.graphic:getWidth() * this.scale.x
    end

    this.__property.getters.height = function(s)
        return this.graphic:getHeight() * this.scale.y
    end

    return this
end

function ALEDrawable:updateHitbox()
    self.origin:set(self.graphic:getWidth() * self.scale.x / 2, self.graphic:getHeight() * self.scale.y / 2)
end

function ALEDrawable:draw()
    for _, camera in ipairs(self.cameras) do
        if camera then
            camera:queue(self)
        end
    end
end

return ALEDrawable
