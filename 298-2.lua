IN1 = 1
IN2 = 2
ENA = 3
driver = require("l298")
driver.setup(ENA, IN1, IN2)
print("Power 10")
driver.on(ENA, IN1, IN2, 20) 
tmr.delay(3000000)
tmr.wdclr()
driver.on(ENA, IN2, IN1, 30) 
tmr.delay(3000000)
tmr.wdclr()
driver.neutral(ENA)
print("Netural")
tmr.delay(3000000)
driver.stop(ENA, IN1, IN2) 