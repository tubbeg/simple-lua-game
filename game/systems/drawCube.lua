
local tiny = require("third-party/tiny")
local topos = require("PosToWindowPos")
local lve = love

local drawCube = tiny.processingSystem()
drawCube.filter = tiny.requireAll("cube")
drawCube.isForDrawing = true

function drawCube:process(e,dt)
    local x,y = topos(e.cube)

    lve.graphics.draw(assets.cube,x, y)
end

return drawCube