local Class = {}

function Class.create(base)
    local c = {}

    c.__index = c

    function c:new(...)
        local obj = setmetatable({}, c)

        if c.__init then
            c.__init(obj, ...)
        end

        return obj
    end

    if base then
        setmetatable(c, { __index = base })

        c.super = base
    end

    function c:extend()
        return Class.create(self)
    end

    return c
end

return Class
