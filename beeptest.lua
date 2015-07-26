speakerPin = 4;  
 gpio.mode(speakerPin,gpio.OUTPUT)  
 --speaker connected port  
 --Tone table  
 t={}  
 t["c"]=261  
 t["d"]= 294  
 t["e"]= 329  
 t["f"]= 349  
 t["g"]= 392
 t["gS"]= 415  
 t["a"]= 440  
 t["aS"]= 455  
 t["b"]= 493  
 t["cH"]= 523  
 t["cSH"]= 554  
 t["dH"]= 587  
 t["dSH"]= 622  
 t["eH"]= 659  
 t["fH"]= 698  
 t["fSH"]= 740  
 t["gH"]= 784  
 t["gSH"]= 830  
 t["aH"]= 880  
 --frequencies for the tones we're going to use  
 --used http://home.mit.bme.hu/~bako/tonecalc/tonecalc.htm to get these  
 function beep(pin, tone, duration)  
 local freq = t[tone]  
 print ("Frequency:" .. freq)  
 pwm.setup(pin, freq, 512)  
 pwm.start(pin)  
 -- delay in uSeconds  
 tmr.delay(duration * 1000)  
 pwm.stop(pin)  
 --20ms pause  
 tmr.wdclr()  
 tmr.delay(20000)  
 end  
 --Play it  
   --for the sheet music see:  
   --http://www.musicnotes.com/sheetmusic/mtd.asp?ppn=MN0016254  
   --this is just a translation of said sheet music to frequencies / time in ms  
   --used 500 ms for a quart note  
   beep(speakerPin, "c", 500)  
   beep(speakerPin, "d", 500)  
   beep(speakerPin, "e", 500)  
   beep(speakerPin, "f", 500) 
beep(speakerPin, "g", 500)   
   beep(speakerPin, "a", 500) 
 beep(speakerPin, "b", 500)  
 beep(speakerPin, "cH", 500)  


   tmr.delay(250000)  
  