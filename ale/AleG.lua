local AleG = {}

function AleG.init()
    AleG.elapsed = 0
    AleG.time = 0

    local AleMeta = require 'ale.config.AleMeta'

    local AleCamerasManager = require 'ale.graphics.AleCamerasManager'

    AleG.logs = AleMeta.logs:new()
    AleG.assets = AleMeta.assets:new()

    AleG.cameras = AleCamerasManager:new()

    AleG.state = AleMeta.state:new()
    AleG.state:create();
end

function AleG.destroy() end

function AleG.update(elapsed)
    AleG.elapsed = elapsed
    AleG.time = AleG.time + elapsed

    AleG.state:tryUpdate(elapsed)
end

function AleG.draw()
    AleG.state:draw()

    AleG.cameras:draw()
end

return AleG
