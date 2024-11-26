## Head script - calls relevant scripts

# libraries
require(here)

# source scripts
source(here("data", "generateData.R"))
source(here("analysis", "generateAnalysis.R"))
source(here("results", "generateResults.R"))

## create data - run if data needs updating or on first creation
generateData()

## analysis
generateAnalysis()

## create results
generateResults()