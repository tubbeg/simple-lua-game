

local U = {}

function GetTimeEntity(entities)
    for i,v in ipairs(entities) do
        if v.time ~= nil then
            return v
        end
    end
    return nil
end

function U.TimeToUpdate(ents)
    local t = GetTimeEntity(ents)
    if t ~= nil then
        return t.time.ct == 0
    end
    return false
end

function U.EqualPos (x,y,a,b)
    local xEqual = x == a
    local yEqual = y == b
    return xEqual and yEqual
end

function U.IsCube(entity)
    return entity.cube ~= nil
end


function U.CubePosToWindowPos(cube)
    --local width, height = love.graphics.getDimensions()
    --local pxPerPosX, pxPerPosY = width/10, height/20
    local pxPerPosX, pxPerPosY = 64,64
    return pxPerPosX * cube.x, pxPerPosY * cube.y
end



return U