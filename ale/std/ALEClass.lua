local ALEClass = {}

function ALEClass:new()
    local obj = {
        __getters = {},
        __setters = {},
        __class = self
    }

    setmetatable(obj, {
        __index = function(this, key)
            local getter = this.__getters[key]

            if getter then
                return getter(this)
            end

            return this.__class[key]
        end,

        __newindex = function(this, key, value)
            local setter = this.__setters[key]

            if setter then
                return setter(this, value)
            end

            rawset(this, key, value)
        end,

        __tostring = function(this)
            return this.__id
        end
    })

    return obj
end

function ALEClass.extend(super)
    super = super or ALEClass

    local child = {}

    child.super = super

    setmetatable(child, { __index = super })

    local info = debug.getinfo(2, 'S')

    child.__id = (info and info.source or ''):gsub('^@', ''):match('([^/\\]+)%.lua$') or 'Object'

    return child
end

return ALEClass
