local ALECamera = ALEClass.extend(ALEBasic)

function ALECamera:new(x, y, width, height)
    local this = ALEBasic.new(self)

    this.scroll = {
        x = 0,
        y = 0,
        set = function(s, sX, sY)
            s.x = sX or 0
            s.y = sY or 0
        end
    }

    this.zoom = 1

    this.width = width or love.graphics.getWidth()
    this.height = height or love.graphics.getHeight()

    this._queue = {}

    this._batches = {}

    return this
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

    for _, obj in ipairs(self._queue) do
        self:drawObject(obj)
    end

    self:detach()

    self._queue = {}
end

function ALECamera:queue(obj)
    table.insert(self._queue, obj)
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
        obj.x + obj.origin.x - self.scroll.x * obj.scrollFactor.x,
        obj.y + obj.origin.y - self.scroll.y * obj.scrollFactor.y,
        math.rad(obj.angle),
        obj.scale.x,
        obj.scale.y,
        obj.origin.x / obj.scale.x,
        obj.origin.y / obj.scale.y
    )
end

return ALECamera
