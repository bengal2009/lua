pin =4
for led=0,5,1 do
print("LED:"..led)
gpio.mode(led,gpio.OUTPUT)
gpio.write(led,gpio.HIGH)
--gpio.mode(pin,gpio.INPUT)
--print(gpio.read(pin))
tmr.delay(1000000)
gpio.write(led,gpio.LOW)
end



