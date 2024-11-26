## generates a groups

getGroups = function(group_keys, obs_in_groups, years) {
    #create groups associated with ID for use in a regions variable
    groupsvec = c(
        rep(group_keys[1], obs_in_groups[1]*years),
        rep(group_keys[2], obs_in_groups[2]*years),
        rep(group_keys[3], obs_in_groups[3]*years),
        rep(group_keys[4], obs_in_groups[4]*years),
        rep(group_keys[5], obs_in_groups[5]*years)
    )

    return(groupsvec)
}