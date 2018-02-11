-- Pin definition 
local led = 2            --  GPIO04
local boton = 1    ---GPIO05
local duration = 100    -- 1 second duration for timer

-- Initialising pin
gpio.mode(led, gpio.OUTPUT)
gpio.mode(boton, gpio.INPUT)

-- Create an interval
tmr.alarm(0, duration, 1, function ()
    if gpio.read(boton) == 0 then
        gpio.write(led, gpio.LOW)
    else
        gpio.write(led, gpio.HIGH)
    end

end)
