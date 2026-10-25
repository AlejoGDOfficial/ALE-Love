local AleObject = require 'ale.AleObject'
local AlePaths = require 'ale.assets.AlePaths'
local AleAngle = require 'ale.math.AleAngle'
local AlePoint = require 'ale.math.AlePoint'
local AleColorUtil = require 'ale.util.AleColorUtil'

local AleSprite = AleObject:extend()

AleSprite.__name = 'AleSprite'

function AleSprite:new(x, y, img)
    local ext = AleSprite.super.new(self, x, y)

    ext.graphic = nil

    ext.scale = AlePoint:new(1, 1)
    ext.skew = AlePoint:new(0)
    ext.origin = AlePoint:new()
    ext.offset = AlePoint:new()
    ext.color = AleColorUtil.white
    ext.clipRect = nil

    if img then
        ext:loadGraphic(img)
    end

    return ext
end

function AleSprite:loadGraphic(img)
    self.graphic = type(img) == 'string' and AlePaths.image(img) or img

    self:updateSize()
    self:centerOrigin()
end

function AleSprite:updateSize()
    self.frameWidth, self.frameHeight = self.graphic:getDimensions()

    self.width = self.frameWidth
    self.height = self.frameHeight
end

function AleSprite:centerOrigin()
    self.origin:set(self.frameWidth / 2, self.frameHeight / 2)
end

function AleSprite:updateHitbox()
    self.width = math.abs(self.scale.x) * self.frameWidth
    self.height = math.abs(self.scale.y) * self.frameHeight

    self.offset:set(-0.5 * (self.width - self.frameWidth), -0.5 * (self.height - self.frameHeight))

    self:centerOrigin()
end

function AleSprite:drawComplex(cam)
    if not self.graphic then
        return
    end

    if self.clipRect then
        love.graphics.setScissor(self.clipRect.x, self.clipRect.y, self.clipRect.width, self.clipRect.height)
    end

    love.graphics.setColor(AleColorUtil.getNormalizedRGB(self.color))

    love.graphics.draw(
        self.graphic,
        self.x - self.offset.x + self.origin.x,
        self.y - self.offset.y + self.origin.y,
        AleAngle.toRad * self.angle,
        self.scale.x,
        self.scale.y,
        self.origin.x, self.origin.y,
        math.tan(AleAngle.toRad * self.skew.x),
        math.tan(AleAngle.toRad * self.skew.y)
    )

    love.graphics.setColor(1, 1, 1, 1)

    love.graphics.setScissor()
end

return AleSprite
