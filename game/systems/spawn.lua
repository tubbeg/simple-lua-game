
local tiny = require("third-party/tiny")


local spawnCubes = tiny.processingSystem()
spawnCubes.filter = tiny.requireAll("cube")
spawnCubes.isForDrawing = false


function spawnCubes:preProcess(dt)
    local n = #self.entities
    if n == 0 then
        local entity = {
            cube = {x = 250, y = 0}
        }
        print("Adding entity")
        tiny.addEntity(self.world,entity)
    end
end

return spawnCubes