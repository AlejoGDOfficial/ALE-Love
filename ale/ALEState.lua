local ALEGroup = require('ale.group.ALEGroup')

local ALEState = ALEGroup:extend()

function ALEState:load()
    self.super:load()
end

return ALEState
