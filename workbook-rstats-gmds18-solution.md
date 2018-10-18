---
title: "Der Einstieg in die Programmiersprache R"
author: "Jens Hüsers"
date: "Donnerstag 6.9.2018"
output:
  html_document:
    keep_md: TRUE
    css: css/style-workbook.css
    df_print: tibble
    toc: yes
  pdf_document:
    toc: yes
subtitle: Tutorial auf der 63. Jahrestagung der GMDS e.V. in Osnabrück
editor_options:
  chunk_output_type: console
description: "My tutorial on 'Introduction in R' at the 63rd Annual Conference of the GMDS e.V."
---



# Preface

## Installation

In diesem Kurs werden wir mit R und RStudio als Programmierumgebung (IDE) arbeiten. 
Beide Programme stehen kostenlos zur Verfügung. 

Zunächst muss die Programmiersprache R installiert werden. 
Die aktuelle Version kann auf der offiziellen R-Website heruntergeladen werden (http://www.r-project.org)

Danach kann RStudio installiert werden, welches unter der Open Source Lizenz kostenlos zur Verfügung steht (https://www.rstudio.com/products/rstudio/download/).

## Warum R?

R hat eine steile Lernkurve und häufig fällt der Einstieg ohne Ausbildung zum Informatiker oder "Computer Scientist".
Jedoch zahlt sich das Lernen für Personen aus, die in der Wissenschaft arbeiten.

Welche Vorteile bieten Programmiersprachen im Vergleich zu den Statistiksoftwaretools wie SPSS und SAS?

- Kostenlos mit vielen Erweiterungen und Unterstützung einer breiten R-Nutzergruppe (z.B. auf Stackoverflow)
- Dokumentation durch Computer Code
- Reproduzierbarkeit der Analysen
- Möglichkeit fremde Pakete zu nutzten oder eigene Pakete zu schreiben um eigenen Arbeits- und Analyseprozesse zu standardisieren.

- R ist auch ein Werkzeug bzw. ein Werkzeugkoffer, um "Statistik" zu verstehen und neue statistische Konzepte zu lernen.

## R Studio

- Programmeinführung R-Studio

  - Dokumentation
  - Umgebung (Enironment)
  - Konsole

## Lern-Ressourcen und Materialien

- [stackoverflow.com](www.stackoverflow.com)  Online Forum, ein Fragesteller stellt eine Frage und jemand antwortet. Antworten können von anderen Nutzern bewertet werden
- R for Data Science (im Internet frei verfügbar)
- Twitter (z.B. [@hadlywickham](www.twitter.com(hadlywickham), [@rdpeng](https://twitter.com/rdpeng)))
- [DataCamp](www.datacamp.com), [Udemy](www.udemy.com) (Kostenpflichtige eLearning Platformen im Bereich statistisches Programmieren und Data Science)
- kostenfreie Online-Lern Angebote auf Youtube z.B. [MarinStatsLectures](https://www.youtube.com/playlist?list=PLqzoL9-eJTNBDdKgJgJzaQcY6OXmsXAHU)
- [Oft existieren für bestimmte Probleme sogenannte CheatSheets bzw. Spickzettel, welche die wichtigsten Kommandos zusammenfassen](https://www.rstudio.com/resources/cheatsheets/)

# Kapitel 1 - Datenstrukturen

## Einstieg in die Konsole und Datentypen

Vorab wichtig: R ist CaseSensitive, dass heißt, Groß- und Kleinbuchstaben sind unterschiedliche Zeichen.  Der Großbuchstabe `X` ist demnach nicht das selbe wie der Kleinbuchstabe x. Im R-Code werden daher zum Beispiel Variablennamen `x_mean` und `X_mean` unterschiedlich interpretiert.

* Datentypen (Numerisch, Integer, String, Faktoren, Boolean)
  * Integer (Ganzzahl) z.B. `100`
  * Numerisch (Float, Kommazahl) `0.12` oder Ratio zweier Integer `1/10` 
  * Boolean `TRUE` or `FALSE` (oder entprechend 1 und 0), werden in R als Datentyp `logical` bezeichnet
  * Zeichenkette, String `"Dies ist eine Zeichenkette"`
  
  * Datetime Datentyp (z.B. `as.Date("2017-05-05")`, hier ist die Funktionseingabe eine Zeichenkette in einer bestimmten Reihenfolge Jahr-Monat-Tag)
  
  * Besondere Datenwerte sind fehlende Werte z.B. `NA` (Not available) oder `NaN` (Not a Number z.B. `log(-10)`)
  * `NULL` Wert
  
Zum Überprüfen des Datentyps gibt es verschiedene Funktionen z.B. `is.character()`, `is.numeric()` oder `is.logical()`
  
* (Build-In) Funktionen 
  * z.B. `abs()`, `sqrt()`, `nchar()`, `mean()`
  * Dokumentation `?abs`
  * Funktions-Parameter 
  
* Erstellen und Nutzten von Datenstrukturen ("Objekte" und "Klassen")

  * Vektoren `c()`
  * Liste: `list()`
  * data.frame `data.frame()`
  
Es gibt noch weitere Datentypen, wie z.B. Matrix oder umfangreichere Strukturen wie z.B. Lineare Regressionsmodelle 
Da R Methoden für das objekt-orientierte Programmieren anbietet, können auch eigene Datenstrukturen entwickelt und genutzt werden.

## R als Taschenrechner (Kennenlernen der Konsole)

Wir können mathematische Operationen mit der R-Konsole berechen.


```r
1 + 1 # 2
1 - 1 # 0
2 * 4 # 8
2 / 4 # 1/2 oder .5

1 + 1/2
1 / 1  + 2
sqrt(9) + 3
sqrt(2)^2
```

In R ist es üblich Ergebnisse in einer Variable zu speichern.
Das ist mit einem "Pfeil"" als Zuweisungsoperator `<-` (ein kleiner als Zeichen gefolgt von einem Minuszeichen) möglich.
Auch `=` ist möglich, in R aber unüblich.

Zum Beispiel kann die Summe aus der ersten Berechnung in einer Variablen `x` und die Summe aus Berechnung zwei in `y` gespeichert werden.

`x <- 1 + 1` und `y <- 2 * 4`, wobei x und y die Ergebnisse der Berechnung in Form eines numerischen Datentyps (s.u) speichern.

`x + y` repräsentiert somit `(1 + 1) + (2 * 4)` bzw. `2 + 8`. 
R beachtet dabei Rechenregeln wie beispielsweise das Kommutativgesetzt oder das Assoziativgesetz.

## Arbeiten mit Vektoren

Durchschnittlich Temperaturen in den kommenden sieben Tagen.


```r
# Erstellen eines Vektors
# Temperatur
# Daten aus Goolge https://www.google.com/search?q=google+wetter&ie=utf-8&oe=utf-8&client=firefox-b-ab 
# Suche am 19.4.2017
temperaturen <- c(27, 27, 22, 24, 13, 13, 13, 12)

# Was ist die höchste bzw. die kleinste Temperatur?
max_temp <- max(temperaturen)
min_temp <- min(temperaturen)
paste("Der wärmste Tag wird", max_temp, "Grad Celsius warm. Die kälteste", min_temp, "Grad Celsius.")
```

```
## [1] "Der wärmste Tag wird 27 Grad Celsius warm. Die kälteste 12 Grad Celsius."
```

```r
median(temperaturen) # Berechnen des Medians
```

```
## [1] 17.5
```

```r
# Extra Informationen: 
# Da der Median das 50% Quantil ist, kann dieser auch durch die Funktion `quantile` berechnet werden
# Diese Funktion erwartet zwei Argumente:
# Einen Vektor, der die Daten bzw. die Variable beinhaltet
# Zudem einen Vektor der die zu berechnenden Quantile beinhaltet
# Nähere Informationen durch `?quantile`
quantile(x = temperaturen, probs = c(.5)) # Das zweite Argument enthalt nur einen Wert (.5), da wir ausschließlich den Median errechnen möchten
```

```
##  50% 
## 17.5
```

## Eigenschaften von Vektoren

- Vektoren Recycling
- Vektorisierte Operationen

Beispiele für vektorisierte Operationen


```r
# Messgerät unterschätzt jede Messung um einen Grad
temperaturen_unbiased <- temperaturen + 1

# Messgerät ist falsch kalibriert und überschätzt mit steigender Temperatur 
# die tatsächliche Temperatur (um 10%)
temperaturen * .9
```

```
## [1] 24.3 24.3 19.8 21.6 11.7 11.7 11.7 10.8
```

<div class="task">
<p class="task">
**Aufgabe:** 

Rechne die Temperaturen die im Vektor *temperaturen* gespeichert sind in die Einheit Fahrenheit um.

Dazu muss die Temperatur in Celsius mit 5/9 multipliziert und zu dieser Größe 32 addiert werden.


```r
temperaturen_fahrenheit <- temperaturen * 5/9 + 32
print(temperaturen_fahrenheit)
```

```
## [1] 47.00000 47.00000 44.22222 45.33333 39.22222 39.22222 39.22222 38.66667
```

</p>
</div>


# Kapitel 2 - Funktionen

![Syntaktische Aufbau einer Funktion in R](img/tut1-r-function.png)

## Anwendungsbeispiel Mittelwert


```r
# Mittelwert
mittelwert <- function(x) {
  n <- length(x) 
  sum_x <- sum(x)
  sum_x / n
}
```

<div class="task">
**Aufgabe**

Erstellen Sie eine Funktion um die (empirische) Standardabweichung zu berechnen die wie in der folgenden Funktion definiert ist.

$\sigma =\sqrt{\frac{1}{n-1}\cdot {\sum\limits_{i=1}^n}  (x_i-\bar{x})^2}$

* Die Standardabweichung ist definiert als Wurzel des Mittelwerts folgender Größe: 
Der Summe der quadrierten Abweichung jedes Datenpunktes vom Mittelwert (SAQ).*

Folgende Funktionen sind nützlich für die Erstellung dieser Funktion:

- `length` die Länge des Vektors
- `sum` Summe eines Vektors
-  `x^2` Quadiert die Inhalte des Vektors `x`

Die (empirische) Standardabweichung beschreibt die Streuung einer Zufallsvariable.
Je größer die Standardabweichung desto wahrscheinlich sind Datenpunkte, die eine höhere Distanz zum Mittelwert haben.


```r
source("code/temperaturen.R")
# Standardabweichung
standardabweichung <- function(x) {
  # Anzahl der Beobachtungen der Variablen
  n <- length(x)
  # Berechnung des Mittelwerts (die vorher definierte Funktion)
  mw <- mittelwert(x)
  # Berechnen der Summe der Abweichungsquadrate (saq)
  saq <- sum((x - mw)^2)
  # Berechnung der Standardabweichung
  stabw <- sqrt((1 / (n - 1)) * saq)
  return(stabw)
}

standardabweichung(temperaturen) 
```

```
## [1] 6.749339
```

```r
# Je kleiner die Standardabweichung, desto konstanter ist das Wetter in diesen Acht Tagen
```

</div>

<div class="task">

## Aufgabe

Recherchiere bei Google die Temperaturen der kommenden Tage für Moskau und Los Angeles.
Es werden bei Google das Wetter für den aktuellen Tag und der folgenden Woche angegeben.

Schreib eine Funktion mit dem Namen `wettervorhersage`.
Diese Funktion hat einen Parameter (oder auch Funktionsargument genannt).
Dieser Parameter ist ein numerischer Vektor (mit der Temperatur der kommenden Tage).

Die Funktion soll die kleinste und die höchste Temperatur berechnen sowie die Standardabweichung und die Informationen als String zurück geben. 

In welcher Stadt ist besseres Wetter, wo ist das Wetter konstanter?


```r
wettervorhersage <- function(x) {
  min_temp <- min(x)
  max_temp <- max(x)
  stabw <- standardabweichung(x)
  vorhersage <- paste0("Die geringste Temperatur ist: ", min_temp, " und die höchste Temperatur ", max_temp, " Grad Celsius.")
  konstant <- paste0("Die Temperaturschwankung (gemessen durch die Standardabweichung) beträgt ", round(stabw, 2), " Grad Celsius.")
  print(vorhersage)
  print(konstant)
}

los_angeles <- c(29, 31, 31, 28, 26, 26, 26, 26)
moskau <- c(19, 18, 10, 9, 9, 9, 8, 8)
  
wettervorhersage(los_angeles)
```

```
## [1] "Die geringste Temperatur ist: 26 und die höchste Temperatur 31 Grad Celsius."
## [1] "Die Temperaturschwankung (gemessen durch die Standardabweichung) beträgt 2.23 Grad Celsius."
```

```r
wettervorhersage(moskau)
```

```
## [1] "Die geringste Temperatur ist: 8 und die höchste Temperatur 19 Grad Celsius."
## [1] "Die Temperaturschwankung (gemessen durch die Standardabweichung) beträgt 4.53 Grad Celsius."
```

</div>

# Kapitel 3 - Datensatz


## Arbeiten mit Listen und data.frames 

Ist eine Sammlung verschiedener Datentypen.

Erstellen von Listen durch die Funktion `list()`.


```r
# In einem Vektor müssen die Elemente den gleichen Datentyp haben
# Welcher Datentyp besitzt der folgende Vektor?
c("A", 2)
```

```
## [1] "A" "2"
```

```r
# Die Liste muss nicht die selben Datentypen beinhalten (in Gegensatz zu einem Vektor)
# Beispielliste mit zwei Einträgen
beispielliste <- list(1, "B")

# Wir können auch Vektoren als Listenelemente speichern 
temperaturen_liste <- list(temperaturen_la, temperaturen_moskau)

# Wir können sogar Funktionen in Listen speichern 
# Und wem das nicht genug ist, der speichert einfach eine Liste in einer Liste ;)
sinnlosse_beispielliste <- list(beispielliste, standardabweichung)
str(sinnlosse_beispielliste)
```

```
## List of 2
##  $ :List of 2
##   ..$ : num 1
##   ..$ : chr "B"
##  $ :function (x)  
##   ..- attr(*, "srcref")= 'srcref' int [1:8] 4 23 14 1 23 1 4 14
##   .. ..- attr(*, "srcfile")=Classes 'srcfilecopy', 'srcfile' <environment: 0x7fbcd8d89af8>
```

## Datensatz aka data.frame 

Der `data.frame`ist eine besondere Form der Liste.
Er enthält $j$ Vektoren der selben Länge $n$.


```r
temperaturen <- data.frame(temperaturen_la, temperaturen_moskau)

# Mit verschiedenen Funktionen können wir den Datensatz darstellen
nrow(temperaturen) # Anzahl der Zeilen des Datensatzes
```

```
## [1] 8
```

```r
ncol(temperaturen) # Anzahl der Spalten des Datensatzes
```

```
## [1] 2
```

```r
dim(temperaturen) # Anzahl der Zeilen und Spalten 
```

```
## [1] 8 2
```

```r
str(temperaturen) # Struktur des Datensates
```

```
## 'data.frame':	8 obs. of  2 variables:
##  $ temperaturen_la    : num  18 22 26 26 25 24 23 22
##  $ temperaturen_moskau: num  16 14 18 8 8 12 12 13
```

```r
head(temperaturen, n = 2) # Zwei Funktionsargumente, n ist die Anzahl der Zeilen, welche angezeigt werden sollen
```

```
## # A tibble: 2 x 2
##   temperaturen_la temperaturen_moskau
## *           <dbl>               <dbl>
## 1              18                  16
## 2              22                  14
```

```r
tail(temperaturen, n = 2) 
```

```
## # A tibble: 2 x 2
##   temperaturen_la temperaturen_moskau
## *           <dbl>               <dbl>
## 1              23                  12
## 2              22                  13
```

```r
colnames(temperaturen) # Spaltennamen
```

```
## [1] "temperaturen_la"     "temperaturen_moskau"
```

```r
class(temperaturen) # Klasse des Objekts (in diesem Fall `data.frame`)
```

```
## [1] "data.frame"
```

## Operationen mit Datensätzen (data.frames)

Oft möchte man nur mit Ausschnitten des Datensatzes arbeiten.
R bietet die Möglichkeit einzelne Spalten (Variablen) des Datensatzes auszuwählen sowie einzelne Zeilen auszuwählen.
Für unseren Datensatz mit den Temperaturen könnten wir z.B. ausschließlich die Temperaturen für das Wochenende und nur für Los Angeles auswählen.

Es gibt mehrere Möglichkeiten, eine Auswahl eines Datensatzes zu erzeugen. 
Wenn wir einzelne Spalten eines Datensatzes auswählen möchten, eignet sich die `$`(Dollar)-Notation.
Dabei wird über den Datensatznamen und den Spaltennamen, die durch ein `$` verknüft werden auf die spezielle Spalte zugegriffen:
`datensatz_name$spaltenname`
Wenn wir auf die Spalte `temperaturen_la` unseres Datensatzes `temperaturen` zugreifen wolle, könnten wir dieses durch den Befehl `temperaturen$temperaturen_la`

In diesem Fall ist das Ergebnis ein Vektor mit den Daten aus der abgefragten Spalte `temperaturen_la`.

Die `$`-Notation ermöglicht es uns nicht nur, auf einzelne Spalten zurückzugreifen, sondern auch neue Spalten zu erstellen.


```r
data.frame$neue_spalte <- x 
# wobei x ein Vektor mit neuen Daten ist, z.B. das Datum der entsprechenden Tage 

temperaturen$temperaturen_kairo <- c(36, 35, 37, 37, 36, 35, 34, 34)
```

## Importieren eines Datensatzes

![](img/tut1-r-csv-rows.png){width=45%}
![](img/tut1-r-csv-columns.png){width=45%}

Der Datensatz, in R als `data.frame` bezeichnet, ist eine zentrale Datenstruktur, die bei Datenanalysen zum Einsatz kommt.
Viele Datensätze sind so formatiert, dass sie direkt in R importiert werden können. 
So können zum Beispiel `data.frames` aus Excel, SPSS oder SAS direkt importiert werden.

Häufig liegen diese Daten jedoch in Textdateien im CSV-Format vor. CSV steht für Komma-separierte-Werte (engl. comma-separated-values).
Mit Hilfe der Funktion `read.csv` können Dateien im CSV-Format in R eingelesen werden.

Wir verwenden in diesem Tutorial den [Titanic Datensatz](https://www.kaggle.com/c/titanic).

![Headline of THE NEW YORK HERALD 15th of April 1912](img/titanic-new-york-herald.jpeg)


```r
titanic <- read.csv("data/titanic.csv")

library(tidyverse)
head(titanic)
```

```
## # A tibble: 6 x 14
##   pclass survived name  sex     age sibsp parch ticket  fare cabin embarked
## *  <int>    <int> <fct> <fct> <dbl> <int> <int> <fct>  <dbl> <fct> <fct>   
## 1      1        1 Alle… fema… 29        0     0 24160  211.  B5    S       
## 2      1        1 Alli… male   0.92     1     2 113781 152.  C22 … S       
## 3      1        0 Alli… fema…  2        1     2 113781 152.  C22 … S       
## 4      1        0 Alli… male  30        1     2 113781 152.  C22 … S       
## 5      1        0 Alli… fema… 25        1     2 113781 152.  C22 … S       
## 6      1        1 Ande… male  48        0     0 19952   26.6 E12   S       
## # ... with 3 more variables: boat <int>, body <int>, home.dest <fct>
```

Diese spezielle R-Syntax erlaubt es, auf einzelne Spalten eines Datensatzes zuzugreifen.

Eine weitere Möglichkeit auf eine Auswahl des Datensatzes zist die sogenannten `[`-Notation, wobei `[` als "bracket" oder "Eckige Klammer" bezeichnet wird.
Diese hat folgende Syntax: `datensatz[zeilenfilter, vektor mit den spaltennamen]`.
`datensatz` bezeichnet den Namen des spezifischen Datensatzes, unser erstellter Datensatz hat den Namen.
In die folgenden eckigen Klammern wird die Auswahl des Datensatzes spezifiziert.
Vor dem Komma wird der Zeilenfilter gesetzt, nach der Klammer ein `character` Vektor, der die Namen der ausgewählten Spalten enthält.
Das Resultat ist ein neuer Datensatz, ausschließlich mit den Zeilen und Spalten, die ausgewählt wurden. 

## Auswählen von Zeilen und Spalten


```r
titanic[, "age"] # Nur Spalte Age
titanic[1, ] # Nur erste Zeile
titanic[c(1, 2), c("age", "sex")] # gibt die ersten beiden Zeilen und die Spalten Alter und Geschlecht wieder
titanic[titanic$age <= 18, ] # gibt die ersten beiden Zeilen und die Spalten Alter und Geschlecht wieder
titanic[titanic$sex == "male", ] # gibt die ersten beiden Zeilen und die Spalten Alter und Geschlecht wieder
```

**Cave: Oben habe ich geschrieben, das Ergebnis sei eine neuer Datensatz, also ein R-Objekt des Typs `data.frame´.
Wenn nur eine Spalte ausgewählt wird, ist das Ergebnis ein Vektor**

<div class="task">

**Aufgabe**

- Wie viele Passagiere waren auf der Reise unter 18 Jahre alt?
- Was ist das durchschnittliche Alter der Männer und der Frauen? 
- Wie hoch ist der durchschnittliche Ticktpreis (`fare`-Spalte)


```r
# Anzahl unter 18-jähriger Passagiere
nrow(titanic[titanic$age < 18, ])
```

```
## [1] 417
```

```r
# Durchschnittlicher Alter Herren
mean(titanic$age[titanic$sex == "male"], na.rm = TRUE)
```

```
## [1] 30.58523
```

```r
# Durchschnittliches Alter Damen
mean(titanic$age[titanic$sex == "female"], na.rm = TRUE)
```

```
## [1] 28.68709
```

```r
# Durchschnittliche Ticketpreis
mean(titanic$fare, na.rm = TRUE)
```

```
## [1] 33.29548
```


</div>

# Kapitel 4 - Tidyverse

## Nutzen von Paketen

Bisher haben wir uns mit den Standardfunktionen von R befasst.
Zudem haben wir eine Funktions selber geschrieben.

Häufig entwickeln Statistiker und Programmierer Erweiterungen, die auch Pakete genannt werden, die wir als sogenannte `library` nutzten können.

Eine der zentralen Erweiterungen in R momentan ist das Paket `tidyverse`.
Es erweitert den Funktionsumfang von data.frames. 
Diese weiterentwickelte data.frame wir auch als `tibble` bezeichnet.

Pakete wie `tidyverse` müssen zusätzlich installiert werden.
Dies gelingt durch die Funktion `install.packages` z.B. `install.package(tidyverse)`.

Um das Paket zu nutzten müssen wir es zunächst laden.
Dies gelingt durch den Funktionsaufruf `library(tidyverse)`.

## Importieren von Daten

Auch Tidyverse-Paket hat eine Funktion, um Daten im CSV-Formtat zu importieren (und auch zu exportieren). 
Diese Funktion hat den Vorteil, dass sie die Daten schneller liest und den Datentyp einzelner Spalten zuverlässiger erkennt.

Die Funktion heißt `read_csv` (nicht verwechseln mit der Funktion `read.csv` die mit einem Punkt geschrieben wird).
Die Dokumentation erhalten wir durch `?read_csv`.



```r
library(tidyverse)
titanic <- read_csv("data/titanic.csv")
```

Es existieren in R Erweiterung die Schnittstellen und Importmöglichkeiten für andere Datenformate bieten:

- SPSS `haven::read_sav(file = "data/titanic.sav")`
- Excel `readxl::read_xlsx(file = "data/titanic.xlsx")`

<div class="task">
**Aufgabe** 

Nutzen sie die beiden Funktionen um den Datensatz als data.frame zu importieren. 
Speichern Sie den jeweiligen Datensatz in einer Variable.

Berechnen Sie den Mittelwert des Alters und vergleichen Sie die Ergebnisse.


```r
# einlesen des SPSS Datensatzes mit dem haven Paket
titanic_sav <- haven::read_sav(file = "data/titanic.sav")
head(titanic_sav) # ersten sechs Zeilen des Datensatzes
```

```
## # A tibble: 6 x 14
##   pclass survived name  sex     age sibsp parch ticket  fare cabin embarked
##    <dbl>    <dbl> <chr> <chr> <dbl> <dbl> <dbl> <chr>  <dbl> <chr> <chr>   
## 1      1        1 Alle… fema… 29        0     0 24160  211.  B5    S       
## 2      1        1 Alli… male   0.92     1     2 113781 152.  C22 … S       
## 3      1        0 Alli… fema…  2        1     2 113781 152.  C22 … S       
## 4      1        0 Alli… male  30        1     2 113781 152.  C22 … S       
## 5      1        0 Alli… fema… 25        1     2 113781 152.  C22 … S       
## 6      1        1 Ande… male  48        0     0 19952   26.6 E12   S       
## # ... with 3 more variables: boat <chr>, body <dbl>, home.dest <chr>
```

```r
summary(titanic_sav) # Zusammenfassung des Datensatzes
```

```
##      pclass         survived         name               sex           
##  Min.   :1.000   Min.   :0.000   Length:1309        Length:1309       
##  1st Qu.:2.000   1st Qu.:0.000   Class :character   Class :character  
##  Median :3.000   Median :0.000   Mode  :character   Mode  :character  
##  Mean   :2.295   Mean   :0.382                                        
##  3rd Qu.:3.000   3rd Qu.:1.000                                        
##  Max.   :3.000   Max.   :1.000                                        
##                                                                       
##       age            sibsp            parch          ticket         
##  Min.   : 0.17   Min.   :0.0000   Min.   :0.000   Length:1309       
##  1st Qu.:21.00   1st Qu.:0.0000   1st Qu.:0.000   Class :character  
##  Median :28.00   Median :0.0000   Median :0.000   Mode  :character  
##  Mean   :29.88   Mean   :0.4989   Mean   :0.385                     
##  3rd Qu.:39.00   3rd Qu.:1.0000   3rd Qu.:0.000                     
##  Max.   :80.00   Max.   :8.0000   Max.   :9.000                     
##  NA's   :263                                                        
##       fare            cabin             embarked        
##  Min.   :  0.000   Length:1309        Length:1309       
##  1st Qu.:  7.896   Class :character   Class :character  
##  Median : 14.454   Mode  :character   Mode  :character  
##  Mean   : 33.295                                        
##  3rd Qu.: 31.275                                        
##  Max.   :512.329                                        
##  NA's   :1                                              
##      boat                body        home.dest        
##  Length:1309        Min.   :  1.0   Length:1309       
##  Class :character   1st Qu.: 72.0   Class :character  
##  Mode  :character   Median :155.0   Mode  :character  
##                     Mean   :160.8                     
##                     3rd Qu.:256.0                     
##                     Max.   :328.0                     
##                     NA's   :1188
```

```r
# einlesen des Excel Datensatzes
titanic_xlsx <- readxl::read_xlsx("data/titanic.xlsx")

# Berechnen der Mittelwerte des Alters in der Spalte `age`  
mean(titanic$age, na.rm = TRUE)
```

```
## [1] 29.88114
```

```r
mean(titanic_sav$age, na.rm = TRUE)
```

```
## [1] 29.88114
```

```r
mean(titanic_xlsx$age, na.rm = TRUE)
```

```
## [1] 29.88114
```

</div>

## Arbeiten mit dem tidyverse

Das tidyverse bedient sich einer einfachen Syntax und 5 zentralen Funktionen.
Das besondere der Syntax ist das aneinanderreihen von (tidyverse) Funktionen.
Der Pipe-Operator verbindet Funktionen und gibt den Funktionsoutput der vorangegangenen Funktion in die folgende Funktion als Funktionsinput weiter.
Der Pipe Operator wird mit der Syntax `%>%` (Prozentzeichen, größer-Zeichen, Prozentzeichen) verwendet.
Fast alle Funktionen im tidyverse erwarten einen `data.frame` als Funktionsinput und geben einen manipulierten `data.frame` zurück.

Die fünf zentralen Funktionen sind Verben, die ausdrücken, was die jeweilige Funktion "tut".

![Auswahl wichtiger dplyr-Funktionen](img/tut1-r-dplyr-functions.png)


#### Beispiele

*Umrechnung der Fahrpreises*


```r
titanic %>% 
  mutate(fare = fare * 11.25) %>%
  arrange(fare) %>% tail
```

```
## # A tibble: 6 x 14
##   pclass survived name  sex     age sibsp parch ticket  fare cabin embarked
##    <int>    <int> <chr> <chr> <dbl> <int> <int> <chr>  <dbl> <chr> <chr>   
## 1      1        1 Fort… fema…  60       1     4 19950  2959. C23 … S       
## 2      1        1 Card… male   36       0     1 PC 17… 5764. B51 … C       
## 3      1        1 Card… fema…  58       0     1 PC 17… 5764. B51 … C       
## 4      1        1 Lesu… male   35       0     0 PC 17… 5764. B101  C       
## 5      1        1 Ward… fema…  35       0     0 PC 17… 5764. <NA>  C       
## 6      3        0 Stor… male   60.5     0     0 3701     NA  <NA>  S       
## # ... with 3 more variables: boat <int>, body <int>, home.dest <chr>
```


*Die ältesten 3 überlebenden Passagiere*


```r
titanic %>% 
  mutate(survived = if_else(survived == 1, TRUE, FALSE)) %>% 
  filter(survived) %>% 
  select(name, age, pclass) %>% 
  arrange(age) %>% 
  tail(n = 3)
```

```
## # A tibble: 3 x 3
##   name                                                age pclass
##   <chr>                                             <dbl>  <int>
## 1 Shine, Miss. Ellen Natalia                           NA      3
## 2 Smyth, Miss. Julia                                   NA      3
## 3 Thorneycroft, Mrs. Percival (Florence Kate White)    NA      3
```

<div class="task">

**Aufgabe**

Welche Passagiere haben den Höchsten Preis für die Reise bezahlt?

Geben Sie den Namen und den Fahrpreis in der finale Tablle aus.


```r
titanic %>% 
  select(name, fare) %>% 
  arrange(desc(fare)) %>% 
  head(n = 10)
```

```
## # A tibble: 10 x 2
##    name                                                             fare
##    <chr>                                                           <dbl>
##  1 Cardeza, Mr. Thomas Drake Martinez                               512.
##  2 Cardeza, Mrs. James Warburton Martinez (Charlotte Wardle Drake)  512.
##  3 Lesurer, Mr. Gustave J                                           512.
##  4 Ward, Miss. Anna                                                 512.
##  5 Fortune, Miss. Alice Elizabeth                                   263 
##  6 Fortune, Miss. Ethel Flora                                       263 
##  7 Fortune, Miss. Mabel Helen                                       263 
##  8 Fortune, Mr. Charles Alexander                                   263 
##  9 Fortune, Mr. Mark                                                263 
## 10 Fortune, Mrs. Mark (Mary McDougald)                              263
```

[Extrainfos](https://www.encyclopedia-titanica.org/titanic-survivor/thomas-cardeza.html)

</div>

*Was ist das durchschnittliche Alter der Passagiere?*

- Zusammenfassen durch den Mittelwert - `summarise`


```r
titanic %>% 
  summarise(age_mean = mean(age, na.rm = T))
```

```
## # A tibble: 1 x 1
##   age_mean
##      <dbl>
## 1     29.9
```

*Was ist das durchschnittliche Alter der männlichen und weiblichen Passagiere und was ist die Standardabeichung des Alters?*

- Gruppen erstellen entsprechend des Geschlechts - `group_by`
- Zusammenfassen durch den Mittelwert - `summarise`


```r
titanic %>% 
  group_by(sex) %>% 
  summarise(age_mean = mean(age, na.rm = T), age_sd = sd(age, na.rm = T), n = n())
```

```
## # A tibble: 2 x 4
##   sex    age_mean age_sd     n
##   <chr>     <dbl>  <dbl> <int>
## 1 female     28.7   14.6   466
## 2 male       30.6   14.3   843
```

<div class="task">

**Aufgabe**

Was ist der durchschnittliche Fahrpreis und die jeweilige Streuung für die jeweiligen Klassen?



```r
titanic %>% 
  group_by(pclass) %>% 
  summarise(durchschnittl_fahrpreis = mean(fare, na.rm = TRUE))
```

```
## # A tibble: 3 x 2
##   pclass durchschnittl_fahrpreis
##    <int>                   <dbl>
## 1      1                    87.5
## 2      2                    21.2
## 3      3                    13.3
```
</div>


<div class="task">
**Aufgabe**

Der *New York Herold* titelte am 15.April 1912: *The Titanic sinks with 1800 on board; only 675 mostly women and children, saved*.

Finden sie heraus, ob diese Schlagzeile aus den Daten nachvollziehbar ist, indem Sie die Funktionen des `tidyverse` anwenden.


```r
titanic %>%  
  group_by(survived, sex) %>%  
  summarise(n = n()) %>%  
  ungroup() %>%  
  mutate(prop = n / sum(n)) 
```

```
## # A tibble: 4 x 4
##   survived sex        n   prop
##      <int> <chr>  <int>  <dbl>
## 1        0 female   127 0.0970
## 2        0 male     682 0.521 
## 3        1 female   339 0.259 
## 4        1 male     161 0.123
```

</div>

<div class="task">

**Aufgabe**

Es ist bekannt dass die Rettungsboote auf der Titanic nicht ausgelastet waren.
Nun sollen Sie die tatsächliche Auslasung der Rettungsboote auf der Titanic berechnen.

Die Informationen ob und in welches Rettungsboot ein Gast bestieg ist in der Spalte `boat` des Titanic Datensatzes vermerkt.


```r
# auslastung pro boot 
auslastung_pro_boot <- titanic %>%  
  filter(!is.na(boat)) %>%  
  group_by(boat) %>%  
  summarise(n = n()) %>%  
  mutate(auslastung = n / 65) 
   
# auslastung aller boote 
auslastung_aller_boote <- auslastung_pro_boot %>%  
  summarise(auslastung = mean(auslastung)) 
 
print(auslastung_pro_boot) 
```

```
## # A tibble: 16 x 3
##     boat     n auslastung
##    <int> <int>      <dbl>
##  1     1     5     0.0769
##  2     2    13     0.2   
##  3     3    26     0.4   
##  4     4    31     0.477 
##  5     5    30     0.462 
##  6     6    20     0.308 
##  7     7    23     0.354 
##  8     8    24     0.369 
##  9     9    25     0.385 
## 10    10    29     0.446 
## 11    11    25     0.385 
## 12    12    19     0.292 
## 13    13    42     0.646 
## 14    14    33     0.508 
## 15    15    38     0.585 
## 16    16    23     0.354
```

```r
print(auslastung_aller_boote) 
```

```
## # A tibble: 1 x 1
##   auslastung
##        <dbl>
## 1      0.390
```

</div>


# Kapitel 5 - Grafiken 
 
In R gibt es drei wichtige Softwarepakete um Grafiken zu erstellen. 
 
- `base` 
- `lattice` 
- `ggplot2` 
 
An dieser Stelle wird ein kurzer Ausblick auf das Basispaket in gegeben und zwei weesentliche Funktionen vorgestellt. 
 
- XY-Plots 
- Histogramme 
- Boxplots 
 
### XY-Plots 
 

```r
par(mfrow = c(1,2)) 
# Bivariate Darstellung des Alters und des Preises 
plot(titanic$age, titanic$fare) 
plot(titanic$age, titanic$fare, col = titanic$pclass) 
```

<img src="workbook-rstats-gmds18-solution_files/figure-html/unnamed-chunk-19-1.png" style="display: block; margin: auto;" />

```r
par(mfrow = c(1, 1)) 
```
 
### Histogramme 
 

```r
hist(titanic$age) 
```

<img src="workbook-rstats-gmds18-solution_files/figure-html/unnamed-chunk-20-1.png" style="display: block; margin: auto;" />
 
### Boxplots 
 

```r
boxplot(titanic$age) 
```

<img src="workbook-rstats-gmds18-solution_files/figure-html/unnamed-chunk-21-1.png" style="display: block; margin: auto;" />
 
# Rückblick und Ausblick

- Vom elementaren Datentyp über Vektoren zu Listen und data.frames
- `data.frames` stellen das zentrale Datenelement im tidyverse dar
- Das `tidyverse` ist der Werkzeigkasten in  R zur Datenmanipulation

- Weiter wichtige Funktionen z.B. aus der Inferenzstatistik sind in R vorhanden z.B. `?t.test`
- Ein großer Funktionsumfrang zum Modellieren von Daten z.B. von Lineare Regression bis zur Neuronalen Netzen


Weitere statistische Operationen wie z.B. Konfidenzintervalle und Inferenzstatistik (t.tests)


```r
titanic %>% 
  group_by(sex) %>% 
  filter(age >= 18) %>% 
  summarise(ci = list(Hmisc::smean.cl.boot(age))) %>% 
  mutate_at("ci", ~ map(.x, enframe)) %>% 
  unnest(ci) %>% 
  spread(key = name, value = value)
```

```
## # A tibble: 2 x 4
##   sex    Lower  Mean Upper
##   <chr>  <dbl> <dbl> <dbl>
## 1 female  31.9  33.2  34.5
## 2 male    32.6  33.6  34.5
```

![](img/tut1-example-plot.png)
<hr>
![](img/tut1-r-decision-tree.png)


```r
library(rpart) # Paket mit dem Entscheidungsbäume erstellt werden können
library(rattle) # Paket mit dem Entscheidungsbäume visualisiert werden können

titanic %>% 
  ggplot(aes(x = factor(pclass), y = fare)) + 
  stat_summary(fun.data = mean_cl_boot, geom = "errorbar", width = .15, size = 1.25) + 
  stat_summary(fun.y = mean, geom = "point", size = 2) +
  geom_point(alpha = .05) +
  ylab("Fahrpreis in Dollar (1912)") +
  scale_x_discrete(labels = c("1. Klasse", "2. Klasse", "3. Klasse")) +
  scale_y_continuous(label = scales::dollar_format(), breaks = seq(0, 120, by = 20), limits = c(0, 120)) +
  theme_bw() +
  theme(axis.title.x = element_blank(), 
        axis.text = element_text(size = 12))
```

```
## Warning: Removed 68 rows containing non-finite values (stat_summary).

## Warning: Removed 68 rows containing non-finite values (stat_summary).
```

```
## Warning: Removed 68 rows containing missing values (geom_point).
```

<img src="workbook-rstats-gmds18-solution_files/figure-html/unnamed-chunk-23-1.png" style="display: block; margin: auto;" />

```r
train <- titanic %>% select(survived, sex, age, pclass)
decision_tree <- rpart(survived ~ .,
                 data = train,
                 method ="class")

fancyRpartPlot(decision_tree, main = "", sub = "Welche Personen haben den Titanic-Untergang überlebt?")
```

<img src="workbook-rstats-gmds18-solution_files/figure-html/unnamed-chunk-23-2.png" style="display: block; margin: auto;" />
