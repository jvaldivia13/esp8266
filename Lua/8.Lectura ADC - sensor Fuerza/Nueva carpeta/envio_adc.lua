

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
gpio.mode(6,gpio.OUTPUT)    --  GPIO 12
--set all pins to LOW - no voltage
--gpio.write(0,gpio.LOW)
gpio.write(5,gpio.LOW)
gpio.write(6,gpio.LOW)

--  print the ADC value with all pins low
--print("\nADC: Both GPIOs LOW start: "..adc.read(0))

-- repeat for the other two sensors
gpio.write(5,gpio.HIGH) --apoyo sentado
val = adc.read(0)
if val > 70 then
    val = 0
    gpio.write(5,gpio.LOW)
    tmr.delay(2000)
    gpio.write(6,gpio.HIGH)
    val = adc.read(0)

    if val > 30 then
       print("POSICION .. CORRECTA ")
       --PUBLICA EN LA WEB
       tmr.delay(2000)
       gpio.write(6,gpio.LOW)

       ---------------
        --val= 10 --ok
        --print("Valor LDR "..val)
        print("Sending data to thingspeak.com")
        conn=net.createConnection(net.TCP, 0) 
        conn:on("receive", function(conn, payload) print(payload) end)
        -- api.thingspeak.com 184.106.153.149
        conn:connect(80,'184.106.153.149') 
         conn:send("GET /update?key=YJEDF8VTW98WM7K9&field1="..val.."&field2="..val.."&field3="..val.."&field4="..val.." HTTP/1.1\r\n")

  --       conn:send('GET /update?key='..APIkey..'&field1='..moisture..'&field2='..temp..'&field3='..humi..'HTTP/1.1\r\n\
    --  Host: api.thingspeak.com\r\nAccept: */*\r\nUser-Agent: Mozilla/4.0 (compatible; esp8266 Lua; Windows NT 5.1)\r\n\r\n') - See more at: http://www.esp8266.com/viewtopic.php?f=24&t=2752#sthash.VFZUj1hk.dpuf
        
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
        val= 0
       ---------------
       --dofile("activa_buzer.lua")
    else 
      print("POSICION .. INCORRECTA.. MANDAR PITIDO BUZZER ")
      
      -------------------------------------
      -- publicado error
       val = adc.read(0)
       gpio.write(6,gpio.LOW)
       
        print("Valor LDR "..val)
        print("Sending data to thingspeak.com")
        conn=net.createConnection(net.TCP, 0) 
        conn:on("receive", function(conn, payload) print(payload) end)
        -- api.thingspeak.com 184.106.153.149
        conn:connect(80,'184.106.153.149') 
        conn:send("GET /update?key=YJEDF8VTW98WM7K9&field2="..val.." HTTP/1.1\r\n") 
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
      tmr.delay(2000)
      
    end
else
  tmr.delay(2000)
end 


--------------------

end
-- send data every X ms to thing speak
tmr.alarm(0, 6000, 1, function() sendData() end )

