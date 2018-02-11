--1. Initialise used PINs:
       print("Ingreso al PIR..") 
       outpin=3                       -- Select output pin - GPIO0 
       gpio.mode(outpin,gpio.OUTPUT)

       inpin=6                        -- Select input pin - GPIO12  
       gpio.mode(inpin,gpio.INT,gpio.PULLUP)  -- attach interrupt to inpin
--2. Motion Detection function - called by the trigger on rising edge      
      function motion()
           print("Motion Detected!") 
          gpio.write(outpin,gpio.HIGH)  -- Led ON - Motion detected
          tmr.delay(5000000)           -- delay time for marking the movement
         gpio.write(outpin,gpio.LOW)   -- Led OFF
      end
--3. Trigger INPIN on rising edge - based on internal interrupt mechanism 
       gpio.trig(6,"up",motion)
tmr.alarm(0, 1000, 1, function()  print("hey there") end)