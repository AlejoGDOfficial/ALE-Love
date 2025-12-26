local ALEPoint = ALEClass.extend()

function ALEPoint:new(x, y)
    local this = ALEClass.new(self)

    this.x = x or 0
    this.y = y or 0

    return this
end

function ALEPoint:set(x, y)
    self.x = x or 0
    self.y = y or 0
end

return ALEPoint
