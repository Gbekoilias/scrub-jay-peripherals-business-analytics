(* Function to create visualizations based on simulation results *)
ClearAll[createVisualization]
createVisualization[plotData_List, chartType_String] := Module[
    {plot},
    
    (* Choose the type of chart based on the chartType variable *)
    Switch[chartType,
        "ListPlot",
            plot = ListPlot[plotData, 
                PlotStyle -> {Blue, PointSize[Medium]}, 
                AxesLabel -> {"Simulation Index", "Value"}, 
                PlotLabel -> "List Plot of Simulation Results"
            ];
        
        "BarChart",
            plot = BarChart[plotData, 
                ChartStyle -> Blue, 
                AxesLabel -> {"Simulation Index", "Value"}, 
                PlotLabel -> "Bar Chart of Simulation Results"
            ];
        
        "Histogram",
            plot = Histogram[plotData, 
                ChartStyle -> Blue, 
                AxesLabel -> {"Value", "Frequency"}, 
                PlotLabel -> "Histogram of Simulation Results"
            ];
        
        _, 
            Print["Unsupported chart type: ", chartType];
            Return[$Failed];
    ];
    
    (* Display the plot *)
    Return[plot];
]

(* Example usage of the createVisualization function *)
(* Sample data: simulation results from a previous analysis *)
simulationResults = RandomVariate[NormalDistribution[100, 15], 1000]; (* Example data *)

(* Create a visualization *)
chartType = "Histogram"; (* Change to "ListPlot" or "BarChart" as needed *)
visualization = createVisualization[simulationResults, chartType];

(* Display the visualization *)
If[visualization === $Failed,
    Print["Visualization failed."],
    Print[visualization]; (* Display the generated plot *)
]
