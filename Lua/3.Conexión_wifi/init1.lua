print(wifi.sta.getip())
--nil
wifi.setmode(wifi.STATION)
wifi.sta.config("HUAWEI-HUNTER1","13081974")
--wifi.sta.config("Indecopi_Guest.","passw0rd123")
--wifi.sta.config("redpucp","C9AA28BA93")
--wifi.sta.config("Juan Adrian","20142016")
--wifi.sta.config("Smelpro Peru","#20122013*")
wifi.sta.connect()
tmr.alarm(1, 1000, 1, function()
     if wifi.sta.getip() == nil then
         print("Conectando...")
     else
         tmr.stop(1)
         print("Conectado, IP es "..wifi.sta.getip())
     end
end)

--dofile("ledserver.lua")
dofile("envio_adc.lua")

--end 
