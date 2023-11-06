use context essentials2021
fun Nationofthenorth( horizontalfront, verticalfront, verticalback, horizontalback, base):
  frame(
    overlay-xy(rectangle(400, 25, "solid", horizontalfront), 0, -113,
      overlay-xy(rectangle(25, 250, "solid", verticalfront), -137, 0,
        overlay-xy(rectangle(50, 250, "solid",verticalback), -125, 0,
          overlay-xy(rectangle(400, 50, "solid", horizontalback), 0, -100,
            rectangle(400, 250, "solid", base))))))

  #Lagt til de ulike komponentene som inngår i "modellen" som skal til for å lage et nordisk flagg med korst. Her har jeg også definert hvilke av rektanglene som er vertikale og horisontale, og i tillegg om de ligger foran eller i bakgrunnen. feks, "horizontalfront" og "horizontalback".

end



Nationofthenorth("blue", "blue", "white", "white", "crimson")
Nationofthenorth("yellow", "yellow", "yellow", "yellow", "blue")
Nationofthenorth("red", "red", "white", "white", "darkblue")
Nationofthenorth("white", "white","white","white", "crimson")
Nationofthenorth("Darkblue", "Darkblue", "Darkblue", "Darkblue", "white")
Nationofthenorth("red", "red", "blue", "blue", "white")

#Funksjonen som skal til for å konstruere de nordiske flaggene består av en sammensetning av vertikale og horisontale linjer, samt en bakgrunn. Framgangsmåten jeg valgte består av å dele opp flagget i to par med vertikale linjer og to par med horisontale linjer. 

#For eksempel vil det norske flagget ha en overliggende vertikal linje, definert som «verticalfront» og en bakom liggende definert som «verticalback». Her vil disse to linjene ha forskjellige farger, den overliggende linjen vil være hvit og den bakom liggende vil være blå.

#Denne funksjonen fungerer slik at dersom et flagg har et kors bestående av lik farge, vil både «verticalfront», «verticalback» ha lik farge. Samt med de horisontale linjene i flagget.
