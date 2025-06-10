local tiny = require("third-party/tiny")
local U = require("utility")
local lve = love

local removeSystem = tiny.system()
removeSystem.filter = tiny.requireAll("cube")
removeSystem.isForDrawing = false


function GetNumberOfCubesOnY(index,entities)
    local nr = 0
    for i,v in ipairs(entities) do
        if v.cube.y == index then
            nr = nr + 1
        end
    end
    return nr
end

function CountNrOfCubes(entities)
    local nrs = {}
    local i = 0
    while i < 21 do
        nrs[i + 1] = GetNumberOfCubesOnY(i,entities)
        i = i + 1
    end
    return nrs
end

function RemoveEntities(index,w, entities)
    for i,v in ipairs(entities) do
        if v.cube.y == (index - 1) then
            tiny.removeEntity(w,v)
        end
    end
end

function removeSystem:update(dt)
    local nr = CountNrOfCubes(self.entities)
    for i,v in ipairs(nr) do
        if v >= 10 then
            RemoveEntities(i,self.world, self.entities)
        end
    end
end

return removeSystem