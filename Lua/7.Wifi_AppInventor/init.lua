wifi.setmode(wifi.STATION)
--wifi.sta.config("AndroidAP","2012frejol")
wifi.sta.config("WLAN_9964","aquiles33")
--wifi.sta.config("Juan Adrian","20142016")
--wifi.sta.config("Smelpro Peru","#20122013*")
print(wifi.sta.getip()) -- Muestra la IP
tmr.delay(5000)
-- Inicializa el puerto al que está conectado el Led
gpio.mode(2, gpio.OUTPUT)
gpio.mode(1, gpio.OUTPUT)
gpio.write(2, gpio.LOW);
gpio.write(1, gpio.HIGH);
-- Servicios WEB
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
       local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP")
       if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP")
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
        if(_GET.pin == "ON")then
              gpio.write(2, gpio.HIGH)
              gpio.write(1, gpio.LOW)
        elseif(_GET.pin == "OFF")then
              gpio.write(2, gpio.LOW)
              gpio.write(1, gpio.HIGH)
        end
        print(_GET.pin) -- Para DEBUG
        client:close()
        collectgarbage()
    end)
end)
