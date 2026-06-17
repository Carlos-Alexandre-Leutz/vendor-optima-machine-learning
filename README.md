# Vendor-Optima: Predictive Analytics for Educational Procurement (Simulated Case Study)

**Access the Live Project:** [https://carlos-alexandre-leutz.github.io/vendor-optima-machine-learning/](https://carlos-alexandre-leutz.github.io/vendor-optima-machine-learning/)

## Overview
This is a personal **Proof of Concept (POC)** proposal demonstrating an advanced approach to procurement in the educational publishing sector. Managing a large-scale annual budget requires more than just evaluating nominal "sticker prices." This project leverages Machine Learning to identify the "Real Cost" of suppliers, moving beyond basic pricing to account for operational overheads like rework, quality indexing, and project delays.

> **Note on Data:** *This project is a simulated case study for educational purposes. It utilizes synthetic data and does not contain any real, proprietary, or sensitive financial information from any company.*

## The Problem: The "Cheap that costs more" Paradox
Relying solely on the lowest bid often leads to significant hidden costs:
* **Rework Costs:** Content returned multiple times for corrections drains valuable internal team time.
* **Delay Costs:** Missed deadlines disrupt the entire editorial chain, delaying product launches.
* **The Paradox:** A supplier with a higher initial fee but a zero-rework record is often mathematically cheaper than a "low-cost" supplier who requires constant hand-holding and recurring revisions.

## The Solution
We implemented a computational intelligence model using Python and Scikit-Learn that analyzes a multidimensional data matrix of suppliers. Instead of isolated KPIs, the system predicts the best cost-benefit ratio for each specific project based on four pillars:

1. **Historical Pricing:** Identifying consistent and fair pricing trends.
2. **Quality Index:** Cross-referencing price with technical quality grades.
3. **Delay Financial Impact:** Converting "days late" into actual operational loss (re-planning costs).
4. **Rework Financial Impact:** Calculating the man-hours lost to internal revisions.

### The Mathematical Engine
The system calculates the **Final Real Cost** using the following logic:
$$\text{Final Real Cost} = \text{Sticker Price} + (\text{Time Lost in Errors/Delays} \times \text{Internal Hourly Rate})$$

## Technical Architecture
* **Language:** Python
* **Machine Learning:** Scikit-Learn (Linear Regression for predictive cost modeling)
* **Data Analysis:** Pandas (Multi-dimensional data processing)
* **Database:** PostgreSQL (Cloud-based on Render)
* **API:** Flask (RESTful service providing efficiency ranking)

## Estimated Financial Impact (ROI)
By transitioning to predictive hiring, the model provides a framework for potential savings on large-scale budgets:

| Scenario | Efficiency Gain | Estimated Savings |
| :--- | :--- | :--- |
| **Conservative** | 2% | Projected Savings |
| **Moderate** | 3.5% | Projected Savings |
| **Optimistic** | 5% | Projected Savings |

*In addition to direct budget savings, we estimate a ~20% increase in team productivity by reducing time spent on "crisis management" and rework.*

---

## Strategic Implementation

### Strategy 1: Operational Efficiency (Time → Budget)
Focuses on eliminating rework. The algorithm prioritizes suppliers with a history of perfect delivery.
* **Gain:** ~20% increase in team bandwidth.

### Strategy 2: Cash Optimization (Budget → Time)
Focuses on the best "Sticker Price" vs. "Technical Quality" ratio, identifying "hidden gems" in the market.
* **Gain:** Aggressive reduction of nominal contract values.

> *Disclaimer: These percentages are based on predictive theoretical scenarios. The algorithm serves as an optimization compass, supporting human decision-making.*

---

## How to use
This project is containerized. To run locally:

1. Clone the repository.
2. Ensure you have Docker installed.
3. Run `docker-compose up`.
4. The API will be available on `localhost:5000`.

---
*Developed for Operational Excellence 2027.*