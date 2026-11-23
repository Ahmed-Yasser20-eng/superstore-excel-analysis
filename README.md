# Superstore Sales & Profit Performance

An Excel analysis project connecting raw sales transactions, Power Query preparation, a data model and interactive reporting.

**Tools:** Microsoft Excel, Power Query, Power Pivot, PivotTables, PivotCharts, slicers and timelines.

![Sales and profit dashboard](https://github.com/Ahmed-Yasser20-eng/superstore-excel-analysis/releases/download/v0.1.0/24-dashboard-overview.jpg)

## Business questions

- Which products, customers and regions contribute profit?
- How does profit change across years and quarters?
- How do sales scale and profitability differ across categories and customer segments?
- Which returned products deserve further investigation?

## Project architecture

![Project architecture](https://github.com/Ahmed-Yasser20-eng/superstore-excel-analysis/releases/download/v0.1.0/23-architecture.png)

```mermaid
flowchart TD
    A["Source XLS: Orders / People / Returns"]
    B["Power Query: types, names, duplicates, blanks, text cleanup"]
    C["Orders_details / Sales_Rep / Returns queries"]
    D["Excel data model and cached data"]
    E["12 PivotTables, charts, slicers and timelines"]
    F["Sales, profit, customer and product analysis"]
    A --> B --> C --> D --> E --> F
```

This is the evidenced processing flow, not a claim that every relationship or filter has been validated. The architecture guide is included at `docs/ARCHITECTURE.md` inside the downloadable project ZIP.

## Technical work

The workbook contains three Power Query queries. `Orders_details` removes Row ID, converts dates, renames columns, removes duplicates and blank rows, replaces missing postal codes, trims text and assigns numeric types. `Sales_Rep` reads the People sheet. `Returns` reads the Returns sheet and removes duplicates. The exact extracted queries are preserved in [Section1.original.m](power-query/14-Section1.original.m).

The report uses an embedded Excel data model, 12 PivotTables, charts, slicers and timelines. These let the user move between customer, product, region, category and time views. The supplied video visibly demonstrates changing filters and corresponding dashboard views; it does not by itself establish that every connection or calculation is correct.

## What the saved view suggests

In the supplied overview, Technology contributes the largest category share of profit and the Consumer segment contributes the largest segment share. These are observations about this saved view, not universal findings about every filter state.

For a business discussion, compare revenue with profit rather than ranking products only by sales. Investigate product mix, returned transactions and discounting before recommending stock, pricing or customer actions. These are proposed next analyses, not measured improvements or causal findings.

## Metric and reconciliation notes

The screenshot preserves the original labels and values, including Total Order 9,193, AVG Order 28.6 and margin 12.4%. These labels are not treated as corrected or validated definitions.

- The supplied raw Orders sheet contains 9,994 populated order lines and 5,009 distinct order IDs. Its used range also has five trailing blank/incomplete rows, including one with only a ship date.
- The workbook's cached Orders_details table also contains 9,994 rows and 5,009 distinct order IDs. Those matching counts do **not** prove the datasets are identical: their order-ID sets and sales/profit totals differ.
- The raw source totals are sales 2,297,200.8603 and profit 286,397.0217. Cached workbook totals are sales 2,296,919.4883 and profit 286,409.0805. They must be reconciled before reporting a newly refreshed result.
- The source has four People rows and 800 Returns rows. The cached Returns model table inspected here contains no rows. Check load settings, relationships and return logic in native Excel before making return-based claims.
- Confirm whether each order card counts distinct order IDs or lines, and define the numerator and denominator of every average and margin.
- Screenshots and video show historical states. Native refresh and every filter connection still require testing.

No calculation or workbook defect has been silently fixed in this repository.

## Download the project files

[Download the project ZIP](https://github.com/Ahmed-Yasser20-eng/superstore-excel-analysis/releases/download/v0.1.0/Excel_Project_Files_Without_Video.zip) | [View release](https://github.com/Ahmed-Yasser20-eng/superstore-excel-analysis/releases/tag/v0.1.0)

The ZIP contains both original workbooks, all five screenshots, exact extracted Power Query source, architecture, validation notes and a file manifest. The original workbooks are unchanged. Repository folder uploads did not complete, so these files are delivered through the verified Release ZIP rather than claimed as individual repository paths.

Inside the ZIP:

```text
README.md                                  # Reviewed preparation snapshot
data/raw/Sample - Superstore 2019.xls       # Original source
workbook/Superstore_Sales_Profit.xlsx       # Original dashboard
power-query/Section1.original.m            # Extracted exact query source
images/                                    # All five original screenshots
docs/ARCHITECTURE.md                        # Architecture guide
docs/architecture.png                      # Architecture diagram
docs/VALIDATION.md                         # Validation notes
docs/FILE_MANIFEST.json                     # Original file hashes
```

The ZIP's README is the reviewed preparation snapshot. This repository README is the current publication status. The full original video remains pending upload and is not inside the ZIP. The repository also contains the [extracted query source](power-query/14-Section1.original.m).

## Open and refresh

1. Download the source XLS and dashboard XLSX. Use Microsoft Excel desktop with Power Query and Power Pivot support.
2. Open the dashboard. Before refreshing, inspect **Data > Queries & Connections** and each query's source step.
3. The original queries point to `D:\Min_Progect\Sample - Superstore 2019.xls`. Repoint all three queries to your local copy in `data/raw/`. The original workbook and extracted query file remain unchanged for provenance.
4. Inspect the data model, Returns load settings, measures and filter connections. Resolve the source-versus-cache differences listed above.
5. Refresh, record the resulting row counts and totals, then test each slicer/timeline against a known subset.
6. Save a separately named validated copy if you make corrections. Do not overwrite the original without keeping its provenance.

## Screenshots and demo

![KPI cards](https://github.com/user-attachments/assets/41802fdf-c742-4efa-9bd0-a7a49e4f9656)

![Category and segment profit](https://github.com/Ahmed-Yasser20-eng/superstore-excel-analysis/releases/download/v0.1.0/26-category-segment-profit.jpg)

![Profit by year and quarter](https://github.com/user-attachments/assets/5c9385ad-62c0-454a-9a5d-adff6ddea0a8)

![Slicers and timelines](https://github.com/Ahmed-Yasser20-eng/superstore-excel-analysis/releases/download/v0.1.0/28-slicers-timelines.jpg)

The original 47.8-second MP4 is 37,527,684 bytes. It is preserved unchanged, but is **not uploaded to this release**. The available upload route could not transfer a file over 25 MiB. No shortened replacement is presented as the original. The full video must still be added through a supported upload route.

## Data and use

This project is presented as portfolio analysis, not client employment or proven commercial impact. The project owner confirmed the supplied data is training data and approved this public portfolio publication. No blanket third-party data license is granted by this README.
