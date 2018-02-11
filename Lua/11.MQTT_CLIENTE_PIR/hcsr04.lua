--
--    Copyright (C) 2014 Tamas Szabo <sza2trash@gmail.com>
--
--    This program is free software: you can redistribute it and/or modify
--    it under the terms of the GNU General Public License as published by
--    the Free Software Foundation, either version 3 of the License, or
--    (at your option) any later version.
--
--    This program is distributed in the hope that it will be useful,
--    but WITHOUT ANY WARRANTY; without even the implied warranty of
--    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--    GNU General Public License for more details.
--
--    You should have received a copy of the GNU General Public License
--    along with this program.  If not, see <http://www.gnu.org/licenses/>.
--

hcsr04 = {};

function hcsr04.init(pin_trig, pin_echo, average)
	local self = {}
	--self.time_start = 0
	--self.time_end = 0
	--self.trig = pin_trig or 5
	--self.echo = pin_echo or 4
	--gpio.mode(self.trig, gpio.OUTPUT)
	--gpio.mode(self.echo, gpio.INT)
	--self.average = average or 3
 --
       outpin=3                       -- Select output pin - GPIO0 
       gpio.mode(outpin,gpio.OUTPUT)

       inpin=6                        -- Select input pin - GPIO12  
       gpio.mode(inpin,gpio.INT,gpio.PULLUP) 
 

	--2. Motion Detection function - called by the trigger on rising edge      
      function motion()
           print("Motion Detected!") 
          gpio.write(outpin,gpio.HIGH)  -- Led ON - Motion detected
          tmr.delay(5000000)           -- delay time for marking the movement
         gpio.write(outpin,gpio.LOW)   -- Led OFF
      end
   --3. Trigger INPIN on rising edge - based on internal interrupt mechanism 
       gpio.trig(6,"up",motion)


    ----

	

	function self.measure_avg()
		
		return 55
	end

	return self
end
