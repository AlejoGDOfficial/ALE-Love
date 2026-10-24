local AleMeta = require 'ale.config.AleMeta'

function love.conf(game)
    game.window = {
        title = AleMeta.title,
        width = AleMeta.width,
        height = AleMeta.height
    }

    game.console = AleMeta.console
end
