# DBT E-commerce Data Pipeline (`dbt_ecommerce_project`)

## 🎯 Project Overview

This dbt project implements a modern **Data Lakehouse architecture** (Bronze $\rightarrow$ Silver $\rightarrow$ Gold) for analyzing e-commerce transactions, products, customers, and regional data.

The primary goal is to transform raw operational data into high-value, business-ready fact and dimension tables, optimized for reporting and Business Intelligence (BI) tools.

## 💾 Architecture Layers (Bronze, Silver, Gold)

The project follows the standard medallion architecture, mapping models to distinct schemas:

| Layer | Schema | Materialization | Purpose | Key Models/Data |
| :--- | :--- | :--- | :--- | :--- |
| **BRONZE** | `BRONZE` | External Load | Raw, immutable data loaded directly from the source system (e.g., CSV, application database replica). | `customers`, `orders`, `products`, `regions` |
| **SILVER** | `SILVER` | View | Cleaning, standardization, data type casting, and light transformation. Acts as a reliable staging layer. | `stg_customers`, `stg_products`, `stg_orders`, `stg_regions` |
| **GOLD** | `GOLD` | Table | Final business logic, aggregation, and dimensional modeling (Star Schema). Optimized for BI queries. | `fact_sales`, `dim_customers` |



## ⚙️ Project Setup and Prerequisites

### Prerequisites

1.  **Git**
2.  **Python 3.8+**
3.  **dbt-core & dbt-snowflake** (`pip install dbt-snowflake`)
4.  **Snowflake Account** with a dedicated warehouse, user, and the necessary database/schemas (`BRONZE`, `SILVER`, `GOLD`).

### 1. Database Configuration

Ensure your Snowflake connection details are correctly configured in your `profiles.yml` file (typically located at `~/.dbt/profiles.yml`). The profile name must match the one specified in `dbt_project.yml` (`profile: 'dbt_project'`).

### 2. Install Dependencies

If you use any external packages, install them:

```bash
dbt deps
