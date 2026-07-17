local Environment = {}

Environment.Results = {}
Environment.Passed = 0
Environment.Tested = 0

local function Test(Name, Func)
    Environment.Tested += 1

    local Success = pcall(Func)

    if Success then
        Environment.Passed += 1
        table.insert(Environment.Results, "✅ " .. Name)
    else
        table.insert(Environment.Results, "❌ " .. Name)
    end
end

Test("getgenv", function()
    assert(getgenv)
end)

Test("getgc", function()
    assert(getgc)
end)

Test("hookfunction", function()
    assert(hookfunction)
end)

Test("newcclosure", function()
    assert(newcclosure)
end)

Test("cloneref", function()
    assert(cloneref)
end)

Test("request", function()
    assert(request or http_request or (syn and syn.request))
end)

Test("writefile", function()
    assert(writefile)
end)

Test("readfile", function()
    assert(readfile)
end)

Test("fireclickdetector", function()
    assert(fireclickdetector)
end)

Test("fireproximityprompt", function()
    assert(fireproximityprompt)
end)

return Environment
