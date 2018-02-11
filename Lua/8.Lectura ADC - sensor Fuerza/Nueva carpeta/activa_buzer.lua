print("Ingreso activa buzzer....")

function suenabuzzer()

buzzerPin = 7
gpio.mode(buzzerPin, gpio.OUTPUT)

tones = {}

tones["aS"] = 880
tones["cS"] = 523
tones["eS"] = 659

function beep(pin, tone, duration)
    local freq = tones[tone]
    print ("Frequency:....." .. freq)
    pwm.setup(pin, freq, 512)
    pwm.start(pin)
    -- delay in uSeconds
    tmr.delay(duration * 1000)
    pwm.stop(pin)
    --20ms pause
    tmr.wdclr()
    tmr.delay(20000)
end

--function play()
    beep(buzzerPin, "cS", 100)
    beep(buzzerPin, "eS", 100)
    beep(buzzerPin, "aS", 100)
    --print ("Ejecutando..." .. freq)
--end
end
tmr.alarm(2, 2000, tmr.ALARM_SEMI, function() suenabuzzer() end )
tmr.start(2)
--if not tmr.stop(2) then print("timer 2 not stopped, not registered?") end
--tmr.stop(2)


--return
--play()
--suenabuzzer()
