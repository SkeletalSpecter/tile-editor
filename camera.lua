Camera = Object:extend()

function Camera:new(default_zoom)
    self.x = 0
    self.y = 0
    self.speed = 200
    self.zoom = default_zoom or 1
    self.target_zoom = self.zoom
end

function Camera:update(dt)
    if love.keyboard.isDown("d") then
        self.x = self.x - self.speed * dt
    end 

    if love.keyboard.isDown("a") then
        self.x = self.x + self.speed * dt
    end 

    if love.keyboard.isDown("s") then
        self.y = self.y - self.speed * dt
    end

    if love.keyboard.isDown("w") then
        self.y = self.y + self.speed * dt
    end

    self.zoom = Utils.lerp(self.zoom , self.target_zoom , dt * 5)
end

function Camera:keypressed(key)
    if key == "kp+" or key == "=" then
        self.target_zoom = self.target_zoom + 0.5   
    end
    
    if key == "kp-" or key == "-" then
        self.target_zoom = self.target_zoom - 0.5
    end
end