local tiny = require("third-party/tiny")
local spawnSystem = require("systems/spawn")
local dc = require("systems/drawCube")

-- simple is pretty much always better

local h = "hello"
print(h,h,h)
local lve = love


local result = {
    score = 0
}

local world = tiny.world()
local ds = tiny.requireAll("isForDrawing")
local nds = tiny.rejectAny("isForDrawing")

function lve.load()
    tiny.addEntity(world,result)
    tiny.addSystem(world, spawnSystem)
    tiny.addSystem(world, dc)
end

function lve.update(dt)
    world:update(dt, nds)
end

function lve.draw()
    local delta = lve.timer.getDelta()
    world:update(delta, ds)
    lve.graphics.print("Hello World!", 400, 300)
end