local ALEDrawable = require('ale.ALEDrawable')

local ALEText = ALEClass.extend(ALEDrawable)

function ALEText:new(x, y, text)
    local this = ALEDrawable.new(self, x, y)

    this._text = text or ''

    this.graphic = love.graphics.newText(love.graphics.newFont(), this._text)

    return this
end

function ALEText:getText()
    return self._text
end

function ALEText:setText(text)
    self.graphic:set(text)
end

function ALEText:setFont(file, size)
    self.graphic:setFont(file and ALEPaths.font(file) or love.graphics.newFont(), size or 12)
end

return ALEText
