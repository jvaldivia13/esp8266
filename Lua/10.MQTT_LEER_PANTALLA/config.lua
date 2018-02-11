-- file : config.lua
local module = {}

module.SSID = {}  
--module.SSID["SetupGadget"] = ""
module.SSID["BRASIL"] = "D2BARBESHOP"
module.HOST = "192.168.1.33"  
module.PORT = 1883  
module.ID = node.chipid()

module.ENDPOINT = "nodemcu/"  
return module
