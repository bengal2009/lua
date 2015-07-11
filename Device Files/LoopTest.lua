for i=6,1,-1 
do print(i) 
gpio.mode(i,gpio.OUTPUT)
gpio.write(i,gpio.LOW)
-- tmr.delay(3000000)
end
