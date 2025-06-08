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

function MoveEntities(ents)
    for i, v in ipairs(ents) do
        if not v.stop then
            if v.cube ~= nil then
                v.cube.y = v.cube.y + 40
            end
        end
    end
end

local moveCube = tiny.system()
moveCube.filter = tiny.requireAny("cube", "time", "stop")
moveCube.isForDrawing = false

function moveCube:update(dt)
    local t = GetTimeEntity(self.entities)
    if t ~= nil then
        if t.time.ct == 0 then
            MoveEntities(self.entities)
        end
    end
end

return moveCube