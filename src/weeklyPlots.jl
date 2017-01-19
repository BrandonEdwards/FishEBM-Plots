function weeklyAgePlot(filename::ASCIIString, plotName::ASCIIString)
  data = readtable(string(dataPath, dirSep, filename))
  plotOutput = plot(data, Theme(plot_padding = 5px),
                              layer(x="Week", y="Age2", Geom.line, Theme(default_color=color("blue"))),
                              layer(x="Week", y="Age3", Geom.line, Theme(default_color=color("green"))),
                              layer(x="Week", y="Age4", Geom.line, Theme(default_color=color("red"))),
                              layer(x="Week", y="Age5", Geom.line, Theme(default_color=color("purple"))),
                              layer(x="Week", y="Age6", Geom.line, Theme(default_color=color("grey"))),
                              layer(x="Week", y="Age7", Geom.line, Theme(default_color=color("brown"))),
                              layer(x="Week", y="Age8Plus", Geom.line, Theme(default_color=color("orange"))),
                              layer(x="Week", y="Total", Geom.line, Theme(default_color=color("black"))),
                              Scale.x_continuous(format=:plain, minvalue = 0, maxvalue = size(data)[1] - 1),
                              Guide.XLabel("Week"),
                              Guide.YLabel("Population"),
                              Guide.Title(plotName),
                              Guide.manual_color_key("Legend", ["Age2", "Age3", "Age4", "Age5", "Age6", "Age7", "Age8Plus", "Total"],
                                                    ["blue", "green", "red", "purple", "grey", "brown", "orange", "black"]))
  draw(PNG(string(projPath, dirSep, "output", dirSep, filename, ".png"), 6inch, 3inch), plotOutput)
end

function weeklyMortalityPlot(filename::ASCIIString, plotName::ASCIIString)
  data = readtable(string(dataPath, dirSep, filename))
  plotOutput = plot(data, Theme(plot_padding = 5px),
                              layer(x="Week", y="Natural", Geom.line, Theme(default_color=color("blue"))),
                              layer(x="Week", y="Extra", Geom.line, Theme(default_color=color("green"))),
                              layer(x="Week", y="Compensatory", Geom.line, Theme(default_color=color("red"))),
                              layer(x="Week", y="Total", Geom.line, Theme(default_color=color("black"))),
                              Scale.x_continuous(format=:plain, minvalue = 0, maxvalue = size(data)[1] - 1),
                              Guide.XLabel("Week"),
                              Guide.YLabel("Mortalities"),
                              Guide.Title(plotName),
                              Guide.manual_color_key("Legend", ["Natural", "Extra", "Compensatory", "Total"],
                                                    ["blue", "green", "red", "black"]))
  draw(PNG(string(projPath, dirSep, "output", dirSep, filename, ".png"), 6inch, 3inch), plotOutput)
end

function weeklyStagePlot(filename::ASCIIString, plotName::ASCIIString)
  data = readtable(string(dataPath, dirSep, filename))
  plotOutput = plot(data, Theme(plot_padding = 5px),
                              layer(x="Week", y="Stage1", Geom.line, Theme(default_color=color("blue"))),
                              layer(x="Week", y="Stage2", Geom.line, Theme(default_color=color("green"))),
                              layer(x="Week", y="Stage3", Geom.line, Theme(default_color=color("red"))),
                              layer(x="Week", y="Stage4", Geom.line, Theme(default_color=color("purple"))),
                              layer(x="Week", y="Total", Geom.line, Theme(default_color=color("black"))),
                              Scale.x_continuous(format=:plain, minvalue = 0, maxvalue = size(data)[1] - 1),
                              Guide.XLabel("Week"),
                              Guide.YLabel("Population"),
                              Guide.Title(string(plotName)),
                              Guide.manual_color_key("Legend", ["Stage1", "Stage2", "Stage3", "Stage4", "Total"],
                                                    ["blue", "green", "red", "purple", "black"]))
  draw(PNG(string(projPath, dirSep, "output", dirSep, filename, ".png"), 6inch, 3inch), plotOutput)
end
