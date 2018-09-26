import delimited C:\Users\issac\Downloads\Censo.txt, clear
drop in 1
///////////////////////////////////////////////////////////   nombres
gen rev_v1 = reverse(v1)
gen v2 = substr(rev_v1, 1, strpos(rev_v1, "/") - 1) 
gen nom = reverse(v2)
drop rev_v1
drop v2


gen rev_nom = reverse(nom)
gen v3 = substr(rev_nom, 1, strpos(rev_nom, ".") - 1) 
gen v4 = substr(rev_nom, strpos(rev_nom, ".") + 1, length(rev_nom))
gen nombre = reverse(v4)
gen tipo = reverse(v3)
drop rev_nom
drop v3
drop v4
drop nom 

replace tipo = "pdf" if tipo == "s"

///////////////////////////////////////////////////////////   directorio
gen v5 = substr(v1, strpos(v1, "./") + 2, length(v1))
gen rev_v5 = reverse(v5)
gen v6 = substr(rev_v5, strpos(rev_v5, "/") + 1, length(rev_v5))
gen directorio = reverse(v6)
drop v5
drop rev_v5
drop v6

split directorio, parse("/")
drop directorio

///////////////////////////////////////////////////////////   datos
gen dat = substr(v1, 1, strpos(v1, "./") - 1)
split dat, parse("[", "]")
gen datos = ltrim(dat2)
drop dat
drop dat1
drop dat2

gen peso = substr(datos, 1, strpos(datos, " ") - 1)
gen fecha = substr(datos, strpos(datos, " "), length(datos))    
drop datos


replace directorio1 = "" if  directorio1 == nombre + "." + tipo
replace directorio1 = "" if  directorio1 == nombre 

drop v1

//drop if mi(directorio9)

