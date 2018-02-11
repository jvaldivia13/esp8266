function apagar()
 gpio.write(pinled,gpio.LOW)
 print("apagado")
end
function encender()
 gpio.write(pinled,gpio.HIGH)
 print("encendido")
end
sv=net.createServer(net.TCP, 30)
 tmr.delay(10000)   
    sv:listen(80,function(c)
      c:on("receive", function(c, pl)
      --para depurar
      print(pl)
      orden=string.sub(pl,7,9)
      enviado=string.sub(pl,11,12)
      print(orden)
      print(enviado)
      if orden=="led" then
       print("orden captada")
        if enviado=="on" then
         encender() end
        if enviado=="of" then
        apagar() end  
      end     
      c:send('HTTP/1.1 200 OK\n\n')
      c:send('<!DOCTYPE HTML>\n')
      c:send('<html>\n')
      c:send('<head><meta  content="text/html; charset=utf-8">\n')
      c:send('<title>ESP8266</title></head>\n')
      c:send('<body><h1>Led con NODEMCU</h1>\n')
      c:send('<h3>Smart Electronic Project - SMELPRO</h3>\n')
      c:send('<p>Taller Conectividad 2016</p>\n')
      c:send('<form action="" method="GET">\n') 
      c:send('<fieldset>\n')
      c:send('<legend>Selecciona Apagar/Encender Led</legend>\n')
      c:send('<input type="radio" name="led" value="on"/>Encender<br />\n')
      c:send('<input type="radio" name="led" value="of"/>Apagar<br />\n')
      c:send('<input type="submit" value="Enviar"/>\n')
      c:send('</fieldset>\n')     
      c:send('</form>\n')     
      c:send('</body></html>\n')
      c:on("sent",function(c) c:close() end)          
       end)        
     end)
