local ALEClass = {}

function ALEClass:new()
    local obj = {}

    setmetatable(obj, self)

    self.__index = self

    return obj
end

return ALEClass
