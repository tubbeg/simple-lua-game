local tiny = require("third-party/tiny")

local lve = love

function GetTimeEntity(entities)
    for i,v in ipairs(entities) do
        if v.time ~= nil then
            return v
        end
    end
    return nil
end


--[[
function GetCubeEntities(ents)
    local ind = 1
    local coll = {}
    for i,v in ipairs(ents) do
        if v.cube ~= nil then
            coll[ind] = v
            ind = ind + 1
        end
    end
    return coll
end]]

function MoveEntities(ents)
end



local moveCube = tiny.system()
moveCube.filter = tiny.requireAny("cube", "time")
moveCube.isForDrawing = false

function moveCube:update(dt)
    local t = GetTimeEntity(self.entities)
    if t ~= nil then
        if t.time.ct == 0 then
            print("Time is 0")
            --MoveCubes(self.entities)
            for i, v in ipairs(self.entities) do
                if v.cube ~= nil then
                    print(v.cube.x, v.cube.y)
                    local a,b = v.cube.y,v.cube.x
                    v.cube.y = b
                    v.cube.x = a
                end
            end
        end
    end
end

return moveCube