## generates vector of IDs

getIDs = function(group_keys, obs_in_groups, years) {
    #get ints for sampling to generate unique values
    ints = seq(1,100,1)

    idvec = c()
        for (lll in 1:length(group_keys)){
            for(iii in 1:obs_in_groups[lll]){
                ints_group = sample(ints,obs_in_groups[lll])
                for(yyy in 1:years){
                    id = paste(group_keys[lll], ints_group[iii], sep="")
                    idvec = append(idvec, id)
                }
            }
        }
    return(idvec)
}