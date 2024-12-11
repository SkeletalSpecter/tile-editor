Utils = {}

local base_tile_path = "images/tiles/"

function Utils.RemoveFromList(arr , target)
    for index , value in ipairs(arr) do
        if value == target then
            table.remove(arr , index)
        end
    end
end

function Utils.IsInList(arr , value)
    for _ , v in ipairs(arr) do
        if v == value then
            return true
        end
    end
    return false
end

function Utils.lerp(min , max , value)
    return min + (max - min) * value
end

function Utils.loadImages(path)
    if love.filesystem.getInfo(base_tile_path..path) == nil then
        error("Invalid Image Path , Check Image loading")
    end
    local images = {}
    local files = love.filesystem.getDirectoryItems(base_tile_path..path)
    table.sort(files)

    for _, file in ipairs(files) do
       table.insert(images , love.graphics.newImage(base_tile_path..path.."/"..file))
    end
    return images
end

function Utils.countImages(path)
    local count = 0

    if love.filesystem.getInfo(base_tile_path..path) == nil then
        error("Invalid Image Path , Check Image loading")
    end
    local files = love.filesystem.getDirectoryItems(base_tile_path..path)

    for _, file in ipairs(files) do
        count = count + 1
    end
    return count
end

return Utils