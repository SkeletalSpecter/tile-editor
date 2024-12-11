Cusor = Object:extend()

local shifting = false


function Cusor:new()
    self.tilesize = Tilesize
    self.tileCategory = {"decor" , "large_decor" , "grass" , "stone" , "spawners"}

    self.categorySize = {
        ["decor"] = Utils.countImages("decor"),
        ["large_decor"] = Utils.countImages("large_decor"),
        ["grass"] = Utils.countImages("grass"),
        ["stone"] = Utils.countImages("stone"),
        ["spawners"] = Utils.countImages("spawners")
    }

    self.categoryIndex = 1
    self.tileVariant = 0
    self.target_tile = love.graphics.newImage(Tile.BasePath .. self.tileCategory[self.categoryIndex].."/"..self.tileVariant..".png")
    self.grid_x = 16
    self.grid_y = 16
end

function Cusor:update(dt , camera)
    if love.keyboard.isDown("lshift") then
        shifting = true
    else
        shifting = false
    end

    if love.mouse.isDown(1) then
        self:addTile()
    end

    if love.mouse.isDown(2) then
        self:removeTile()
    end

    local mouse_x , mouse_y = love.mouse.getPosition()
    local world_x = (mouse_x - camera.x * camera.zoom) / camera.zoom
    local world_y = (mouse_y - camera.y * camera.zoom) / camera.zoom
    self.grid_x = math.floor(world_x / self.tilesize) * self.tilesize
    self.grid_y = math.floor(world_y / self.tilesize) * self.tilesize
end

function Cusor:addTile()
    local coord = tostring(self.grid_x)..":"..tostring(self.grid_y)
    MainTilemap.tiles[coord] = Tile(self.tileCategory[self.categoryIndex] , self.tileVariant , self.grid_x , self.grid_y)
end

function Cusor:removeTile()
    local coord = tostring(self.grid_x)..":"..tostring(self.grid_y)
    MainTilemap.tiles[coord] = nil
end

function Cusor:draw()
    love.graphics.draw(self.target_tile , self.grid_x , self.grid_y)
end

function Cusor:wheelScroll(x , y)
    self.tileVariant = self.tileVariant + y
    if self.tileVariant >= self.categorySize[self.tileCategory[self.categoryIndex]]  then
        self.tileVariant = 0
    end

    if self.tileVariant < 0 then
        self.tileVariant = self.categorySize[self.tileCategory[self.categoryIndex]]-1
    end

    if shifting == true then
        self.tileVariant = 0
        self.categoryIndex = self.categoryIndex + y

        if self.categoryIndex > #self.tileCategory  then
            self.categoryIndex = 1
        end
    
        if self.categoryIndex  < 1 then
            self.categoryIndex = #self.tileCategory
        end
    end
    self.target_tile = love.graphics.newImage(Tile.BasePath .. self.tileCategory[self.categoryIndex].."/"..self.tileVariant..".png")
end