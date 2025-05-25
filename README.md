# Data Dungeon Warehouse

A mini data warehouse built in PostgreSQL using a dbt-style structure, synthetic CSV data, and dimensional modelling techniques. This project simulates the messy realities of real-world data and showcases a layered, backend-minded approach to warehouse design.

##  Tech Stack

- **PostgreSQL** (SQL database + queries)
- **PlantUML** (ERD diagram)
- **Handwritten dbt-style structure** (modular SQL layering, no dbt required)

## Project Overview

This portfolio project reflects my learning journey in data engineering and analytics engineering. The goal: simulate a realistic analytics scenario using synthetic "dirty" CSVs and apply best practices in data cleaning, dimensional modelling, and SQL logic structuring.

### Architecture

- **Staging Layer**: Raw ingestion and basic typecasting
- **Intermediate Layer**: Business logic and cleaned fields
- **Dimensions**: Conformed reference tables (e.g., `dim_customers`, `dim_products`)
- **Facts**: Numeric aggregates with keys (e.g., `fact_orders`)
- **Marts**: BI-ready views for analytics

> The structure mimics a dbt pipeline but is fully written and run manually in PostgreSQL.

### Entity-Relationship Diagram (ERD)

![data-dungeon-database-erd](https://github.com/user-attachments/assets/7afa67b7-4e27-417c-bdad-33845a03300d)

## Testing & Validation

This project includes basic schema-level data validation:

- NOT NULL constraints to ensure critical fields are populated, with default values for consistency

- CHECK constraints for simple rule enforcement (e.g., values within valid ranges)

- Manual validation steps (e.g., row counts, duplicates) at key stages in the pipeline

- Future versions will explore dbt-style tests or scripting-based data quality checks.

## Folder Structure

├── staging/ # Raw ingestion and early cleans
├── intermediate/ # Business logic and joins
├── dimensions/ # Reference tables
├── facts/ # Aggregated transaction tables
├── marts/ # Final analytics layer
└── data/ # Synthetic CSVs



## Why This Project?

I built this to:
- Apply my backend systems thinking in a real use case
- Practice dimensional modelling from scratch
- Show that I understand real-world warehouse layering and SQL design, as well as BI logic

This project, along with [apprentice-success-tracker](https://github.com/ray-dataworks1/apprentice-success-tracker), forms part of my data portfolio as I transition into Analytics Engineering roles.

## Next Steps
- Experiment with dbt or Airflow to automate pipelines
- Add a dashboard layer or connect to a BI tool

---

Built by [ray-dataworks1](https://github.com/ray-dataworks1), powered by PostgreSQL and persistence.


