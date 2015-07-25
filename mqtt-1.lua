m_dis={}
function dispatch(m,t,pl)
 if pl~=nil and m_dis[t] then
  m_dis[t](m,pl)
 end
end
function topic1func(m,pl)
 print("get1: "..pl)
end
m_dis["topic1"]=topic1func

m=mqtt.Client()
m:on("connect",function(m) 
 print("connection "..node.heap()) 
 m:subscribe("topic1",0,function(m) print("sub done") end)
 m:publish("topic1","hello",0,0)
 end )
m:on("offline", function(conn)
    print("disconnect to broker...")
    print(node.heap())
end)
m:on("message",dispatch )
-- Lua: mqtt:connect( host, port, secure, auto_reconnect, function(client) )
m:connect("192.168.0.1",1883,0,1)
tmr.alarm(0,10000,1,function() local pl = "time: "..tmr.time() 
 m:publish("topic1",pl,0,0)
 end)
