local tiny = require("third-party/tiny")
local spawnSystem = require("systems/spawn")
local dc = require("systems/drawCube")
local mv = require("systems/moveCube")
local tm = require("systems/updateTime")
local sc = require("systems/stopCube")
local lve = love

local L = {}

function L.AddAssets()
    local c = lve.graphics.newImage("cube.png")
    local a = {cube = c} 
    return a
end

local timeEntity = {
    time = {ct = 0, secs = 0}
}

function L.AddSystems(w)
    tiny.addEntity(w,timeEntity)
    tiny.addSystem(w, spawnSystem)
    tiny.addSystem(w, mv)
    tiny.addSystem(w, dc)
    tiny.addSystem(w, tm)
    tiny.addSystem(w, sc)
end


return L