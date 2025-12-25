local ALEPoint = require('ale.math.ALEPoint')

local ALESprite = ALEClass.extend(ALEBasic)

function ALESprite:new(x, y, graphic)
    local this = ALEBasic.new(self)

    this.cameras = { ALE_G.cameras.members[1] }

    this.x = x or 0

    this.y = y or 0

    this.velocity = ALEPoint:new()

    this.acceleration = ALEPoint:new()

    this.alpha = 1

    this.angle = 0

    this.color = {
        r = 255,
        g = 255,
        b = 255
    }

    this.scale = ALEPoint:new(1, 1)

    this.origin = ALEPoint:new()

    this.offset = ALEPoint:new()

    this.scrollFactor = ALEPoint:new()

    this.graphic = nil

    if graphic then
        this:loadGraphic(graphic)
    else
        this:makeGraphic(100, 100, { r = 255, g = 0, b = 255 })
    end

    this.visible = true

    return this
end

function ALESprite:makeGraphic(width, height, color)
    color = color or { r = 255, g = 255, b = 255 }

    local imgData = love.image.newImageData(width, height)

    imgData:mapPixel(
        function(x, y, r, g, b, a)
            return color.r / 255, color.g / 255, color.b / 255, 1
        end
    )

    self.graphic = love.graphics.newImage(imgData)

    self:updateHitbox()
end

function ALESprite:loadGraphic(target)
    self.graphic = ALEPaths.image(target)

    self:updateHitbox()
end

function ALESprite:updateHitbox()
    self.origin:set(self.graphic:getWidth() * self.scale.x / 2, self.graphic:getHeight() * self.scale.y / 2)
end

function ALESprite:draw()
    for i, camera in ipairs(self.cameras) do
        if camera then
            camera:queue(self)
        end
    end
end

function ALESprite:update(elapsed)
    self.velocity.x = self.velocity.x + self.acceleration.x * elapsed

    self.x = self.x + self.velocity.x * elapsed

    self.velocity.y = self.velocity.y + self.acceleration.y * elapsed

    self.y = self.y + self.velocity.y * elapsed
end

function ALESprite:screenCenter()
    local sw, sh = love.graphics.getDimensions()

    self.x = sw / 2 - self:getWidth() / 2
    self.y = sh / 2 - self:getHeight() / 2
end

function ALESprite:getWidth()
    return self.graphic:getWidth() * self.scale.x
end

function ALESprite:getHeight()
    return self.graphic:getHeight() * self.scale.y
end

return ALESprite
