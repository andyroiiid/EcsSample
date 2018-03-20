require "strict"

local tiny = require("tiny")
local render = tiny.processingSystem()

render.filter = tiny.requireAll(
    "position",
    "rotation",
    "sprite"
)

function render:process(e, dt)
    love.graphics.draw(
        assets.sprites[e.sprite],
        e.position.x, e.position.y,
        -e.rotation
    )
end

return render
