local Class = require('ale.std.Class')

local ALEBasic = Class()

function ALEBasic:new()
end

function ALEBasic:update(elapsed)
    print('' .. elapsed)
end

function ALEBasic.draw()

end

function ALEBasic:destroy()

end

return ALEBasic
