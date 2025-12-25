local ALEDrawable = require('ale.ALEDrawable')

local ALEVideo = ALEClass.extend(ALEDrawable)

function ALEVideo:new(x, y, graphic)
    local this = ALEDrawable.new(self, x, y)

    this:loadGraphic(graphic)

    return this
end

function ALEVideo:loadGraphic(target)
    self.graphic = ALEPaths.video(target)

    self:updateHitbox()
end

function ALEVideo:play()
    self.graphic:play()
end

return ALEVideo
