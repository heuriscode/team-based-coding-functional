# Checks for existence of directory and data file
# Creates new directory if it doesn't exist
# Removes existing file if it exists
# Writes new data file to data/ directory

writeData = function(dat){
    #check if directory exists, if not create
    if(dir.exists(here("data"))){
        #if file exists then delete
        if(file.exists(here("data", "data.csv"))){
            file.remove(here("data", "data.csv"))
        }
    } else {
        dir.create(here("data"))
    }
    write.csv(dat, here("data", "data.csv"))
}