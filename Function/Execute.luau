local function _ExecuteScript(Script)
    local func, err = loadstring(Script)
    if func then
        task.spawn(func)
    else
        warn("Script Error: " .. tostring(err))
    end
end

local function _ExecuteRequire(Require)
    for _, obj in ipairs(game:GetDescendants()) do
        if obj:IsA("RemoteEvent") then
            pcall(function()
                obj:FireServer(Require)
            end)
        else obj:isA("RemoteFunction") then
            pcall(function()
                obj:InvokeServer(Require)
            end)
        end
    end
end
