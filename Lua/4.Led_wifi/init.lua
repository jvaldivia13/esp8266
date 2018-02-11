print('Hola Janier')
pinled=2
gpio.mode(pinled, gpio.OUTPUT)

print(wifi.sta.getip())
wifi.setmode(wifi.STATION)
wifi.sta.config("HUAWEI-B116","31417960")
print(wifi.sta.getip())
dofile("ledserver.lua")
--end
