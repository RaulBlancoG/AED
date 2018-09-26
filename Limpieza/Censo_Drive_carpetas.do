
use C:\Users\issac\Desktop\Censo_Drive_pre.dta, clear

drop if mi(tipo)
drop if peso == "0"

replace tipo = ltrim(tipo)
replace tipo = ltrim(reverse(tipo))
replace tipo = reverse(tipo)


///////////////////////////////////////////////////  pdf
//gen a = strpos(tipo, "pdf")
//drop if a == 0 
//drop if tipo == "pdf"
//contract tipo 
/// pdf_, pdf(CAPTURADO), pdf_CAPTURADO, CAPTIRADO pdf, CAPTURADO pdf, CAPTURADOpdf
/// (CAPTURADO)pdf, PDF, PDF CAPTURADO
replace tipo = "pdf" if tipo == "pdf_" | tipo == "pdf(CAPTURADO)" ///
| tipo == "pdf_CAPTURADO" | tipo == "CAPTIRADO pdf" | tipo == "CAPTURADO pdf" ///
| tipo == "CAPTURADOpdf" | tipo == "(CAPTURADO)pdf" | tipo == "PDF" ///
| tipo == "PDF CAPTURADO" 
//keep if tipo == "CAPTURADO"	
split nombre if tipo == "CAPTURADO", p(".")
replace nombre = nombre1 if tipo == "CAPTURADO"
replace tipo = "pdf" if tipo == "CAPTURADO"
drop nombre1 nombre2

///////////////////////////////////////////////////  EXP, Exp
//keep if nombre == "EXP" | nombre == "Exp"
drop if nombre == "EXP" | nombre == "Exp"


///////////////////////////////////////////////////  Dem, DEMANDA
//keep if nombre == "Dem"
drop if nombre == "Dem"
//keep if tipo == "DEMANDA"
drop if tipo == "DEMANDA"



///////////////////////////////////////////////////   meses
//keep if directorio5 == "Expedientes Iniciales (Secretarios de acuerdos)" ///
//& directorio6 == "" & tipo != "xlsx"
drop if directorio5 == "Expedientes Iniciales (Secretarios de acuerdos)" ///
& directorio6 == "" & tipo != "xlsx"
//keep if directorio1 == "Remesas Post-Resumen" & directorio2 == ""
drop if directorio1 == "Remesas Post-Resumen" & directorio2 == ""
//keep if directorio2 == "Respaldo CDs de Franz" & directorio3 == ""
drop if directorio2 == "Respaldo CDs de Franz" & directorio3 == ""
//keep if directorio2 == "Respaldo CDs de Franz" & directorio3 != "" ///
//& directorio4 == "" & tipo != "TIF"
drop if directorio2 == "Respaldo CDs de Franz" & directorio3 != "" ///
& directorio4 == "" & tipo != "TIF"
//keep if directorio3 == "scanner" & directorio4 == ""
drop if directorio3 == "scanner" & directorio4 == ""

//keep if directorio2 == "Dictamenes" & directorio3 == ""
drop if directorio2 == "Dictamenes" & directorio3 == ""

//keep if directorio2 == "Expedientes" & directorio3 == "" & tipo != "ini"
drop if directorio2 == "Expedientes" & directorio3 == "" & tipo != "ini"

//keep if directorio5 == "Razones actuariales" & directorio6 == "" & tipo != "ini"
drop if directorio5 == "Razones actuariales" & directorio6 == "" & tipo != "ini"

//keep if directorio6 == "17. Razones mayo" & directorio7 == "" & tipo != "ini"
drop if directorio6 == "17. Razones mayo" & directorio7 == "" & tipo != "ini"

//keep if directorio6 == "13. Enero" & tipo != "TIF" & tipo != "tif" & tipo != "PDF" 
drop if directorio6 == "13. Enero" & tipo != "TIF" & tipo != "tif" & tipo != "PDF" 

//keep if directorio6 == "16. Razones abril" & directorio7 == "" & tipo != "ini"
drop if directorio6 == "16. Razones abril" & directorio7 == "" & tipo != "ini"

//keep if directorio3 == "FRANZ =D" & directorio4 == "" & tipo != "ini" ///
//& tipo != "docx" & tipo != "xlsx"
drop if directorio3 == "FRANZ =D" & directorio4 == "" & tipo != "ini" ///
& tipo != "docx" & tipo != "xlsx"

//keep if tipo == "TIF CAPTURADO" | tipo == "01 CAPTURADO" ///
//| tipo == "02 CAPTURADO"
replace tipo = "TIF" if tipo == "TIF CAPTURADO" | tipo == "01 CAPTURADO" ///
| tipo == "02 CAPTURADO"

//keep if tipo == "1" | tipo == "17"
drop if tipo == "1" | tipo == "17"

//keep if directorio3 == "Seguimiento de Actuarios" & directorio4 == "" & tipo != "ini"
drop if directorio3 == "Seguimiento de Actuarios" & directorio4 == "" & tipo != "ini"

//keep if tipo == "csv_"
replace tipo = "csv" if tipo == "csv_"

//keep if tipo == "SINEINICIAL,pdf"
replace tipo = "pdf" if tipo == "SINEINICIAL,pdf"

//////////////////////////////////////////////////////   varios
/*keep if tipo == "05-11-2012" | tipo == "CAPTURADA" | tipo == "CARGAS A ACTUARIOS" ///
| tipo == "Demanda" | tipo == "Dictamenes_Febrero 2014" ///
| tipo == "Edgar V (29-09-2014)" | tipo == "FALTAN 3)" | tipo == "GARZA" ///
| tipo == "Hernandez" | tipo == "MARION" ///
| tipo == "Nueva fase de Oficina de Actuarios" ///
| tipo == "Maru 15-08-2014" ///
| tipo == "OAA" | tipo == "CHARMANDER" ///
| tipo == "lic" | tipo == "lupita 26-8-14" | tipo == "relacionado con J9-940-2010)"
*/
drop if tipo == "05-11-2012" | tipo == "CAPTURADA" | tipo == "CARGAS A ACTUARIOS" ///
| tipo == "Demanda" | tipo == "Dictamenes_Febrero 2014" ///
| tipo == "Edgar V (29-09-2014)" | tipo == "FALTAN 3)" | tipo == "GARZA" ///
| tipo == "Hernandez" | tipo == "MARION" ///
| tipo == "Nueva fase de Oficina de Actuarios" ///
| tipo == "Maru 15-08-2014" ///
| tipo == "OAA" | tipo == "CHARMANDER" ///
| tipo == "lic" | tipo == "lupita 26-8-14" ///
| tipo == "relacionado con J9-940-2010)" | tipo == "MARU"

////////////////////////////////////////////////////   homogenizar nomenclatura
replace tipo = "jpg" if tipo == "JPG"
replace tipo = "png" if tipo == "PNG"
replace tipo = "txt" if tipo == "TXT"

