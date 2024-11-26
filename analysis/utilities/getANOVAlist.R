
getAnovaList = function(reglist, base_model_name){
    #user must supply one base_model_name
    # e.g. 'base_model_name = c("reg_base")'
    #base_model_name MUST be one of the names in reglist and reglist should be at least length of 2

    #Rows are extended models
    anova_res = c()

    reg_base = reglist[which(names(reglist) %in% base_model_name)]
    sublist = reglist[-which(names(reglist) %in% base_model_name)]
    for(i in 1:sublist){
        anova_res[[i]] = anova(reg_base, sublist[[i]])
    }

    return(anova_res)

}