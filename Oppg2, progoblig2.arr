use context essentials2021
include shared-gdrive("dcic-2021", "1wyQZj_L0qqV9Ekgr9au6RX2iqt2Ga8Ep")
include gdrive-sheets
include data-source

ssid = "1RYN0i4Zx_UETVuYacgaGfnFcv4l9zd9toQTTdkQkj7g"



kWh-wealthy-consumer-data =
  load-table: komponent, energi
    source: load-spreadsheet(ssid).sheet-by-name("kWh", true)      
    sanitize energi using string-sanitizer 
    sanitize komponent using string-sanitizer
end


#Oppgave 2 a) Fikset tabellen ved å benytte "sanitize" funksjonen. Sanitized tabell - slik ser tabellen ut etter at "sanitize" er brukt", verdiene vises og utrykket "some" forsvinner.

kWh-wealthy-consumer-data

#Oppgave 2 b) Lagt inn en funksjon som gjør string til tall i "energi" kollonnen i tabellen.

fun energi-to-number(str :: String) -> Number:
  doc: "if str is not a numeric string, default to 0."
  cases(Option) string-to-number(str):
    | some(a) => a
    | none => 0
  end
where:
energi-to-number("") is 0
energi-to-number("48") is 48
end

#Oppgave 2 c) Brukt funksjonen "transform-colum" fra dcic-2021.

newtable= transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number)

newtable

#Oppgave 2 d)

fun car-energi-per-day(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel):
(distance-travelled-per-day / 
                            distance-per-unit-of-fuel) * 
                                        energy-per-unit-of-fuel
where:
  car-energi-per-day(17, 4, 8) is 34 
end

distance-travelled-per-day = 17
distance-per-unit-of-fuel = 4
energy-per-unit-of-fuel = 8


#Beregne totalt energiforbruk for typisk innbygger i industriland, sammen med funksjon "sum" og funksjonen ovenfor "car-energi-per-day".

total-car-energiuse = sum(newtable, "energi") + car-energi-per-day(distance-travelled-per-day, distance-per-unit-of-fuel, energy-per-unit-of-fuel)

total-car-energiuse



#Lage en graf som benytter seg av dataen i "newtable".

bar-chart(newtable, "komponent", "energi")

#Ny funksjon for å oppdatere data i grafen og få riktig output

fun energi-to-number-with-car(str :: String) -> Number:
   cases(Option) string-to-number(str):
    | some(a) => a
    | none => car-energi-per-day(17, 4, 8)
  end
where:
energi-to-number("") is 0
energi-to-number("48") is 48
end

# Oppdatert tabell som viser energiforbruk for bil.
newtable-car = transform-column(kWh-wealthy-consumer-data, "energi", energi-to-number-with-car)

newtable-car




#Oppgave 2 e)

# Oppdatert graf for energiforbruk for bil.

bar-chart(newtable-car, "komponent", "energi") 
