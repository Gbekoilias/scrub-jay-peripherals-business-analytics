# Scrub Jay Peripherals Business Plan

![Scrub Jay Peripherals](https://www.dailyeasternnews.com/wp-content/uploads/2024/10/BF_01_O-1.jpg) <!-- Replace with actual image URL -->

## Project Overview
This project focuses on creating an Excel workbook for Scrub Jay Peripherals, where entrepreneur Danilo Lewellen will summarize data, create projections, and perform calculations related to his innovative handheld controller for virtual reality gaming.

## Table of Contents
- [Project Steps](#project-steps)
- [Sales Projections Worksheet](#sales-projections-worksheet)
- [Cost Estimates Worksheet](#cost-estimates-worksheet)
- [Profit Projections Worksheet](#profit-projections-worksheet)
- [Getting Started](#getting-started)
- [Contributing](#contributing)
- [License](#license)

## Project Steps

1. **Sales Projections Worksheet**
   - Extend incremented percentages from B6:C6 to D6:H6.
   - Extend the list of years from A7:A8 to A9:A11.
   - Use AutoFill to fill A9:H11 with formatting from A7:H8.
   - In cell B8, create a formula that multiplies B7 by B6 and adds B7. Make the reference to row 6 absolute. Copy the formula to B9:B11, then to C8:H11.

2. **Cost Estimates Worksheet**
   - In cell A9, create an AVERAGE formula for A5:A7 and copy to D9.
   - In cell A10, create a MAX formula for A5:A7 and copy to D10.
   - In cell A11, create a MIN formula for A5:A7 and copy to D11.
   - In cell B13, create a VLOOKUP formula that looks up A11 in A5:B7, returning column 2 with an exact match, and copy to E13.

3. **Profit Projections Worksheet**
   - In cell H5, use the TODAY function to insert the current date.
   - In cell H7, create a NETWORKDAYS formula to calculate working days between H5 and H6.
   - Extend incremented percentages from B12:C12 to D12:H12.
   - Extend the list of years from A13:A14 to A15:A17.
   - In cell B13, create a formula that subtracts B5 and B7 from B6 and multiplies by B8, using absolute references. Copy to C13:H13.
   - In cell B14, create a formula that adds 1 to B12 and multiplies by B13, updating B12 to an absolute reference. Copy to B15:B17 and then C14:H17.
   - Delete row 19.

## Getting Started

To get started with this project, clone this repository and open the Excel workbook to view the sales projections, cost estimates, and profit projections.

```bash
git clone https://github.com/yourusername/scrub-jay-peripherals-business-plan.git
```

## Contributing

If you would like to contribute to this project, please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
