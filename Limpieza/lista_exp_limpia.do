// Lista expedientes de escaneo

import excel "C:\Users\joyce\Downloads\Expedientes_Drive_raw.xlsx", sheet("Hoja1") clear

split A, parse("f ", " J", " j")

drop A
drop A1

split A2, parse(".pdf", " .pdf")
split A21, parse("_", " _", "_ ", "__", " __", "__ ")

drop A2
drop A21
drop A214
drop A215

rename A211 JUNTA
rename A212 EXPEDIENTE
rename A213 AÑO

drop if JUNTA==""
drop if EXPEDIENTE==""
drop if AÑO==""

split JUNTA, parse("(", " (", "T", " T")
split EXPEDIENTE, parse("(", " (", "T", " T")
split AÑO, parse("(", " (", "T", " T", " ", ".")

drop if JUNTA=="ocr"
drop if EXPEDIENTE=="ocr"
drop if AÑO=="ocr"

drop JUNTA
drop EXPEDIENTE
drop AÑO
drop EXPEDIENTE2
drop EXPEDIENTE3
drop AÑO2
drop AÑO3
drop AÑO4
drop AÑO5
drop AÑO6

rename JUNTA1 JUNTA
rename EXPEDIENTE1 EXPEDIENTE
rename AÑO1 AÑO

sort EXPEDIENTE

duplicates drop, JUNTA EXPEDIENTE AÑO

