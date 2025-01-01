(* Function to calculate summary statistics for a dataset *)
ClearAll[calculateSummaryStatistics]
calculateSummaryStatistics[data_List] := Module[
    {meanValue, medianValue, modeValue, stdDev},
    
    (* Calculate mean *)
    meanValue = Mean[data];
    
    (* Calculate median *)
    medianValue = Median[data];
    
    (* Calculate mode *)
    modeValue = First@SortBy[GatherBy[data], -Length[#] &][[1]]; (* Mode calculation *)
    
    (* Calculate standard deviation *)
    stdDev = StandardDeviation[data];
    
    (* Return the results as an association for easy access *)
    Return[<|
        "Mean" -> meanValue,
        "Median" -> medianValue,
        "Mode" -> modeValue,
        "Standard Deviation" -> stdDev
    |>];
]

(* Example usage of the calculateSummaryStatistics function *)
(* Sample dataset for demonstration *)
data = {1, 2, 2, 3, 4, 5, 5, 5, 6}; 

(* Calculate summary statistics *)
statistics = calculateSummaryStatistics[data];

(* Display the results *)
Print["Summary Statistics:"];
Print[statistics];
