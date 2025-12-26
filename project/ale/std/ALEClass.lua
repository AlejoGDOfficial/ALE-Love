local ALEClass = {}

function ALEClass:new()
    local obj = {
        __property = {
            getters = {},
            setters = {},
            data = {},
            set = function(this, key, val)
                rawset(this.data, key, val)
            end,
            get = function(this, key)
                return rawget(this.data, key)
            end
        },
        __class = self
    }

    setmetatable(obj, {
        __index = function(this, key)
            local prop = this.__property

            local getter = prop.getters[key]

            if getter then
                return getter(this)
            end

            return rawget(prop.data, key) or this.__class[key]
        end,

        __newindex = function(this, key, value)
            local prop = this.__property

            local setter = prop.setters[key]

            if setter then
                setter(this, value)
            else
                rawset(prop.data, key, value)
            end
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
