Debug = Object:extend()

function Debug:new(settings)
    self.x = settings.x or 0
    self.y = settings.y or 0
    self.bind = settings.bind or "7"
    self.debug_size = settings.size or 5
    self.active = true
    self.debugs = {}
end

function Debug:print(output)
    if self.active == true then
        if #self.debugs > 0 then
            if #self.debugs >= self.debug_size then
                table.remove(self.debugs , 1)
            end
        end
        table.insert(self.debugs , output)
    end
end


function Debug:keypressed(key)
    if key == self.bind then
        self.active = not self.active
    end
end

function Debug:draw()
    -- self.active == true and 
    if #self.debugs > 0 then
        for i, v in ipairs(self.debugs) do
            local text = i .. " : " .. tostring(v)
            love.graphics.print(text , self.x , self.y + (15 * i))
        end
    end
end
