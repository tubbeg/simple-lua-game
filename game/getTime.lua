

function GetTimeEntity(entities)
    for i,v in ipairs(entities) do
        if v.time ~= nil then
            return v
        end
    end
    return nil
end


function TimeToUpdate(ents)
    local t = GetTimeEntity(ents)
    if t ~= nil then
        return t.time.ct == 0
    end
    return false
end

return TimeToUpdate