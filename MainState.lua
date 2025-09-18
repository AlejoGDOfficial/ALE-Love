local State = require('backend.State')

local MainState = setmetatable({}, { __index = State })

MainState.__index = MainState

function MainState:new()
    self = State:new()

    setmetatable(self, MainState)

    return self
end

function MainState:load()

end

return MainState
