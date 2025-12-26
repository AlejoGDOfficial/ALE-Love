local ALEClass = {}

function ALEClass:new()
    local obj = {
        __getters = {},
        __setters = {},
        __class   = self
    }

    setmetatable(obj, {
        __index = function(self, key)
            local getter = self.__getters[key]
            if getter then
                return getter(self)
            end

            local value = rawget(self, key)
            if value ~= nil then
                return value
            end

            return self.__class[key]
        end,

        __newindex = function(self, key, value)
            local setter = self.__setters[key]
            if setter then
                return setter(self, value)
            end

            rawset(self, key, value)
        end,

        __tostring = function(self)
            return self.__class.__id or "Object"
        end
    })

    return obj
end

function ALEClass.extend(super)
    super = super or ALEClass

    local child = {}
    child.__super = super

    setmetatable(child, { __index = super })

    local info = debug.getinfo(2, 'S')
    child.__id =
        (info and info.source or '')
        :gsub('^@', '')
        :match('([^/\\]+)%.lua$')
        or 'Object'

    return child
end

return ALEClass
