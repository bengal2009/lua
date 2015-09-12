IN1 = 4
IN2 = 5
ENB = 6
driver = require("l298")
driver.setup(ENB, IN1, IN2)
print("Power 10")
driver.on(ENB, IN1, IN2, 20) 
tmr.delay(3000000)
tmr.wdclr()
driver.on(ENB, IN2, IN1, 30) 
tmr.delay(3000000)
tmr.wdclr()
driver.neutral(ENB)
print("Netural")
tmr.delay(3000000)
driver.stop(ENA, IN1, IN2) 