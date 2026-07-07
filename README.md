# 🏭 Manufacturing Process Control (SQL)

## 📖 Business Problem

A manufacturing company wants to monitor product quality by analyzing the height of manufactured parts. The objective is to identify products whose measurements fall outside statistically acceptable control limits, helping detect potential issues in the production process before they become significant quality problems.

---

## 📊 Dataset

The analysis was performed using the following tables:

- `manufacturing_parts`

Main columns used:

- item_no
- operator
- height

---

## 🎯 Project Objectives

- Calculate a rolling average height for each operator.
- Calculate a rolling standard deviation.
- Compute Upper Control Limit (UCL) and Lower Control Limit (LCL).
- Flag products that fall outside statistical control limits.
- Filter incomplete rolling windows.

---

## 🛠 SQL Skills Demonstrated

- Window Functions
- ROW_NUMBER()
- AVG()
- STDDEV()
- CASE
- Nested Queries
- Common Table Expressions (CTEs)
- Statistical Process Control (SPC)

---

## 📈 Solution

The solution uses window functions to calculate rolling statistics for each operator over a five-row window. Based on these statistics, Upper Control Limits (UCL) and Lower Control Limits (LCL) are calculated. Finally, a boolean alert identifies measurements that fall outside the acceptable statistical range.

---

## 📁 Repository Structure

```
manufacturing-process-control-sql
│
├── README.md
├── manufacturing_process_control.sql
└── screenshots/
    └── final_result.png
```

---

## 📚 Key Learnings

This project strengthened my understanding of SQL window functions, rolling calculations, statistical analysis, nested queries, and business-oriented data analysis. It also reinforced the importance of structuring complex SQL queries using multiple logical steps to improve readability and maintainability.

---
