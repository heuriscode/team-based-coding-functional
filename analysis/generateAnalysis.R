source(here("analysis", "utilities", "getEquations.R"))
source(here("analysis", "utilities", "getAnovaList.R"))
source(here("analysis", "utilities", "estimateOlsModels.R"))
source(here("data", "utilities", "cleanData.R"))
source(here("analysis", "utilities", "getAicBic.R"))

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

    #ANOVA
    anova_list = getAnovaList(
        reglist_raw,
        reglist_clean
    )

    #AIC and BIC
    aic_bic_list_raw = getAicBic(reglist_raw)
    aic_bic_list_clean = getAicBic(reglist_clean)

    save(
        reglist_raw,
        reglist_clean,
        anova_list,
        aic_bic_list_raw,
        aic_bic_list_clean,
        file = here("results", "model and test results.Rdata")
    )
}
