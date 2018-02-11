
function sendData()
--------------------
-- multisensor.lua
-- ---------------
--configure pins

--gpio.mode(0,gpio.OUTPUT)    --  GPIO 16

------------------------------------
-----------------------------------
--gpio.mode(13,gpio.OUTPUT)  
gpio.mode(5,gpio.OUTPUT)    --  GPIO 14
--gpio.mode(6,gpio.OUTPUT)    --  GPIO 12
--set all pins to LOW - no voltage
--gpio.write(0,gpio.LOW)
gpio.write(5,gpio.LOW)
--gpio.write(6,gpio.LOW)

--  print the ADC value with all pins low
--print("\nADC: Both GPIOs LOW start: "..adc.read(0))

-- repeat for the other two sensors
gpio.write(5,gpio.HIGH) --apoyo sentado
val = adc.read(0)
tmr.delay(2000)
gpio.write(5,gpio.LOW)

    
        print("Sending data to thingspeak.com")
        conn=net.createConnection(net.TCP, 0) 
        conn:on("receive", function(conn, payload) print(payload) end)
        -- api.thingspeak.com 184.106.153.149
        conn:connect(80,'184.106.153.149') 
        conn:send("GET /update?key=YJEDF8VTW98WM7K9&field1="..val.." HTTP/1.1\r\n") 
        conn:send("Host: api.thingspeak.com\r\n") 
        conn:send("Accept: */*\r\n") 
        conn:send("User-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n")
        conn:send("\r\n")
        conn:on("sent",function(conn)
                              print("Closing connection")
                              conn:close()
                          end)
        conn:on("disconnection", function(conn)
                                        print("Got disconnection...")
        end)
       
     
      -------------------------------------
      -- pitido de error.
     --definicion del buzzer
      dofile("activa_buzer.lua")
      -------------------------------------
     -- tmr.delay(2000)
      


--------------------

end
-- send data every X ms to thing speak
tmr.alarm(0, 6000, 1, function() sendData() end )

