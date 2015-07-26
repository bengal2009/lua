speakerPin = 4;  
 gpio.mode(speakerPin,gpio.OUTPUT)  
 
 t={}  
 t["1"]=261  
 t["2"]= 294  
 t["3"]= 329  
 t["4"]= 349  
 t["5"]= 392
 t["5S"]= 415  
 t["6"]= 440  
 t["6S"]= 455  
 t["7"]= 493  
 t["1H"]= 523  
 t["1SH"]= 554  
 t["2H"]= 587  
 t["2SH"]= 622  
 t["3H"]= 659  
 t["4H"]= 698  
 t["4SH"]= 740  
 t["5H"]= 784  
 t["5SH"]= 830  
 t["6H"]= 880  
 
 function beep(pin, tone, duration)  
 local freq = t[tone]  
 --print ("tone:" .. tone)  
 pwm.setup(pin, freq, 512)  
 pwm.start(pin)  
 -- delay in uSeconds  
 tmr.delay(duration * 1000)  
 pwm.stop(pin)  
 --20ms pause  
 tmr.wdclr()  
 tmr.delay(20000)  
 end  
   beep(speakerPin, "3",250)  
   beep(speakerPin, "4", 250)  
   beep(speakerPin, "5", 250)  
   beep(speakerPin, "3H", 250)  
   beep(speakerPin, "1H", 600)  

   beep(speakerPin, "2H", 250)  
   beep(speakerPin, "1H", 250)  
beep(speakerPin, "1H", 250) 
beep(speakerPin, "7", 250)  
   beep(speakerPin, "7", 600)  
 
   beep(speakerPin, "2", 250)  
   beep(speakerPin, "3", 250)  
beep(speakerPin, "4", 250) 
beep(speakerPin, "2H", 250)  
   beep(speakerPin, "7", 600)  

   beep(speakerPin, "1H", 250)  
   beep(speakerPin, "7", 250)  
beep(speakerPin, "6", 250) 
beep(speakerPin, "5", 250)  
   beep(speakerPin, "5", 600)  

 beep(speakerPin, "3", 250)  
   beep(speakerPin, "4", 250)  
beep(speakerPin, "5", 250) 
beep(speakerPin, "1H", 250)  
  beep(speakerPin, "2H", 250)  
   beep(speakerPin, "3H", 600)  
tmr.wdclr()  
 tmr.delay(20000)
 beep(speakerPin, "2H", 250)  
   beep(speakerPin, "1H", 250)  
beep(speakerPin, "6", 250) 
beep(speakerPin, "2H", 250)  
 beep(speakerPin, "3H", 250) 
beep(speakerPin, "4H", 600)

 beep(speakerPin, "3H", 250)  
   beep(speakerPin, "2H", 250)  
beep(speakerPin, "5", 250) 
beep(speakerPin, "4H", 250)  
 beep(speakerPin, "3H", 250) 
beep(speakerPin, "2H", 250)
beep(speakerPin, "1H", 1000)
tmr.wdclr()  
 tmr.delay(40000)  
beep(speakerPin, "1H", 250)  
   beep(speakerPin, "1H", 250)  
beep(speakerPin, "3H", 250) 
beep(speakerPin, "1H", 250)  
 beep(speakerPin, "2H", 250) 
beep(speakerPin, "2H", 250)
beep(speakerPin, "2H", 600)

beep(speakerPin, "2H", 250)  
   beep(speakerPin, "2H", 250)  
beep(speakerPin, "4H", 250) 
beep(speakerPin, "2H", 250)  
 beep(speakerPin, "3H", 250) 
beep(speakerPin, "3H", 250)
beep(speakerPin, "3H", 600)

--(1)(1)(3)(1)(2)(2)(2) (2)(2)(4)(2)(3)(3)(3) 

beep(speakerPin, "3H", 250)  
   beep(speakerPin, "3H", 250)  
beep(speakerPin, "5H", 250) 
beep(speakerPin, "3H", 250)  
 beep(speakerPin, "4H", 250) 
beep(speakerPin, "4H", 250)
beep(speakerPin, "4H", 600)

beep(speakerPin, "3H", 250)  
beep(speakerPin, "2", 250)  
beep(speakerPin, "5", 250) 
beep(speakerPin, "7", 250)  
 --beep(speakerPin, "3H", 500) 
--beep(speakerPin, "2H", 500)
beep(speakerPin, "1H", 800)

--(3)(3)(5)(3)(4)(4)(4) (3)(2)57 （3）（6）(1) 

 


  