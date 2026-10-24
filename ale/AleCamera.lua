local AleBasic = require 'ale.AleBasic'
local AleArrayUtil = require 'ale.util.AleArrayUtil'
local AlePoint = require 'ale.math.AlePoint'
local AleAngle = require 'ale.math.AleAngle'

local AleCamera = AleBasic:extend()

AleCamera.__name = 'AleCamera'

function AleCamera:new()
    local ext = AleCamera.super.new(self)

    ext.members = {}
    ext.angle = 0
    ext.scroll = AlePoint:new()

    return ext
end

function AleCamera:queue(obj)
    table.insert(self.members, obj)
end

function AleCamera:draw()
    love.graphics.translate(-self.scroll.x, -self.scroll.y)

    local width, height = love.graphics.getDimensions()
    width = width / 2
    height = height / 2

    love.graphics.translate(width, height)

    love.graphics.rotate(AleAngle.toRad * self.angle)

    love.graphics.translate(-width, -height)

    AleArrayUtil.forEach(self.members, function(obj)
        obj:drawComplex(cam)
    end, true)
end

return AleCamera
