---
--- class
---
--- Copyright (c) 2014, rxi
---
--- This module is free software; you can redistribute it and/or modify it under
--- the terms of the MIT license. See LICENSE for details.
---

--- @class Classic
--- A base class that supports the `extend`, `implement`, and `is` functionalities.
--- @field super Classic|nil # A reference to the parent class (if extended).
local Classic = {}

Classic.__index = Classic

Classic.__name = 'Classic'

--- Creates a new instance of the class when called.
--- Constructor for an Classic.
--- @return table # A new instance of the class.
function Classic:new(...)
    local obj = setmetatable({}, self)
    return obj
end

--- Creates a subclass of the current class.
--- @return table # A new subclass of Classic.
function Classic:extend()
    local cls = {}
    for k, v in pairs(self) do
        if k:find("^__") then -- Copy only metamethods starting with "__"
            cls[k] = v
        end
    end
    cls.__index = cls
    cls.super = self -- Reference to the parent class
    setmetatable(cls, self)
    return cls
end

--- Implements the methods from other classes into the current class.
--- @vararg table # A list of classes whose methods will be implemented.
function Classic:implement(...)
    for _, cls in ipairs({ ... }) do
        for k, v in pairs(cls) do
            if self[k] == nil and type(v) == "function" then
                self[k] = v
            end
        end
    end
end

--- Checks if the current object is an instance of the given class.
--- @param T table # The class to check against.
--- @return boolean # True if the object is an instance of T, otherwise false.
function Classic:is(T)
    local mt = getmetatable(self)
    while mt do
        if mt == T then
            return true
        end
        mt = getmetatable(mt)
    end
    return false
end

function Classic:__tostring()
    return self:toString() or self.__name
end

--- Returns a string representation of the Classic
--- @return string
function Classic:toString()
    return nil
end

return Classic
