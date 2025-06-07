
local tiny = require("third-party/tiny")

local lve = love


local drawCube = tiny.processingSystem()
drawCube.filter = tiny.requireAll("cube")
drawCube.isForDrawing = true

function drawCube:process(e,dt)
    lve.graphics.rectangle("fill",e.cube.x, e.cube.y, 40,40)
end

return drawCube