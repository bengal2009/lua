IN1 = 1
IN2 = 2
ENA = 3
driver = require("l298")
BROKER_IP = "192.168.0.10"
BROKER_PORT = 1883
BROKER_USER = ""
BROKER_PASS = ""
BROKER_CLIENT = "car-" .. wifi.sta.getmac()
BROKER_TOPIC = "/hackafe-car"

driver.setup(ENA, IN1, IN2)
driver.on(ENA, IN2, IN1, 70) 
tmr.delay(1000000)
print("Power 10")
--for i=1,14,1 do 

for i=1,3,1 do
driver.on(ENA, IN1, IN2, 20+i*5) 
--driver.stop(ENA, IN1, IN2) 
tmr.delay(500000)
tmr.wdclr()
end
driver.stop(ENA, IN1, IN2) 
tmr.delay(1000000)
driver.on(ENA, IN1, IN2, 70) 
tmr.delay(2000000)


for i=1,10,1 do
driver.on(ENA, IN2, IN1, 20+i*5) 
--driver.stop(ENA, IN1, IN2) 
tmr.delay(500000)
tmr.wdclr()
end
driver.stop(ENA, IN1, IN2) 

--end
