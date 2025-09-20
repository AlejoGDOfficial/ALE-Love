local function Class(base)
    local cls = {}

    cls.__index = cls

    setmetatable(cls, { __index = base })

    function cls:new(...)
        local obj = setmetatable({}, cls)

        if cls.super and cls.super.new then
            obj.super.new(obj, ...)
        end

        return obj
    end

    function cls:extend()
        local sub = Class(self)

        sub.super = self

        return sub
    end

    return cls
end

return Class
