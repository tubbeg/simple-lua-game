
local tiny = require("third-party/tiny")
local U = require("utility")
local lve = love

local drawCube = tiny.processingSystem()
drawCube.filter = tiny.requireAll("cube")
drawCube.isForDrawing = true

function drawCube:process(e,dt)
    local x,y = U.CubePosToWindowPos(e.cube)

    lve.graphics.draw(assets.cube,x, y)
end

return drawCube