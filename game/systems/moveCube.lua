local tiny = require("third-party/tiny")
local lve = love

-- 10x20

function GetTimeEntity(entities)
    for i,v in ipairs(entities) do
        if v.time ~= nil then
            return v
        end
    end
    return nil
end

function EqualPos (x,y,a,b)
    local xEqual = x == a
    local yEqual = y == b
    return xEqual and yEqual
end

function IsCube(entity)
    return entity.cube ~= nil
end

function CubeEntityPosEqualBelow(entityAbove, entityBelow)
    if IsCube(entityAbove) and IsCube(entityBelow) then
        local x,y = entityAbove.cube.x, entityAbove.cube.y + 1
        local a,b = entityBelow.cube.x, entityBelow.cube.y
        return EqualPos(x,y,a,b)
    end
    return false
end

function EntityBelow(cube, entities)
    -- entitites is every entity here
    for i,v in ipairs(entities) do
        if CubeEntityPosEqualBelow(cube, v) then
            return true
        end
    end
    return false
end

function IncPos(cubeEntity, entities)
    if not EntityBelow(cubeEntity, entities) then
        local y = cubeEntity.cube.y + 1
        cubeEntity.cube.y = y
        if y > 20 then
            cubeEntity.cube.y = 0
        end
    else
        cubeEntity.stop = true
    end
end

function MoveEntities(ents)
    for i, v in ipairs(ents) do
        if v.stop ==nil then
            if v.cube ~= nil then
                IncPos(v, ents)
            end
        end
    end
end

function TimeToUpdate(ents)
    local t = GetTimeEntity(ents)
    if t ~= nil then
        return t.time.ct == 0
    end
end

local moveCube = tiny.system()
moveCube.filter = tiny.requireAny("cube", "time", "stop")
moveCube.isForDrawing = false

function moveCube:update(dt)
    if TimeToUpdate(self.entities) then
        MoveEntities(self.entities)
    end
end

return moveCube