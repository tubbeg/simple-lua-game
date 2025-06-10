local tiny = require("third-party/tiny")
local spawnSystem = require("systems/spawn")
local L = require("initWorld")
local lve = love

-- simple is pretty much always better

local hello = "hello"
print(hello,hello,hello)

local world = tiny.world()
local filterDrawing = tiny.requireAll("isForDrawing")
local filterNonDraw = tiny.rejectAny("isForDrawing")

function lve.load()
    
    lve.window.setMode(400, 800, {resizable = true})

    --lve.window.setMode(0, 0, {resizable = true})  --0,0 is the entire available window
    -- i do not like using globals at all
    -- but I'll make an exception for this
    assets = L.AddAssets()
    L.AddSystems(world)
end

--tiny ecs is a little bit different from other ECS-systems since
--you can filter out systems when updating the world
function lve.update(dt)
    --updates the world only using the non-drawing systems
    world:update(dt, filterNonDraw)
end

function lve.draw()

    lve.graphics.scale(0.5, 0.5) 
    local delta = lve.timer.getDelta()
    --updates the world only using the drawing systems
    world:update(delta, filterDrawing)
end

function lve.resize(w, h)
-- get real dimensions
  WindowWidth = w
  WindowHeight = h
end




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