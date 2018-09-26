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
rename A213 A�O

drop if JUNTA==""
drop if EXPEDIENTE==""
drop if A�O==""

split JUNTA, parse("(", " (", "T", " T")
split EXPEDIENTE, parse("(", " (", "T", " T")
split A�O, parse("(", " (", "T", " T", " ", ".")

drop if JUNTA=="ocr"
drop if EXPEDIENTE=="ocr"
drop if A�O=="ocr"

drop JUNTA
drop EXPEDIENTE
drop A�O
drop EXPEDIENTE2
drop EXPEDIENTE3
drop A�O2
drop A�O3
drop A�O4
drop A�O5
drop A�O6

rename JUNTA1 JUNTA
rename EXPEDIENTE1 EXPEDIENTE
rename A�O1 A�O

sort EXPEDIENTE

duplicates drop, JUNTA EXPEDIENTE A�O

