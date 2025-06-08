
local tiny = require("third-party/tiny")

local lve = love


local drawCube = tiny.processingSystem()
drawCube.filter = tiny.requireAll("cube")
drawCube.isForDrawing = true

function drawCube:process(e,dt)
    lve.graphics.draw(assets.cube,e.cube.x, e.cube.y)
end

return drawCube