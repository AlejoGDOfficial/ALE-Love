local ALEPoint = require('ale.math.ALEPoint')

local ALEObject = ALEClass.extend(ALEBasic)

function ALEObject:new(x, y)
    local this = ALEBasic.new(self)

    this.x = x or 0

    this.y = y or 0

    this.velocity = ALEPoint:new()

    this.acceleration = ALEPoint:new()

    this.angle = 0

    this.scale = ALEPoint:new(1, 1)

    this.origin = ALEPoint:new()

    this.offset = ALEPoint:new()

    this.scrollFactor = ALEPoint:new()

    this.__property.getters.width = function(s)
        return s.scale.x
    end

    this.__property.setters.width = nil

    this.__property.getters.height = function(s)
        return s.scale.y
    end

    this.__property.setters.height = nil

    return this
end

function ALEObject:update(elapsed)
    self.velocity.x = self.velocity.x + self.acceleration.x * elapsed

    self.x = self.x + self.velocity.x * elapsed

    self.velocity.y = self.velocity.y + self.acceleration.y * elapsed

    self.y = self.y + self.velocity.y * elapsed
end

function ALEObject:screenCenter()
    local sw, sh = love.graphics.getDimensions()

    self.x = sw / 2 - self.width / 2
    self.y = sh / 2 - self.height / 2
end

return ALEObject
