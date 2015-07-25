m_dis={}
pin=8
local cjson = require "cjson"
function dispatch(m,t,pl)
 if pl~=nil and m_dis[t] then
  m_dis[t](m,pl)
 end
end
function topic1func(m,pl)
 print("get1: "..pl)
pl1='{"led":"1"}'
local data = cjson.decode(pl1)
print(pl)
print(pl1)
print(data.led) 
end
m_dis["topic1"]=topic1func

m=mqtt.Client()
m:on("connect",function(m) 
 print("connection "..node.heap()) 
 m:subscribe("topic1",0,function(m) print("sub done") end)

 end )
m:on("offline", function(conn)
    print("disconnect to broker...")
   end)
m:on("message",dispatch )
-- Lua: mqtt:connect( host, port, secure, auto_reconnect, function(client) )
m:connect("192.168.0.1",1883,0,1)

