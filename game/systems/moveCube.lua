local tiny = require("third-party/tiny")
local U = require("utility")
local lve = love

-- 10x20



function CubeEntityPosEqualBelow(entityAbove, entityBelow)
    if U.IsCube(entityAbove) and U.IsCube(entityBelow) then
        local x,y = entityAbove.cube.x, entityAbove.cube.y + 1
        local a,b = entityBelow.cube.x, entityBelow.cube.y
        return U.EqualPos(x,y,a,b)
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


local moveCube = tiny.system()
moveCube.filter = tiny.requireAny("cube", "time", "stop")
moveCube.isForDrawing = false

function moveCube:update(dt)
    if U.TimeToUpdate(self.entities) then
        MoveEntities(self.entities)
    end
end

return moveCube