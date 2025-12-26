local ALEDrawable = require('ale.ALEDrawable')

local ALEText = ALEClass.extend(ALEDrawable)

function ALEText:new(x, y, text)
    local this = ALEDrawable.new(self, x, y)

    this.graphic = love.graphics.newText(love.graphics.newFont())

    this.__setters.font = function(_, value)
        this.graphic:setFont(value and ALEPaths.font(value) or love.graphics.newFont())

        return value
    end

    this.__setters.text = function(_, value)
        this.graphic:set(value)

        return value
    end

    this.text = text or ''

    return this
end

return ALEText
