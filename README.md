# Data Dungeon Warehouse

## Overview
A full-scale simulated analytics warehouse built from realistic dirty CSVs into a dimensional model using staging, dimensions, facts, and BI-ready marts.

## Structure

- `staging/`: Cleans raw data from the original CSVs (renaming, typecasting, trimming).
- `dimensions/`: Defines core lookup/reference entities used across the business.
- `facts/`: Models business events like orders using FK relations.
- `intermediate/`: Combines and transforms dimensional and fact data for logical outputs.
- `marts/`: Denormalized, business-facing tables for BI tools and reporting.

## Key Features

- Regex-based customer name cleaning ( staging model).
- Boolean logic for activity status.
- Customer LTV and product performance metrics.
- DBT modelling strategy

## ERD Diagram - Star Schema and Staging Models
![data-dungeon-database-erd](https://github.com/user-attachments/assets/7afa67b7-4e27-417c-bdad-33845a03300d)


## Learnings

- Complex querying requires query architecture, not just syntax
- Versioning is critical to avoid breaking existing models
- FK integrity must be respected even during refactors

## Known Issues

- Name parsing still has edge cases (e.g. hyphenated names, triple middle names)
- Email standardization logic could be extended
