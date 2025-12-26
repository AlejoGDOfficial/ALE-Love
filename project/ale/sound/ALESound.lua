local ALESound = ALEClass.extend(ALEBasic)

function ALESound:new(file, volume)
    local this = ALEBasic.new(self)

    this.audio = love.audio.newSource(ALEPaths.sound(file), 'static')

    return this
end

function ALESound:play()
    self.audio:play()
end

function ALESound:pause()
    self.audio:pause()
end

function ALESound:stop()
    self.audio:stop()
end

return ALESound
