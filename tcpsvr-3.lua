-- Your Wifi connection data
local SSID = "YOUR WIFI SSID"
local SSID_PASSWORD = "YOUR SSID PASSPHRASE"

-- General setup
local pinLight = 4 -- this is GPIO4
gpio.mode(pinLight,gpio.OUTPUT)
gpio.write(pinLight,gpio.HIGH)


local function connect (conn, data)
   local query_data

   conn:on ("receive",
    function (cn, req_data)
   params = get_http_req (req_data)
         cn:send("HTTP/1.1 200/OK\r\nServer: NodeLuau\r\nContent-Type: text/html\r\n\r\n")
   cn:send ("<h1>ESP8266 Servo &amp; Light Server</h1>\r\n")
if (params["svr"] ~= nil) then
--print(params["svr"])
    if ("0" == params["svr"]) then
cn:send ("<h1>ESP8266 Servo &amp; Light Server Close</h1>\r\n")
print("server close")
svr:close()

end
end
   if (params["light"] ~= nil) then
          if ("0" == params["light"]) then
           gpio.write(pinLight, gpio.LOW)
          else
   gpio.write(pinLight, gpio.HIGH)          
          end
         end
         
         --if (params["s0"] ~= nil) then
         -- servo.value = tonumber(params["s0"]);
         --end

   -- Close the connection for the request
         cn:close ( )
      end)
end

-- Build and return a table of the http request data
function get_http_req (instr)
 local t = {}
 local str = string.sub(instr, 0, 200)
 local v = string.gsub(split(str, ' ')[2], '+', ' ')
 parts = split(v, '?')
 local params = {}
 if (table.maxn(parts) > 1) then
  for idx,part in ipairs(split(parts[2], '&'))  do
   parmPart = split(part, '=')
   params[parmPart[1]] = parmPart[2]
  end
 end
 return params
end

-- Source: http://lua-users.org/wiki/MakingLuaLikePhp
-- Credit: http://richard.warburton.it/
function split(str, splitOn)
    if (splitOn=='') then return false end
    local pos,arr = 0,{}
    for st,sp in function() return string.find(str,splitOn,pos,true) end do
        table.insert(arr,string.sub(str,pos,st-1))
        pos = sp + 1
    end
    table.insert(arr,string.sub(str,pos))
    return arr
end

-- Configure the ESP as a station (client)
--wifi.setmode (wifi.STATION)
--wifi.sta.config (SSID, SSID_PASSWORD)
--wifi.sta.autoconnect (1)

-- Hang out until we get a wifi connection before the httpd server is started.
--tmr.alarm (1, 800, 1, function ( )
--  if wifi.sta.getip ( ) == nil then
 --    print ("Waiting for Wifi connection")
 -- else
 --    tmr.stop (1)
 --    print ("Config done, IP is " .. wifi.sta.getip ( ))
 -- end
--end)

-- Create the httpd server
svr = net.createServer (net.TCP, 30)

-- Server listening on port 80, call connect function if a request is received
svr:listen (80, connect)
