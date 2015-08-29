IN1 = 1
IN2 = 2
ENA = 3
driver = require("l298")
driver.setup(ENA, IN1, IN2)
driver.on(ENA, IN2, IN1, 70) 
tmr.delay(1000000)
print("Power 10")
for i=1,14,1 do 
driver.on(ENA, IN1, IN2, 40) 
tmr.delay(20000)
driver.stop(ENA, IN1, IN2) 
tmr.delay(1000000)
tmr.wdclr()
end
--tmr.delay(1000000)
--driver.on(ENA, IN1, IN2, 70) 
tmr.delay(500000)
--driver.on(ENA, IN2, IN1, 30) 
--tmr.delay(200000)
--driver.stop(ENA, IN1, IN2) 
--tmr.wdclr()
for i=1,20,1 do 
driver.on(ENA, IN2, IN1, 40) 
tmr.delay(20000)
driver.stop(ENA, IN1, IN2) 
tmr.delay(1000000)
tmr.wdclr()
end
driver.on(ENA, IN2, IN1, 70) 
tmr.delay(60000)
driver.stop(ENA, IN1, IN2) 


