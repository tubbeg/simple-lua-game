local tiny = require("third-party/tiny")
local spawnSystem = require("systems/spawn")
local L = require("initWorld")
local lve = love

-- simple is pretty much always better

local h = "hello"
print(h,h,h)

local world = tiny.world()
local filterDrawing = tiny.requireAll("isForDrawing")
local filterNonDraw = tiny.rejectAny("isForDrawing")


function lve.load()
    -- i do not like using globals at all
    -- but I'll make an exception for this
    assets = L.AddAssets()
    L.AddSystems(world)
end


function lve.update(dt)
    world:update(dt, filterNonDraw)
end

function lve.draw()
    local delta = lve.timer.getDelta()
    world:update(delta, filterDrawing)
end