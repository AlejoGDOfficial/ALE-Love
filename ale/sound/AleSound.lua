local AleBasic = require 'ale.AleBasic'
local AlePaths = require 'ale.assets.AlePaths'

local AleSound = AleBasic:extend()

AleSound.__name = 'AleSound'

function AleSound:new(snd)
    local ext = AleSound.super.new(self)

    ext:loadSource(snd)

    return ext
end

function AleSound:loadSource(snd)
    self.source = type(snd) == 'string' and AlePaths.sound(snd) or snd
end

function AleSound:play()
    self.source:play()
end

function AleSound:stop()
    self.source:stop()
end

function AleSound:pause()
    self.source:pause()
end

function AleSound:rewind()
    self.source:rewind()
end

function AleSound:getLength()
    return self.source:getDuration() * 1000
end

function AleSound:setPosition(time)
    self.source:seek(time / 1000)
end

function AleSound:getPosition()
    return self.source:tell() * 1000
end

function AleSound:isPlaying()
    return self.source:isPlaying()
end

function AleSound:getVolume()
    return self.source:getVolume()
end

function AleSound:setVolume(vol)
    self.source:setVolume(vol)
end

function AleSound:isLooping()
    return self.source:isLooping()
end

function AleSound:setLooping(loop)
    self.source:setLooping(loop)
end

function AleSound:getPitch()
    return self.source:getPitch()
end

function AleSound:setPitch(pitch)
    self.source:setPitch(pitch)
end

return AleSound
