local ALECamera = ALEClass.extend(ALEBasic)

function ALECamera:new(x, y, width, height)
    local obj = ALEBasic.new(self)

    obj.scroll = {
        x = 0,
        y = 0,
        set = function(s, sX, sY)
            s.x = sX or 0
            s.y = sY or 0
        end
    }

    obj.zoom = 1

    obj.width = width or love.graphics.getWidth()
    obj.height = height or love.graphics.getHeight()

    obj._queue = {}

    return obj
end

function ALECamera:attach()
    love.graphics.push()

    local zoom = self.zoom
    love.graphics.scale(zoom)

    local halfW = self.width * 0.5
    local halfH = self.height * 0.5
    local invZoom = 1 / zoom

    love.graphics.translate(
        -self.scroll.x - halfW + (halfW * invZoom),
        -self.scroll.y - halfH + (halfH * invZoom)
    )
end

function ALECamera:detach()
    love.graphics.pop()
end

function ALECamera:draw()
    self:attach()

    local q = self._queue
    for i = 1, #q do
        self:drawObject(q[i])
    end

    self:detach()
end

function ALECamera:queue(obj)
    self._queue[#self._queue + 1] = obj
end

function ALECamera:drawObject(obj)
    if not obj.visible then
        return
    end

    love.graphics.setColor(
        obj.color.r / 255,
        obj.color.g / 255,
        obj.color.b / 255,
        obj.alpha
    )

    love.graphics.draw(
        obj.graphic,
        obj.x + obj.origin.x,
        obj.y + obj.origin.y,
        math.rad(obj.angle),
        obj.scale.x,
        obj.scale.y,
        obj.origin.x / obj.scale.x,
        obj.origin.y / obj.scale.y
    )
end

return ALECamera
