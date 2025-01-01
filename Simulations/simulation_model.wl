(* Define a function to run simulations based on given parameters *)
ClearAll[runSimulation]
runSimulation[parameters_List, numSimulations_Integer] := Module[
    {simulationResults, mean, stdDev, distribution},
    
    (* Extract parameters *)
    mean = parameters[[1]];
    stdDev = parameters[[2]];
    
    (* Define a normal distribution based on the parameters *)
    distribution = NormalDistribution[mean, stdDev];

    (* Run the simulations *)
    simulationResults = Table[
        RandomVariate[distribution], 
        {numSimulations}
    ];

    Return[simulationResults];
]

(* Define a function to calculate the expected value of a scenario *)
ClearAll[calculateExpectedValue]
calculateExpectedValue[parameters_List] := Module[
    {mean, stdDev, expectedValue},
    
    (* Extract parameters *)
    mean = parameters[[1]];
    stdDev = parameters[[2]];
    
    (* Calculate expected value using NIntegrate *)
    expectedValue = NIntegrate[
        x * PDF[NormalDistribution[mean, stdDev], x], 
        {x, -Infinity, Infinity}
    ];
    
    Return[expectedValue];
]

(* Example usage of the simulation functions *)
(* Define simulation parameters: mean and standard deviation *)
parameters = {100, 15}; (* Example: mean = 100, stdDev = 15 *)

(* Run the simulation with 1000 iterations *)
simulationResults = runSimulation[parameters, 1000];

(* Calculate the expected value for the scenario *)
expectedValue = calculateExpectedValue[parameters];

(* Display results *)
Print["Simulation Results (first 10): ", Take[simulationResults, 10]];
Print["Expected Value: ", expectedValue];
