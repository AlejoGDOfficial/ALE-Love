local ALEDrawable = require('ale.ALEDrawable')

local ALEText = ALEClass.extend(ALEDrawable)

function ALEText:new(x, y, text, size)
    local this = ALEDrawable.new(self, x, y)

    this.graphic = love.graphics.newText(love.graphics.newFont())

    this.__property.setters.font = function(_, value)
        this.__property:set('font', value)

        this.graphic:setFont(value and ALEPaths.font(value, this.size) or love.graphics.newFont(this.size))
    end

    this.__property.setters.text = function(_, value)
        this.__property:set('text', value)

        this.graphic:set(value)
    end

    this.__property.setters.size = function(_, value)
        this.__property:set('size', value)

        this.font = this.font
    end

    this.size = size or 12

    this.font = nil

    this.text = text or ''

    return this
end

return ALEText
