led=2
gpio.mode(led,gpio.OUTPUT)

srv=net.createServer(net.TCP) srv:listen(80,function(conn)
    conn:on("receive",function(conn,payload) print(payload)
    conn:send("HTTP/1.1 200 OK\n\n")
    conn:send("<html><body>")
    conn:send("<h1>Benny</h1><BR>")
 if string.find(payload,"led=0") then 
gpio.write(led,gpio.LOW)
else
gpio.write(led,gpio.HIGH)
 end
    conn:send("</html></body>")
    conn:on("sent",function(conn) conn:close() end)
if string.find(payload,"svr=0") then srv:close() end
if string.find(payload,"reboot=1") then node.restart() end
  end)
end)
