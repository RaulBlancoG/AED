
// Primero se hizo una base "master" de las variables de los distintos demandados 
// (usando el comando "reshape" de wide a long )que contiene las variables 
// demandado_d & demandado_id (usando group(varlist)

import delimited C:\Users\joyce\Downloads\scaleup_hd.csv, clear

// merge con variable de actor
merge m:1 nombre_ac using C:\Users\joyce\Downloads\bases_id\actor_id.dta, nogenerate keep(1 3)
rename id_emp id_actor_m
drop if _n > 5005

// merge con todas las variables de demandados (6 variables)			 

forvalues i=1/6 {
	rename nombre_d`i' nombre_d 
	merge m:1 nombre_d using C:\Users\joyce\Downloads\bases_id\demandado_id.dta, nogenerate keep(1 3)
	rename nombre_d nombre_d`i' 
	rename id_dem id_dem_`i'
	}


// merge con todas las variables de abogados (3 variables)

forvalues i=1/3 {
    rename nombre_abogado`i'_ac nombre_abogadoac
    merge m:1 nombre_abogadoac using C:\Users\joyce\Downloads\bases_id\abogado_id.dta, nogenerate keep(1 3)
    rename nombre_abogadoac nombre_abogado`i'_ac 
    rename id_abogado id_abogado`i'
    }


// merge con variable de despacho
merge m:1 despacho_ac using C:\Users\joyce\Downloads\despacho_id.dta, nogenerate keep(1 3)


// Separar las variables de persona que despide y luego hacer merge con demandados

split nombre_despido, parse( ";" "; " "," ", " " Y ")
forvalues i=1/7 {
rename nombre_despido`i' nombre_d 
merge m:1 nombre_d using C:\Users\joyce\Downloads\bases_id\demandado_id.dta, nogenerate keep(1 3)
rename nombre_d nombre_despido`i' 
rename id_dem id_desp`i'
}


order clave ///
capturista ///
fecha_captura ///
observaciones ///
junta ///
exp ///
anio ///
id_actor ///
id_actor_m ///
fecha_incompetencia ///
fecha_demanda ///
prevencion ///
tipo_prevencion ///
fecha_auto ///
fecha_primera_audiencia_auto ///
fecha_primera_audiencia ///
fecha_primera_audiencia_patron ///
fecha_ultima_audiencia ///
cierres_instruccion ///
fecha_ultimo_cierre ///
audiencias ///
diferimientos ///
actores_capturados ///
contador_actor ///
num_actores ///
num_demandados ///
nombre_ac ///
correccion_nombre_ac ///
calle_ac ///
colonia_ac ///
delegacion_actor ///
correccion_dir_ac ///
nombre_d1 ///
id_dem_1 ///
tipo_d1 ///
calle_d1 ///
colonia_d1 ///
delegacion_d1 ///
fecha_desist_d1 ///
nombre_d2 ///
id_dem_2 ///
tipo_d2 ///
calle_d2 ///
colonia_d2 ///
delegacion_d2 ///
fecha_desist_d2 ///
nombre_d3 ///
id_dem_3 ///
tipo_d3 ///
calle_d3 ///
colonia_d3 ///
delegacion_d3 ///
fecha_desist_d3 ///
nombre_d4 ///
id_dem_4 ///
tipo_d4 ///
calle_d4 ///
colonia_d4 ///
delegacion_d4 ///
fecha_desist_d4 ///
nombre_d5 ///
id_dem_5 ///
tipo_d5 ///
calle_d5 ///
colonia_d5 ///
delegacion_d5 ///
fecha_desist_d5 ///
nombre_d6 ///
id_dem_6 ///
tipo_d6 ///
calle_d6 ///
colonia_d6 ///
delegacion_d6 ///
fecha_desist_d6 ///
correccion_nombre_d ///
correccion_dir_d ///
tipo_abogado_ac ///
id_desp1 ///
id_desp2 ///
id_desp3 ///
id_desp4 ///
id_desp5 ///
id_desp6 ///
id_desp7 ///
id_abogado1 ///
id_abogado2 ///
id_abogado3 ///
nombre_abogado1_ac ///
nombre_abogado2_ac ///
nombre_abogado3_ac ///
tipo_abogadon_ac ///
nombre_abogadon1_ac ///
nombre_abogadon2_ac ///
nombre_abogadon3_ac ///
cambio_abogado_ac ///
despacho_ac ///
id_despacho ///
despacho_d ///
apoderado_d ///
reclutamiento ///
giro_empresa ///
trabajador_base ///
categoria ///
profesion ///
salario ///
fecha_entrada ///
fecha_salida ///
hr_despido ///
nombre_despido ///
antig ///
antig_meses ///
antig_semanas ///
antig_dias ///
accion_principal ///
causa ///
especifique ///
salario_base ///
per_salario_base ///
salario_base_diario ///
salario_int ///
per_salario_int ///
salario_int_diario ///
salario_diario ///
salario_hr ///
concepto_1 ///
concepto_2 ///
concepto_3 ///
concepto_4 ///
concepto_5 ///
concepto_6 ///
proyecto ///
sueldo ///
afiliacion_imss ///
gen ///
anio_nac ///
tipo_jornada ///
horas_sem ///
per_horas ///
reinst ///
indem ///
monto_indem ///
sal_caidos ///
monto_sal_caidos ///
prima_antig ///
monto_prima_antig ///
fecha_inic_vac ///
fecha_fin_vac ///
dias_vac ///
monto_vac ///
prima_vac ///
monto_prima_vac ///
fecha_inic_ag ///
fecha_fin_ag ///
dias_ag ///
monto_ag ///
hextra ///
hextra_sem ///
hextra_ley ///
hextra_doble ///
hextra_triple ///
monto_hextra_sem ///
hextra_total_sem ///
monto_hextra_total ///
hextra_total ///
rec20 ///
monto_rec20 ///
prima_dom ///
monto_prima_dom ///
desc_sem ///
monto_desc_sem ///
desc_ob ///
monto_desc_ob ///
sarimssinf ///
utilidades ///
monto_utilidades ///
monto_recsueldo ///
nulidad ///
fecha_termino ///
modo_termino ///
liq_total ///
id_exp ///
c_antiguedad ///
duracion ///
salario_minimo ///
c_indem ///
c_prima_antig ///
c_rec20 ///
c_ag ///
c_vac ///
c_hextra ///
c_prima_vac ///
c_prima_dom ///
c_desc_sem ///
c_desc_ob ///
c_utilidades ///
c_recsueldo ///
c_total ///
min_indem ///
min_prima_antig ///
min_ag ///
min_vac ///
min_prima_vac ///
min_ley ///
c_sal_caidos ///
tope ///
liq_total_tope ///
vac ///
ag ///
codem ///
grado_exag ///
top_despacho_ac ///
liq_total_pos ///
abogado_pub ///
prop_hextra ///
exag_general ///
edad ///
comp_laudogana_p1 ///
prob_laudogana_p1 ///
prob_laudopierde_p1 ///
comp_esp_p1 ///
prob_laudopierde_p2 ///
prob_laudogana_p2 ///
comp_laudogana_p2 ///
comp_convenio_p2 ///
comp_esp_p2 

drop tipo_abogado* ///
nombre_abogado* ///
despacho_ac ///
despacho_d ///
nombre_ac* ///
nombre_d* ///
nombre_desp* ///
calle_* ///
apoderado_d


save "C:\Users\joyce\Downloads\hd_anon.dta", replace
export delimited using "C:\Users\joyce\Downloads\hd_anon.csv", replace
