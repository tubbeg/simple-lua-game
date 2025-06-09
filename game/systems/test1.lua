
function EqualPos (x,y,a,b)
    local xEqual = x == a
    local yEqual = y == b
    return xEqual and yEqual
end

function PosEqualBelow(entityAbove, entityBelow)
    local modAbove = {x=entityAbove.x, y=entityAbove.y + 1}
    return EqualPos(modAbove, entityBelow)
end
