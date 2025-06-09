
local tiny = require("third-party/tiny")



local spawnCubes = tiny.system()
spawnCubes.filter = tiny.requireAny("cube", "stop")
spawnCubes.isForDrawing = false

function GetNumberOfMovingCubes(ents)
    local nr = #ents
    for i,v in ipairs(ents) do
        if v.stop ~= nil then
            if v.stop then
                nr = nr - 1
            end
        end
    end
    return nr
end


function spawnCubes:update(dt)
    local n = GetNumberOfMovingCubes(self.entities)
    if n == 0 then
        local entity = {
            cube = {x = 3, y = 0}
        }
        tiny.addEntity(self.world,entity)
    end
end

return spawnCubes