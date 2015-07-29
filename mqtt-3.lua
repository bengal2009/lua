m_dis={}
pin=8
local cjson = require "cjson"
function dispatch(m,t,pl)
 if pl~=nil and m_dis[t] then
  m_dis[t](m,pl)
 end
end
function topic1func(m,pl)
 local data = cjson.decode(pl)
--print(pl)
--print(data.led) 
if(data.song=="1") then 
dofile("bp.lua")
end
if(data.led=="1") then 
gpio.mode(pin,gpio.OUTPUT)
gpio.write(pin,gpio.HIGH)
else
gpio.write(pin,gpio.LOW)
end
if(data.blink=="1") then 
print("Blink")
dofile("blink.lua")
else
tmr.stop(0)
end
if(data.mqtt=="0") then 
m:unsubscribe("topic1")
m:destroy()
end
end



m_dis["topic1"]=topic1func

m=mqtt.Client()
m:on("connect",function(m) 
 --print("connection "..node.heap()) 
 m:subscribe("topic1",0,function(m) print("sub done") end)
 --m:publish("topic1","hello",0,0)
 end )
m:on("offline", function(conn)
    print("disconnect to broker...")
    --print(node.heap())
end)
m:on("message",dispatch )
-- Lua: mqtt:connect( host, port, secure, auto_reconnect, function(client) )
m:connect("192.168.0.1",1883,0,1)
--tmr.alarm(0,10000,1,function() local pl = "time: "..tmr.time() 
 --m:publish("topic1",pl,0,0)
 --end)
