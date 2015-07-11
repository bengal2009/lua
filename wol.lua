wolcon=net.createConnection(net.UDP, 0) --Not tested with TCP. UDP works fine
wolcon:connect(9,"255.255.255.255") --Magic packet is broadcast. Can also limit to broadcast address of your own network

mac1=string.char(0xe0,0x69,0x95,0xab,0x36,0xe7) -- Insert MAC address here of target machine
for i=1,4 do
 mac1 = mac1..mac1  --Magic packet requires 16x target PC MAC as payload
end

mac2 = string.char(0xff,0xff,0xff,0xff,0xff,0xff)..mac1 --Magic packet needs broadcast MAC in front
wolcon:send(mac2)   --Send magic packet
print("Wake-On-Lan packet sent")

wolcon:close()
collectgarbage(); 