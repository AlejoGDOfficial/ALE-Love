local ALEGame = ALEClass:new()

function ALEGame:new(state)
    self.state = state

    return self
end

function ALEGame:load()
    self.state:load()
end

function ALEGame:update(elapsed)
    self.state:update(elapsed)
end

function ALEGame:draw()
    self.state:draw()
end

return ALEGame
