IN1 = 1
IN2 = 2
ENA = 3
IN3 = 4
IN4 = 5
ENB = 6
driver = require("l298")
BROKER_IP = "192.168.0.129"
BROKER_PORT = 1883
BROKER_USER = ""
BROKER_PASS = ""
BROKER_CLIENT = "car-" .. wifi.sta.getmac()
BROKER_TOPIC = "/hackafe-car"

driver = require("l298")
driver.setup(ENA, IN1, IN2)
driver.setup(ENB,IN3, IN4)
m = mqtt.Client(BROKER_CLIENT, 120, BROKER_USER, BROKER_PASS)
m:on("connect", function(con) print ("[mqtt] connected") end)
m:on("offline", function(con) print ("[mqtt] offline") driver.stop(ENA, IN1, IN2)  end)

m:on("message", function(conn, topic, data)
  print("[mqtt] " .. topic .. ":" )
  if data ~= nil then
    print("[mqtt] " .. data)
    local cmd = string.sub(data, 1, 1)
    local power = tonumber(string.sub(data, 2))
    print(string.sub(data, 2))
    if cmd == "l" then 
driver.on(ENA, IN1, IN2, 40) 
tmr.delay(20000)
driver.stop(ENA, IN1, IN2) 
    elseif cmd == "r" then 
driver.on(ENA, IN2, IN1, 40) 
tmr.delay(20000)
driver.stop(ENA, IN1, IN2) 
    elseif cmd == "c" then driver.neutral(ENA) 
    elseif cmd == "f" then 
driver.on(ENB, IN3, IN4, power) 
tmr.delay(200000)
driver.stop(ENA, IN3, IN4) 
    elseif cmd == "b" then 
driver.on(ENB, IN4, IN3, power) 
tmr.delay(200000)
driver.stop(ENA, IN3, IN4) 
    elseif cmd == "s" then driver.stop(ENA, IN1, IN2) 
    elseif cmd == "n" then driver.neutral(ENA)
    end
  end
end)

m:connect(BROKER_IP, BROKER_PORT, 0, function(conn)
  print("[mqtt] connected")

  m:subscribe(BROKER_TOPIC, 0, function(conn)
    print("[mqtt] subscribe success")

    --m:publish(BROKER_TOPIC,"Car Driver is online!",0,0, function(conn) print("[mqtt] sent") end)
  end)
end)