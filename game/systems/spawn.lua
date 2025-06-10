
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

function AddTriangle(origin)
    local form = {}
    return form
end

function AddRandomCubeForm(origin)
    --math.randomseed(os.time())
    --print(math.random(), "random")
    local form = AddTriangle(origin)
    return form
end


function spawnCubes:update(dt)
    local n = GetNumberOfMovingCubes(self.entities)
    if n == 0 then
        local ent3 = {cube = {x = 4, y = 0}}
        local ent2 = {cube = {x = 3, y = 0}}
        local ent1 =  {cube = {x = 2, y = 0}}
        tiny.addEntity(self.world, ent1)
        tiny.addEntity(self.world, ent2)
        tiny.addEntity(self.world, ent3)   
    end
end

return spawnCubes