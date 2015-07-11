if(t==nil) then
t=12
end
srv=net.createServer(net.TCP) srv:listen(80,function(conn)
    conn:on("receive",function(conn,payload) print(payload)
    conn:send("HTTP/1.1 200 OK\n\n")
    conn:send("<html><body>")
    conn:send("<h1>Erni's ESP8266</h1><BR>")
    conn:send("TEMP : " .. t .. "<BR>")
    conn:send("NODE.HEAP : " .. node.heap() .. "<BR>")
    conn:send("TMR.NOW : " .. tmr.now() .. "<BR>")
    conn:send("</html></body>")
    conn:on("sent",function(conn) conn:close() end)
  end)
end)
