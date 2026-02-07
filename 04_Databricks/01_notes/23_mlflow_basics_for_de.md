# 23 - MLflow Basics for Data Engineers (Bonus)

MLflow is mainly for ML, but Data Engineers should know basics because Databricks integrates MLflow deeply.

---

## 1) What is MLflow?
MLflow is an open-source platform for:
- experiment tracking
- model registry
- model deployment

Databricks has built-in MLflow support.

---

## 2) Why Data Engineers should know MLflow?
Because in real projects:
- DE builds features tables
- ML team trains models
- MLflow tracks models
- DE sometimes helps with deployment pipelines

---

## 3) Key MLflow Components

### 3.1 Tracking
Logs:
- parameters
- metrics
- artifacts

### 3.2 Model Registry
Stores models with versions:
- staging
- production

---

## 4) Simple Example (Concept)
```python
import mlflow

with mlflow.start_run():
    mlflow.log_param("algo", "xgboost")
    mlflow.log_metric("accuracy", 0.91)
```

---

## 5) Where MLflow fits in DE pipeline?
- feature engineering
- storing training datasets
- tracking pipeline runs

---

## 6) Interview Questions
### Q1) What is MLflow?
Experiment tracking + model registry platform.

### Q2) Is MLflow mandatory for DE?
Not mandatory, but good for Databricks ecosystem.

---

## 7) Summary
MLflow is a bonus topic for Databricks knowledge.

---

✅ Next: `24_unity_catalog_advanced.md`
