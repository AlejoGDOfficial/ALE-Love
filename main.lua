if love.system.getOS() == 'Windows' then
    local ffi = require('ffi')

    ffi.cdef 'int SetProcessDPIAware();'

    ffi.load('user32').SetProcessDPIAware()
end
