local tiny = require("third-party/tiny")
local TimeToUpdate = require("getTime")
local lve = love

local inputSystem = tiny.system()
inputSystem.filter = tiny.requireAny("cube", "stop", "time")
inputSystem.isForDrawing = false

function MoveEntityX(e)
    if e.stop == nil then
        if lve.keyboard.isDown( "a" ) then
            if e.cube ~= nil then
                e.cube.x = e.cube.x - 1
            end
        elseif lve.keyboard.isDown( "d" ) then
            if e.cube ~= nil then
                e.cube.x = e.cube.x + 1
            end
        end
        if e.cube ~=nil then
            if e.cube.x > 10 then
                e.cube.x = 10
            elseif e.cube.x < 0 then
                e.cube.x = 0
            end
        end
    end
end

function inputSystem:update(dt)
    if TimeToUpdate(self.entities) then
        for i,v in ipairs(self.entities) do
            MoveEntityX(v)
        end
    end
end

return inputSystem