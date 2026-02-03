# Drug screen analysis code (CAN-25-3429R)

This folder contains the analysis materials used for the small-molecule drug screen described in **Figure 2** of the manuscript:

**“RB1 Deficiency in Osteosarcoma Confers Vulnerability to Targeting VCP through Competing Glutamine-mediated VCP Acetylation”**

## Contents
- `drug_screen_analysis.R`  
  R Markdown script used for data processing, RB1-selective sensitivity calculation, and figure generation.

- `data/Supplementary_Table_2.xlsx`  
  Source data for the compound screen (raw and/or normalized viability values depending on the sheet).

- `figures/Figure2_drug_screen.png`  
  Reference image of Figure 2 panels related to the drug screen.

## Analysis summary
The workflow implemented in `drug_screen_analysis.Rmd` includes:
1. Importing the drug screen table.
2. Normalization to plate-wise DMSO controls (as applicable based on the input sheet).
3. Calculation of RB1-selective drug sensitivity using:
   - **log2(cv_shRB1 / cv_shNC)** (or equivalent metric as used in the manuscript).
4. Ranking compounds by RB1-selective effects.
5. Generating plots corresponding to **Figure 2b (HOS)** and **Figure 2c (MG63)**.

## How to run (typical)
1. Open `drug_screen_analysis.R` in RStudio.
2. Adjust the input path to `data/Supplementary_Table_2.xlsx` if needed.
3. Knit the document or run chunks interactively.

> Note: The script reflects the workflow used during the study. Minor adjustments (e.g., file paths or package versions) may be required when running in a new environment.
