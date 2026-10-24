local Classic = require 'ale.std.Classic'
local AleColorUtil = require 'ale.util.AleColorUtil'

local AleLogs = Classic:extend()

AleLogs.__name = 'AleLogs'

function AleLogs:new()
    local ext = AleLogs.super.new(self)

    ext.init(self)

    return ext
end

function AleLogs:init()
    self.config = {
        error = {
            title = 'ERROR',
            color = 0xFFFF5555
        },
        warning = {
            title = 'WARNING',
            color = 0xFFFFA500
        },
        deprecated = {
            title = 'DEPRECATED',
            color = 0xFF8000
        },
        trace = {
            title = 'TRACE',
            color = 0xFFFFFFFF
        },
        missing_file = {
            title = 'MISSING FILE',
            color = 0xFFFF7F00
        },
        missing_folder = {
            title = 'MISSING FOLDER',
            color = 0xFFFF7F00
        }
    }
end

function AleLogs:print(msg, type)
    type = type or 'trace'

    local data = self.config[type]

    if not data then
        return nil
    end

    local res = AleColorUtil.toAnsi(data.title, data.color) ..
        AleColorUtil.toAnsi(' | ', AleColorUtil.gray) .. msg

    print(res)

    return res
end

return AleLogs
