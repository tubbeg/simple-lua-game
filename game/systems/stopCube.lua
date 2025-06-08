
local tiny = require("third-party/tiny")
local lve = love


local stopCube = tiny.processingSystem()
stopCube.filter = tiny.requireAll("cube")
stopCube.isForDrawing = false

function stopCube:process(e,dt)
    local y = e.cube.y
    if y > 300 then
        e.stop = true
    end
end

return stopCube