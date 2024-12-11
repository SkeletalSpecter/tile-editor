names = {"ass" , "jack"}

function RemoveSpecific(arr , target)
    for index , value in ipairs(arr) do
        if value == target then
            table.remove(arr , index)
        end
    end
end
