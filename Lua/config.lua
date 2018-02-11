-- file : config.lua
local module = {}

module.SSID = {}  
--module.SSID["SetupGadget"] = ""
module.SSID["WLAN_9964"] = "aquiles88"
module.HOST = "192.168.1.38"  
module.PORT = 1883  
module.ID = node.chipid()

module.ENDPOINT = "nodemcu/"  
return module
