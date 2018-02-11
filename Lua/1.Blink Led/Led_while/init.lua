 while 1 do
 gpio.write(3,gpio.HIGH)
 tmr.delay(2000000)
 gpio.write(3,gpio.LOW)
 tmr.delay(2000000)
end
