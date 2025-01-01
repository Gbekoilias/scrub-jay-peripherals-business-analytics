(* Define a function to import data from different file types *)
ClearAll[importData]
importData[filePath_String] := Module[{data},
    (* Check the file extension to determine the import method *)
    Switch[FileExtension[filePath],
        "csv", 
            data = Import[filePath, "CSV"], (* Import CSV file *)
        "xls" | "xlsx", 
            data = Import[filePath, "XLSX"], (* Import Excel file *)
        "txt", 
            data = Import[filePath, "Table"], (* Import text file with tabular data *)
        _, 
            Print["Unsupported file type: ", FileExtension[filePath]];
            Return[$Failed];
    ];
    
    (* Return the imported data *)
    Return[data];
]

(* Example usage of the importData function *)
(* Specify the path to your dataset here *)
filePath = "path/to/your/dataset.csv"; (* Update with your actual file path *)

(* Import the data *)
data = importData[filePath];

(* Check if data was imported successfully *)
If[data === $Failed,
    Print["Data import failed."],
    Print["Data imported successfully!"];
    Print[data]; (* Display the imported data *)
]

(* Further processing or analysis can be done here *)
