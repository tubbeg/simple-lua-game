




function CubePosToWindowPos(cube)
    --local width, height = love.graphics.getDimensions()
    --local pxPerPosX, pxPerPosY = width/10, height/20
    local pxPerPosX, pxPerPosY = 64,64
    return pxPerPosX * cube.x, pxPerPosY * cube.y
end



return CubePosToWindowPos