

getEquations = function() {
    
# specify equations
base = OUTPUT_TONNES ~ RAINFALL_PERCENTILE + LABOUR_DAYS + IRRIGATION_BOOLEAN
time = OUTPUT_TONNES ~ YEAR + RAINFALL_PERCENTILE + LABOUR_DAYS + IRRIGATION_BOOLEAN
fe = OUTPUT_TONNES ~ REGION + RAINFALL_PERCENTILE + LABOUR_DAYS + IRRIGATION_BOOLEAN
time_fe = OUTPUT_TONNES ~ YEAR + REGION + RAINFALL_PERCENTILE + LABOUR_DAYS + IRRIGATION_BOOLEAN

equations_list = list(
    "base" = base,
    "time" = time,
    "fe" = fe,
    "time_fe" = time_fe
    )

return(equations_list)

}