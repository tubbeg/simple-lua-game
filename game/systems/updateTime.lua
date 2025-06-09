local tiny = require("third-party/tiny")


local updateTime = tiny.processingSystem()
updateTime.filter = tiny.requireAll("time")
updateTime.isForDrawing = false

function updateTime:process(e,dt)
    e.time.ct = e.time.ct + dt
    if e.time.ct > 0.1 then
        e.time.secs = e.time.secs + 1
        e.time.ct = 0
    end
end

return updateTime