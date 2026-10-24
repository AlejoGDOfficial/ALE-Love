local AleMeta = {
    title = 'ALE Love',

    width = 1280,
    height = 720,

    console = true,

    logs = require 'ale.debug.AleLogs',
    assets = require 'ale.assets.AleAssets',
    state = require 'ale.AleState'
}

return AleMeta
