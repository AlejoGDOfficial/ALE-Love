local JSON = require('ale.std.JSON')

local ALEJson = {}

function ALEJson.parse(source)
    return JSON.decode(source)
end

function ALEJson.stringify(tab)
    return JSON.enconde(tab)
end

return ALEJson
