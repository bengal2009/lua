local tab ={}
        tab["Himi"] = "himigame.com"
        tab["Test"] = "Abcd"
        --数据转json
        local cjson = require "cjson"
        local jsonData1 = cjson.encode(tab)

        print(jsonData1) 

local jsonData='{"Himi":"imigame.com","Test":"Abcd"}'
local data = cjson.decode(jsonData)
print(jsonData)
print(data.Himi) 
print(data.Test) 
