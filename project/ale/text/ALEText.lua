local ALEDrawable = require('ale.ALEDrawable')

local ALEText = ALEClass.extend(ALEDrawable)

function ALEText:new(x, y, text, size)
    local this = ALEDrawable.new(self, x, y)

    this.graphic = love.graphics.newText(love.graphics.newFont())

    this.__setters.text = function(_, value)
        this.graphic:set(value)

        return value
    end

    this.__setters.font = function(_, value)
        this.graphic:setFont(value and ALEPaths.font(value, this.size) or love.graphics.newFont(this.size))

        this:updateHitbox()

        return value
    end

    this.__setters.size = function(_, value)
        this.font = this.font

        return value
    end

    this.text = text or ''

    this.size = size or 12

    return this
end

return ALEText
