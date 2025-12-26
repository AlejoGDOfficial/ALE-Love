local TestState = ALEClass.extend(ALEState)

function TestState:load()
    local text = ALEText:new()
    self:add(text)
    text.text = 'enrique'
    text.font = 'nokiafc22.ttf'
    text.size = 50
end

return TestState
