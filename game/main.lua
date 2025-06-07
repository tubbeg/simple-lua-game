
local l = love

local h = "hello"
print(h,h,h)





function l.draw()
    l.graphics.print("Hello World!", 400, 300)
end