source(here("analysis", "utilities", "getEquations.R"))

generateAnalysis = function() {
    
    #read in data
    data = read.csv(here("data", "data.csv"))

    #get equations
    equations_list = getEquations()

    #get base regressions
    reglist_raw = estimateOlsModels(
        eq_list = equations_list, 
        dat = data
        )
    
    #clean data - note that original data has issues
    data_clean = cleanData(data)

    #get clean data regressions
    reglist_clean = estimateOlsModels(
        eq_list = equations_list, 
        dat = data_clean
        )
    names(reglist_clean) = paste(names(reglist_clean), "_clean", sep="")
    
    #ANOVA
    anova_list_base = getAnova(base_reg = reglist_raw$reg_base, extended_regs = reglist_raw[-which(names(reglist_raw)=="reg_base")])
    anova_list_base = append(
        anova_list_base,
        getAnova(base_reg = reglist_raw$reg_base, extended_regs = reglist_raw[-which(names(reglist_raw)=="reg_base")])
}
# read in data


######## Regression tests ########



#AIC and BIC values for cleaned versus raw
aic_reg_base_raw = AIC(reg_base)
aic_reg_time_raw = AIC(reg_time)
aic_reg_fe_raw = AIC(reg_fe)
aic_reg_time_fe_raw = AIC(reg_time_fe)

aic_reg_base_clean = AIC(reg_base_clean)
aic_reg_time_clean = AIC(reg_time_clean)
aic_reg_fe_clean = AIC(reg_fe_clean)
aic_reg_time_fe_clean = AIC(reg_time_fe_clean)

bic_reg_base_raw = BIC(reg_base)
bic_reg_time_raw = BIC(reg_time)
bic_reg_fe_raw = BIC(reg_fe)
bic_reg_time_fe_raw = BIC(reg_time_fe)

bic_reg_base_clean = BIC(reg_base_clean)
bic_reg_time_clean = BIC(reg_time_clean)
bic_reg_fe_clean = BIC(reg_fe_clean)
bic_reg_time_fe_clean = BIC(reg_time_fe_clean)

######## Summary tables ##########