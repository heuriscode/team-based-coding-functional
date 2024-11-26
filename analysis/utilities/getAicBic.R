
getAicBic = function(reglist) {
    #AIC and BIC values for cleaned versus raw

    aic = bic = vector(length(reglist), mode = "list")
    names(aic) = names(bic) = names(reglist)

    for(model in 1:length(reglist)){
        aic[[model]] = AIC(reglist[[model]])
        bic[[model]] = BIC(reglist[[model]])
    }

    aic_bic_list = list(
        "aic" = aic,
        "bic" = bic
    )

    return(aic_bic_list)
}