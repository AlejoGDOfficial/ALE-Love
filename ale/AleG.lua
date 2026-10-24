local AleG = {}

function AleG.init()
    AleG.elapsed = 0
    AleG.time = 0

    local AleMeta = require 'ale.config.AleMeta'

    local AleCamerasManager = require 'ale.graphics.AleCamerasManager'

    AleG.logs = AleMeta.logs:new()
    AleG.assets = AleMeta.assets:new()

    AleG.cameras = AleCamerasManager:new()

    AleG.switchState(AleMeta.state:new())
end

function AleG.destroy() end

function AleG.update(elapsed)
    AleG.elapsed = elapsed
    AleG.time = AleG.time + elapsed

    AleG.cameras:update(elapsed)

    AleG.state:tryUpdate(elapsed)
end

function AleG.draw()
    AleG.state:draw()

    AleG.cameras:draw()
end

function AleG.switchState(state)
    if AleG.state then
        AleG.state:destroy()
    end

    AleG.cameras:clear()

    local AleCamera = require 'ale.AleCamera'

    AleG.camera = AleCamera:new()
    AleG.cameras:add(AleG.camera)

    AleG.state = state
    state:create()
end

return AleG
