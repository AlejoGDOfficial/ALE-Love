local AleMeta = require 'ale.config.AleMeta'

local AleG = {
    state = nil,
    assets = nil
}

function AleG.init()
    AleG.state = AleMeta.state:new()

    AleG.assets = AleMeta.assets:new()
end

function AleG.destroy() end

function AleG.update(elapsed)
    AleG.state:update(elapsed)
end

function AleG.draw()
    AleG.state:draw()
end

return AleG
