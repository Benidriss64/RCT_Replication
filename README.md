# Replication: Nudging Farmers to Use Fertilizer

## 📌 Project Overview

This project replicates key empirical results from the paper:

**Duflo, Kremer, and Robinson (2011)**  
*Nudging Farmers to Use Fertilizer: Theory and Experimental Evidence from Kenya*  
Published in the American Economic Review.

The objective is to reproduce:
- Descriptive statistics (Table 1)
- Pre-treatment balance checks (Table 3)
- Main treatment effects from the Randomized Controlled Trial (Table 4)

All analyses are implemented in **Stata 16**.

---

## 📂 Data

The replication uses the following datasets:

- `SAFI_main_dataset_AER.dta` → Main dataset (RCT analysis)
- `time_buying_fert_AER.dta` → Fertilizer purchase timing

Make sure these files are located in your working directory before running the code.

---

## ⚙️ Requirements

- Stata 16 or anover version
- Basic knowledge of econometrics and RCTs

---

## ▶️ How to Run

1. Open Stata
2. Set the working directory:

```stata
cd "your/path/to/project"
