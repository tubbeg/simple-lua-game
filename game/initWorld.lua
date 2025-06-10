local tiny = require("third-party/tiny")
local spawnSystem = require("systems/spawn")
local dc = require("systems/drawCube")
local mv = require("systems/moveCube")
local tm = require("systems/updateTime")
local sc = require("systems/stopCube")
local ins = require("systems/inputSystem")
local rs = require("systems/removeRow")
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

function AddCubesToBottomRow(w)
    local i = 0
    while i < 9 do
        tiny.addEntity(w,{cube = {x = i, y = 19}, stop = true})
        i = i + 1
    end
end


function L.AddSystems(w)
    AddCubesToBottomRow(w)
    tiny.addEntity(w,timeEntity)
    tiny.addSystem(w, spawnSystem)
    tiny.addSystem(w, mv)
    tiny.addSystem(w, dc)
    tiny.addSystem(w, tm)
    tiny.addSystem(w, sc)
    tiny.addSystem(w, ins)
    tiny.addSystem(w, rs)
end


return L