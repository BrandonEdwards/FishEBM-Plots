function yearlyAgePlot(filename::ASCIIString, plotName::ASCIIString)
  data = readtable(string(dataPath, dirSep, filename))
  plotOutput = plot(data, Theme(plot_padding=5px),
                          layer(x="Year", y="Age2", Geom.line, Theme(default_color=color("blue"))),
                          layer(x="Year", y="Age3", Geom.line, Theme(default_color=color("green"))),
                          layer(x="Year", y="Age4", Geom.line, Theme(default_color=color("red"))),
                          layer(x="Year", y="Age5", Geom.line, Theme(default_color=color("purple"))),
                          layer(x="Year", y="Age6", Geom.line, Theme(default_color=color("grey"))),
                          layer(x="Year", y="Age7", Geom.line, Theme(default_color=color("brown"))),
                          layer(x="Year", y="Age8Plus", Geom.line, Theme(default_color=color("orange"))),
                          layer(x="Year", y="Total", Geom.line, Theme(default_color=color("black"))),
                          Scale.x_continuous(minvalue = 0, maxvalue = size(data)[1] - 1),
                          Guide.XLabel("Year"),
                          Guide.YLabel("Population"),
                          Guide.Title(plotName),
                          Guide.manual_color_key("Legend", ["Age2", "Age3", "Age4", "Age5", "Age6", "Age7", "Age8Plus", "Total"],
                                                  ["blue", "green", "red", "purple", "grey", "brown", "orange", "black"]))

  draw(PNG(string(projPath, dirSep, "output", dirSep, filename, ".png"), 6inch, 3inch), plotOutput)
end

function yearlyMortalityPlot(filename::ASCIIString, plotName::ASCIIString)
  data = readtable(string(dataPath, dirSep, filename))
  plotOutput = plot(data, Theme(plot_padding = 5px),
                              layer(x="Year", y="Natural", Geom.line, Theme(default_color=color("blue"))),
                              layer(x="Year", y="Extra", Geom.line, Theme(default_color=color("green"))),
                              layer(x="Year", y="Compensatory", Geom.line, Theme(default_color=color("red"))),
                              layer(x="Year", y="Total", Geom.line, Theme(default_color=color("black"))),
                              Scale.x_continuous(minvalue = 0, maxvalue = size(data)[1] - 1),
                              Guide.XLabel("Year"),
                              Guide.YLabel("Mortalities"),
                              Guide.Title(plotName),
                              Guide.manual_color_key("Legend", ["Natural", "Extra", "Compensatory", "Total"],
                                                    ["blue", "green", "red", "black"]))
  draw(PNG(string(projPath, dirSep, "output", dirSep, filename, ".png"), 6inch, 3inch), plotOutput)
end

function yearlyStagePlot(filename::ASCIIString, plotName::ASCIIString)
  data = readtable(string(dataPath, dirSep, filename))
  plotOutput = plot(data, Theme(plot_padding = 5px),
                              layer(x="Year", y="Stage1", Geom.line, Theme(default_color=color("blue"))),
                              layer(x="Year", y="Stage2", Geom.line, Theme(default_color=color("green"))),
                              layer(x="Year", y="Stage3", Geom.line, Theme(default_color=color("red"))),
                              layer(x="Year", y="Stage4", Geom.line, Theme(default_color=color("purple"))),
                              layer(x="Year", y="Total", Geom.line, Theme(default_color=color("black"))),
                              Scale.x_continuous(minvalue = 0, maxvalue = size(data)[1] - 1),
                              Guide.XLabel("Year"),
                              Guide.YLabel("Population"),
                              Guide.Title(string(plotName)),
                              Guide.manual_color_key("Legend", ["Stage1", "Stage2", "Stage3", "Stage4", "Total"],
                                                    ["blue", "green", "red", "purple", "black"]))
  draw(PNG(string(projPath, dirSep, "output", dirSep, filename, ".png"), 6inch, 3inch), plotOutput)
end
