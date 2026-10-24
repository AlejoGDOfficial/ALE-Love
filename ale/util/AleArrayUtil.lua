local AleArrayUtil = {}

function AleArrayUtil.remove(array, obj, splice)
    for i, member in ipairs(array) do
        if member == obj then
            if splice then
                table.remove(array, i)
            else
                array[i] = nil
            end
        end
    end

    return obj
end

function AleArrayUtil.forEach(array, callback, skipNil)
    if array then
        for i = 1, #array do
            local obj = array[i]

            if callback and (obj ~= nil or not skipNil) then
                callback(obj, i)
            end
        end
    end
end

return AleArrayUtil
