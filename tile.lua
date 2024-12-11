Tile = Object:extend()
Tile.BasePath = "images/tiles/"

function Tile:new(tile , variant , x , y)
    self.image = love.graphics.newImage(Tile.BasePath .. tile.."/"..variant..".png")
    self.x = x
    self.y = y
    self.tile = tile
    self.variant = variant
end

function Tile:draw()
    love.graphics.draw(self.image , self.x , self.y)
end