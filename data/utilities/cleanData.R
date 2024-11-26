
cleanData = function(dat) {

    dat_clean = dat[-which(dat$REGION=="B"),]

    return(dat_clean)
    
}