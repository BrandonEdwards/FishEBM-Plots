#Packges to include
using Gadfly, DataFrames

#Edit this based on the name of the directory that you are going to get plots for
run = "run_1"

#Set the project paths
dirSep = ""
if OS_NAME == :Windows
  dirSep = "\\"
elseif OS_NAME == :Darwin
  dirSep = "/"
end
projPath = string(Base.source_path()) #find current project path
pathEndSearch = rsearch(projPath, dirSep)[1]
endOfDirPath = projPath[pathEndSearch:length(projPath)]
projPath = split(projPath, endOfDirPath)[1]
dataPath = string(projPath, dirSep, run)

#Include the files for the plots
include(string("src", dirSep, "yearlyPlots.jl"))
include(string("src", dirSep, "weeklyPlots.jl"))

#Output weekly data plots
weeklyAgePlot("ageSpecificSUMMARY.csv", "Weekly Adult Population")
weeklyAgePlot("harvestSUMMARY.csv", "Weekly Adult Harvest")
weeklyMortalityPlot("killedSUMMARY.csv", "Weekly Mortality Numbers")
weeklyAgePlot("spawnSUMMARY.csv", "Weekly Spawn Numbers")
weeklyStagePlot("stageSUMMARY.csv", "Weekly Stage Population")

#Output yearly data plots
yearlyAgePlot("yearlyAgeSpecificSUMMARY.csv", "Yearly Adult Population")
yearlyAgePlot("yearlyHarvestSUMMARY.csv", "Yearly Adult Harvest")
yearlyMortalityPlot("yearlyKilledSUMMARY.csv", "Yearly Mortality Numbers")
yearlyAgePlot("yearlySpawnSUMMARY.csv", "Yearly Spawn Numbers")
yearlyStagePlot("yearlyStageSUMMARY.csv", "Yearly Stage Population")

data = readtable(string(dataPath, dirSep, "ageSpecificSUMMARY.csv"))

size(data)[1] - 1
