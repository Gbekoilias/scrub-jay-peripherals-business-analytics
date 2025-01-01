(* Define a structure for workflow steps *)
ClearAll[WorkflowStep]
WorkflowStep = {name::String, duration::Real, resourceUsage::Real}

(* Define a function to create a workflow *)
ClearAll[createWorkflow]
createWorkflow[steps_List] := Module[
    {workflow},
    workflow = Map[WorkflowStep, steps];
    Return[workflow];
]

(* Define a function to calculate total duration and resource usage *)
ClearAll[calculateMetrics]
calculateMetrics[workflow_List] := Module[
    {totalDuration, totalResourceUsage},
    
    totalDuration = Total[workflow.map(step -> step[2])]; (* Sum of durations *)
    totalResourceUsage = Total[workflow.map(step -> step[3])]; (* Sum of resource usages *)
    
    Return[{totalDuration, totalResourceUsage}];
]

(* Define optimization criteria *)
ClearAll[optimizationCriteria]
optimizationCriteria[workflow_List] := Module[
    {metrics},
    
    metrics = calculateMetrics[workflow];
    Return[metrics[1] + 0.5 * metrics[2]]; (* Objective function: minimize duration + 0.5 * resource usage *)
]

(* Define a function to optimize the workflow *)
ClearAll[optimizeWorkflow]
optimizeWorkflow[initialWorkflow_List] := Module[
    {optimizedWorkflow, result},
    
    result = NMinimize[
        optimizationCriteria[x],
        x,
        Method: "SimulatedAnnealing", (* Choose an appropriate optimization method *)
        Constraints: {x >= 0} (* Add constraints as needed *)
    ];
    
    optimizedWorkflow = result;
    Return[optimizedWorkflow];
]

(* Example usage of the workflow model *)
ClearAll[main]
main[] := Module[
    {steps, initialWorkflow, optimizedWorkflow},
    
    (* Define initial workflow steps: {name, duration, resource usage} *)
    steps = {
        {"Step 1", 5.0, 2.0},
        {"Step 2", 3.0, 1.5},
        {"Step 3", 4.0, 3.0},
        {"Step 4", 2.0, 1.0}
    };
    
    (* Create the initial workflow *)
    initialWorkflow = createWorkflow[steps];
    
    (* Print initial metrics *)
    Print["Initial Workflow Metrics:"];
    Print["--------------------------"];
    Print["Total Duration: ", calculateMetrics[initialWorkflow][1]];
    Print["Total Resource Usage: ", calculateMetrics[initialWorkflow][2]];
    
    (* Optimize the workflow *)
    optimizedWorkflow = optimizeWorkflow[initialWorkflow];
    
    (* Print optimized metrics *)
    Print["Optimized Workflow Metrics:"];
    Print["--------------------------"];
    Print["Optimized Duration: ", calculateMetrics[optimizedWorkflow][1]];
    Print["Optimized Resource Usage: ", calculateMetrics[optimizedWorkflow][2]];
]

(* Run the main function when the script is executed *)
main[]
