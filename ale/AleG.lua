local AleG = {
    elapsed = 0
}

function AleG.init()
    local AleMeta = require 'ale.config.AleMeta'

    AleG.logs = AleMeta.logs:new()
    AleG.assets = AleMeta.assets:new()

    AleG.state = AleMeta.state:new()
end

function AleG.destroy() end

function AleG.update(elapsed)
    AleG.elapsed = elapsed

    AleG.state:update(elapsed)
end

function AleG.draw()
    AleG.state:draw()
end

return AleG
