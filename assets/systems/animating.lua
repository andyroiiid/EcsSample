require "strict"

local tiny = require("tiny")
local animating = tiny.processingSystem()

animating.filter = tiny.requireAll(
    "position",
    "rotation",
    "rotating"
)

function animating:process(e, dt)
    e.position.x = 400 + e.rotating.radius*math.sin(e.rotation)
    e.position.y = 300 + e.rotating.radius*math.cos(e.rotation)
    e.rotation = e.rotation + e.rotating.speed * dt
end

return animating
