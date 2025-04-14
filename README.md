
#  ⏰ Does Time Matter? Investigating Surgical Timing & Post-Op Complication Risks

_Analyzing how the timing of surgery—time of day, day of week, month, and moon phase—affects in-hospital complication rates using real-world surgical data._

By **Anandi Ganguli** 

---

## 📌 Overview

This project explores whether **non-clinical temporal factors** influence in-hospital complication risks. Using a real surgical dataset, the analysis investigates:

- ⏳ Does **time of day** (before vs after noon) influence post-op complications?
- 📅 Are certain **days of the week** or **months** associated with higher risk?
- 🌕 Could **moon phases** play a role (as popularly rumored)?

**Approach**: Logistic regression models, Chi-square tests, and descriptive statistics  
**Tools used**: Base R (no external packages)  
**Data source**: De-identified educational dataset from Dr. Daniel Sessler’s study (2011)

---

## 📂 Repository Structure

| Branch   | Contents |
|----------|----------|
| `data`   | Dataset (`Surgery Timing.csv`), Data Dictionary, Dataset Introduction PDFs |
| `scripts`| R script (`Surgery_Timing.R`) containing the complete cleaned and annotated workflow |

---

## 🔍 Key Findings

### 🏥 Complication Risks & Temporal Factors

- **Time of Day**: Surgeries conducted **before noon** had slightly **lower odds of complications** (p = 0.00065).
- **Day of Week**: Significant variation by weekday (p < 0.001), with **Wednesdays** showing higher complication odds.
- **Month of Year**: Some months (March, April, November) had **statistically lower odds** compared to January.
- **Moon Phase**: No significant association found (p = 0.22).

### 💡 Summary Statistics

- **Sample size**: 32,001 surgeries  
- **Overall complication rate**: ~13%  
- **Demographics**:
  - Gender: ~53% Female, ~47% Male
  - Race: ~82% Caucasian, ~13% African American, rest Other
  - ASA status: Most patients were ASA I–II or III

---

## 🧪 Methods Used

| Step                  | Technique                         |
|-----------------------|-----------------------------------|
| Data Cleaning         | Base R `factor`, `ifelse`, recoding |
| Summary Statistics    | `table()`, `tapply()`             |
| Association Tests     | `chisq.test()`                    |
| Logistic Regression   | `glm(family = binomial)`          |
| Variables Modeled     | `TimeOfDay`, `dow`, `month`, `moonphase` |

---


### 🌍 Real-World Applications

🏥 **Operational Strategy**: Helps hospitals identify high-risk time windows to optimize staffing, scheduling, and post-op care.

📊 **Policy Insight**: Reinforces the need to examine systemic, temporal factors when evaluating surgical quality metrics.

🔬 **Hypothesis Generation**: Encourages further study into non-clinical determinants of surgical outcomes, particularly in busy or under-resourced settings.

---

### 📌 Data Source & License

The dataset is publicly available for academic use, originally created by Dr. Daniel Sessler and collaborators for clinical research:

> Sessler DI, et al. *Operation Timing and 30-Day Mortality*. Anesthesia & Analgesia. 2011.

Used in educational settings including Harvard and UNC public health programs.

---

### 👩‍💻 Author

**Anandi Ganguli**  
MPH – Epidemiology | University of Minnesota  




