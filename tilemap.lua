Tilemap = Object:extend()
require "tile"

function Tilemap:new(tilesize)
    self.tilesize = tilesize or 16
    self.tiles = {}

    for i = #self.tiles + 1, 20 do
        local coord_x , coord_y = i * self.tilesize , 320
        self.tiles[tostring(coord_x)..":"..tostring(coord_y)] = Tile("grass" , 1 , coord_x , coord_y)
    end

    for i = #self.tiles + 1, 20 do
        local coord_x , coord_y = 320 , i * self.tilesize
        self.tiles[tostring(coord_x)..":"..tostring(coord_y)] = Tile("stone" , 1 , coord_x , coord_y)
    end

end


function Tilemap:draw()
    for _, value in pairs(self.tiles) do
        value:draw()
    end
end