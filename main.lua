Object = require "libs.classic"

require "libs.console"
require "tilemap"
require "camera"
require "cusor"

Utils = require "libs.utils"
Terminal = Debug({size = 10})

love.graphics.setDefaultFilter("nearest", "nearest")

Tilesize = 16
MainTilemap = Tilemap(Tilesize)
local cam = Camera(1)
local cusor

-- Assets = {
--     ["decor"] = Utils.loadImages("decor"),
--     ["grass"] = Utils.loadImages("grass"),
--     ["large_decor"] = Utils.loadImages("large_decor"),
--     ["spawners"] = Utils.loadImages("spawners"),
--     ["stone"] = Utils.loadImages("stone")
-- }




function love.load()
    cusor = Cusor()
end

function love.update(dt)
    Terminal:print(dt)
    cam:update(dt)
    cusor:update(dt , cam)
end

function love.draw()
    love.graphics.push()
        love.graphics.scale(cam.zoom)
        love.graphics.translate(cam.x , cam.y)
        MainTilemap:draw()
        cusor:draw()
    love.graphics.pop()
    
    Terminal:draw()
end

function love.keypressed(key)
   cam:keypressed(key) 
end

function love.mousepressed(x, y, button)

end

function love.wheelmoved(x , y)
    cusor:wheelScroll(x , y)
end
