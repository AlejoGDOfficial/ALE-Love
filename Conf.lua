local ffi = require("ffi")

ffi.cdef "int SetProcessDPIAware();"

ffi.load("user32").SetProcessDPIAware()

function love.conf(game)
    game.window.title = 'ALE Love'
    game.window.width = 1280
    game.window.height = 720
    game.console = true
end
