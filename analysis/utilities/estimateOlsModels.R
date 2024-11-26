
estimateOlsModels = function(eq_list, dat){

    regression_list=vector(length=length(eq_list), mode = "list")

    for(eq in 1:length(eq_list)){
        reg = lm(eq_list[[eq]], data=dat)
        regression_list[[eq]] = reg
    }

    names(regression_list) = names(eq_list)

    return(regression_list)
}