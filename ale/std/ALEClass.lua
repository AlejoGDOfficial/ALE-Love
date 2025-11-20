local ALEClass = {}

function ALEClass:new()
    local obj = {}

    setmetatable(obj, self)

    self.__index = self

    return obj
end

function ALEClass.extend(class)
    return setmetatable({}, { __index = class or ALEClass })
end

return ALEClass
