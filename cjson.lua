
        ----带数组的复杂数据-----
        local _jsonArray={}
        _jsonArray[1]=8
        _jsonArray[2]=9
        _jsonArray[3]=11
        _jsonArray[4]=14
        _jsonArray[5]=25

        local _arrayFlagKey={}
        _arrayFlagKey["array"]=_jsonArray

        local tab = {}
        tab["Himi"]="himigame.com"
        tab["testArray"]=_arrayFlagKey
        tab["age"]="23"

        --数据转json
        local cjson = require "cjson"
        local jsonData = cjson.encode(tab)

        print(jsonData)
        -- 打印结果： {"age":"23","testArray":{"array":[8,9,11,14,25]},"Himi":"himigame.com"}

        --json转数据
        local data = cjson.decode(jsonData)
        local a = data.age
        local b = data.testArray.array[2]
        local c = data.Himi

        print("a:"..a.."  b:"..b.."  c:"..c)
        -- 打印结果： a:23  b:9  c:himigame.com