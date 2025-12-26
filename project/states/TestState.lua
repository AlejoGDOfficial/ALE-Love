local TestState = ALEClass.extend(ALEState)

function TestState:load()
    local ALEJson = require('ale.util.ALEJson')

    local text = ALEText:new(0, 0, 'asdasda', 50)
    text.text = 'adriana'
    self:add(text)
end

return TestState
