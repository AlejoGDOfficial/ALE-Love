require 'ale.config.AleImport'

function love.conf(game)
    game.window = {
        title = 'ALE Love',
        width = 1280,
        height = 720
    }
    game.console = true
end
