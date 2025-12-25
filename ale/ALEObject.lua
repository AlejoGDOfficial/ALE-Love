local ALEObject = ALEClass.extend(ALEBasic)

local ALEPoint = require('ale.math.ALEPoint')

function ALEObject:new(x, y)
    local this = ALEBasic.new(self)

    this.x = x or 0

    this.y = y or 0

    this.velocity = ALEPoint:new()

    this.acceleration = ALEPoint:new()

    this.alpha = 1

    this.angle = 0

    this.scale = ALEPoint:new(1, 1)

    this.origin = ALEPoint:new()

    this.offset = ALEPoint:new()

    this.scrollFactor = ALEPoint:new(1, 1)

    return this
end

function ALEObject:getWidth()
    return self.scale.x
end

function ALEObject:getHeight()
    return self.scale.y
end

function ALEObject:update(elapsed)
    self.velocity.x = self.velocity.x + self.acceleration.x * elapsed

    self.x = self.x + self.velocity.x * elapsed

    self.velocity.y = self.velocity.y + self.acceleration.y * elapsed

    self.y = self.y + self.velocity.y * elapsed
end

function ALEObject:screenCenter()
    local sw, sh = love.graphics.getDimensions()

    self.x = sw / 2 - self:getWidth() / 2
    self.y = sh / 2 - self:getHeight() / 2
end

return ALEObject
