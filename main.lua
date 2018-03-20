require "strict"

assets = require('cargo').init('assets')
world = require("tiny").world()

function treeLoad(world, root)
    world:add(root)
    for _,child in ipairs(root) do
        treeLoad(world, child)
    end
end

function love.load(arg)
    treeLoad(world, assets.scenes.level)
    world:add(assets.systems.animating)
    world:add(assets.systems.render)
end

function love.draw()
    love.window.setTitle("Entity-component-system Sample (FPS = " .. love.timer.getFPS() .. ")")
    world:update(love.timer.getDelta())
end
