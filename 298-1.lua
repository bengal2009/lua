IN1 = 1
IN2 = 2
ENA = 3
gpio.mode(ENA, gpio.OUTPUT)
gpio.mode(IN1, gpio.OUTPUT)
gpio.mode(IN2, gpio.OUTPUT)
gpio.write(ENA, gpio.LOW)
print("Left Start!")
gpio.write(IN1, gpio.HIGH)
gpio.write(IN2, gpio.LOW)
tmr.delay(1000000)
tmr.wdclr()
print("Done-1!")
gpio.write(IN1, gpio.LOW)
tmr.delay(1000)
gpio.write(IN2, gpio.HIGH)
tmr.delay(1000000)
tmr.wdclr()
print("Done-2!")
gpio.write(IN1, gpio.LOW)
tmr.delay(10000)
gpio.write(IN2, gpio.LOW)

