# DAB — Fluid Intelligence Business Metric Variance Attribution Platform

> **DAB** is an audit-grade, evidence-backed business metric investigation and variance attribution workstation. It explains *why* departmental metrics disagree (e.g. Finance ERP ledger vs. Operations fulfillment system), attributes variance to concrete operational drivers, tracks anomaly patterns, assesses underlying dataset health, and generates verifiable PDF audit reports.

---

## Architecture Overview

```
                                      ┌────────────────────────────────────────────────────────┐
                                      │                      DAB FRONTEND                      │
                                      │   React 19 • TypeScript • Tailwind CSS • Lucide Icons │
                                      │        Fluid Intelligence UI • Three Themes            │
                                      │       Midnight (Default) | Dark | Light                │
                                      │         Canvas-Based Organic Ink-Pour Transition       │
                                      └───────────────────────────┬────────────────────────────┘
                                                                  │ REST API (JSON)
                                                                  ▼
                                      ┌────────────────────────────────────────────────────────┐
                                      │                      DAB BACKEND                       │
                                      │        FastAPI • Python 3.12 • Pydantic v2             │
                                      │             SQLAlchemy ORM • SQLite / PostgreSQL       │
                                      └───────────────────────────┬────────────────────────────┘
                                                                  │
              ┌───────────────────────────────────┼───────────────────────────────────┐
              ▼                                   ▼                                   ▼
    ┌──────────────────┐                ┌──────────────────┐                ┌──────────────────┐
    │    MetricSync    │                │   PatternWatch   │                │    DataTrust     │
    │  Reconciliation  │                │     Anomaly      │                │   Data Quality   │
    │      Engine      │                │    Monitoring    │                │    Assessment    │
    │                  │                │                  │                │                  │
    │ • Record Matching│                │ • Daily / Weekly │                │ • Completeness   │
    │ • Attribution    │                │ • Z-Score & MAD  │                │ • Uniqueness     │
    │ • Invariant      │                │ • Dynamic Baseln │                │ • Validity       │
    │ • Residual Guard │                │ • Spike/Drop Det │                │ • Timeliness     │
    └─────────┬────────┘                └─────────┬────────┘                └─────────┬────────┘
              │                                   │                                   │
              └───────────────────────────────────┼───────────────────────────────────┘
                                                  ▼
                                      ┌────────────────────────┐
                                      │ Cross-Module Findings  │
                                      │    & Unified Audit     │
                                      └───────────┬────────────┘
                                                  │
                                                  ▼
                                      ┌────────────────────────┐
                                      │    Reporting Engine    │
                                      │ • ReportLab Audit PDF  │
                                      │ • Sanitized CSV Export │
                                      │ • SHA-256 Verification │
                                      └────────────────────────┘
```

---

## Key Modules & Methodology

### 1. MetricSync — Variance Attribution Engine
- **Mathematical Invariant**:
  $$\text{Total Variance} = \sum \text{Attributed Factor Impacts} + \text{Unexplained Residual}$$
  Every dollar of variance between Source A (e.g. Finance) and Source B (e.g. Operations) is rigorously attributed to validated categories (e.g., Timing Delays, Orphan Records, Exchange Rate Drift, Operational Adjustments). Any remaining difference is strictly preserved as **Unexplained Residual** without artificial balancing.
- **Deterministic Record Matching**: Primary key and composite record-level joins with source-record level drill-down evidence.

### 2. PatternWatch — Operational Anomaly Monitoring
- **Statistical Baselines**: Moving window rolling averages and dynamic standard deviations.
- **Dual Detection Engines**:
  - **Z-Score Detection**: Identifies Gaussian deviations above sensitivity threshold ($\mu \pm k\sigma$).
  - **Robust Median Absolute Deviation (MAD)**: Non-parametric outlier detection resilient to extreme historical anomalies.
- **Edge-Case Resilience**: Handles constant zero-variance time series, single-observation sets, sparse gaps, and sharp trend shifts.

### 3. DataTrust — Dataset Quality & Hygiene Scoring
- **Automated Multi-Dimensional Auditing**:
  - **Completeness**: Missingness rates, null values, empty strings.
  - **Uniqueness**: Primary key duplication, composite record collisions.
  - **Validity**: Range boundaries, regex pattern matching, allowed categorical sets.
  - **Timeliness**: Future date detection, stale record tracking.
  - **Consistency**: Type stability and column profile variance.
- **Health Index**: Weighted 0–100 quality score with actionable row-level violation inspection.

### 4. Reporting & Cross-Module Findings
- **Unified Finding Graph**: Links anomalies from PatternWatch and data violations from DataTrust directly into active MetricSync investigations.
- **Audit-Grade PDF Generation**: Built with ReportLab, featuring executive variance bridges, factor attribution breakdowns, SHA-256 cryptographic hashes, and evidence manifests.
- **Formula-Injection Sanitized CSV**: Automatically escapes spreadsheet formula injection triggers (`=`, `+`, `-`, `@`, `\t`, `\r`).

---

## Design System & Theme Engine

- **Themes**:
  - **Midnight (Default)**: Deep obsidian canvas (`#0B1018`), dark navy elevation (`#151D2A`), cool analytical blue accents (`#79A9FF`).
  - **Dark**: Neutral dark slate aesthetic.
  - **Light**: Crisp editorial analytical workstation mode.
- **Signature Ink-Pour Transition**: HTML5 canvas rendering organic radial ink dispersion, liquid diffusion, edge turbulence, and viscous spreading when switching themes.
- **Motion Lab**: Accessible at `/theme-preview` for inspecting particle physics, wave dissipation, and theme timings.

---

## Local Setup & Quick Start

### Prerequisites
- Node.js 18+ (tested with Node 20 / 22)
- Python 3.12+
- Git

### 1. Backend Setup
```bash
# Navigate to backend directory
cd backend

# Create virtual environment and activate
python -m venv .venv

# On Windows:
.venv\Scripts\activate
# On macOS / Linux:
# source .venv/bin/activate

# Install dependencies
pip install -r requirements.txt

# Start backend server
python -m uvicorn app.main:app --app-dir backend --host 127.0.0.1 --port 8000 --reload
```
Backend API will be accessible at:
- **API Health**: `http://127.0.0.1:8000/api/health`
- **Interactive OpenAPI Documentation**: `http://127.0.0.1:8000/docs`

### 2. Frontend Setup
```bash
# In the project root (open a new terminal)
npm install

# Start Vite development server
npm run dev
```
Frontend development workstation will be accessible at:
- **Web App**: `http://localhost:5173`

---

## Automated Test Suites

All tests run against deterministic test fixtures and verify calculations, UI routing, and API contracts.

### 1. Backend Pytest Suite
```bash
# From the repository root:
backend\.venv\Scripts\python.exe -m pytest backend/tests -v
```
**Results**:
- `test_api.py::test_health_check` — PASSED
- `test_api.py::test_full_api_workflow_dataset_to_reconciliation` — PASSED
- `test_cross_module.py::test_phase3_cross_module_and_reporting_workflow` — PASSED
- `test_datatrust.py::test_datatrust_dimensions_and_violations` — PASSED
- `test_patternwatch.py::test_patternwatch_normal_and_anomalous_spikes` — PASSED
- `test_patternwatch.py::test_patternwatch_edge_cases` — PASSED
- `test_reconciliation.py::test_ground_truth_reconciliation_invariant` — PASSED
*(7 of 7 passed in ~3.1s)*

### 2. Frontend Vitest Suite
```bash
npm test -- --run
```
**Results**:
- `mathReconciliation.test.ts` (2 tests) — PASSED
- `themeSystem.test.tsx` (4 tests) — PASSED
- `routesAndComponents.test.tsx` (4 tests) — PASSED
- `allRoutes.test.tsx` (12 tests) — PASSED
*(22 of 22 passed in ~10.6s)*

### 3. Production Frontend Build
```bash
npm run build
```
*(Produces optimized client bundle under `dist/` in ~3.2s with zero TypeScript or bundling errors).*

---

## Reproducing the Core Validation Scenario

Deterministic fixtures are stored in `data/fixtures/`:
- `data/fixtures/finance_revenue.csv` (19 records)
- `data/fixtures/ops_revenue.csv` (20 records)
- `data/fixtures/ground_truth.json`

### Step-by-Step Reproduction:
1. **Upload Datasets**:
   - Go to **Data Catalog** (`/catalog`) or **Upload Page** (`/upload`).
   - Upload `finance_revenue.csv` as Source A (Finance Ledger).
   - Upload `ops_revenue.csv` as Source B (Operations Fulfillment).
2. **Launch MetricSync**:
   - Go to **MetricSync Reconciliation** (`/reconciliation`).
   - Map Source A measure `net_amount` (SUM) with key `transaction_id`.
   - Map Source B measure `gross_revenue` (SUM) with key `order_id`.
   - Click **Run Reconciliation**.
3. **Verify Reconciliation Invariant**:
   - Source A Total: `$1,245,600.00`
   - Source B Total: `$1,310,200.00`
   - Total Variance: `-$64,600.00`
   - Verified Attributed Factors + Unexplained Residual equals Total Variance with exact decimal precision.
4. **Trigger PatternWatch**:
   - Open **PatternWatch** (`/anomalies`).
   - Run detection on `ops_revenue.csv` with timestamp `fulfillment_date` and metric `gross_revenue`.
   - Anomaly detected on the known operational volume spike.
5. **Inspect DataTrust Quality**:
   - Open **DataTrust** (`/quality`).
   - Run assessment on `finance_revenue.csv` to flag missing customer tags and allowed value violations.
6. **Cross-Link Findings & Export Report**:
   - Link anomaly and data quality findings to the active investigation.
   - Generate audit PDF (`/reports`) and verify SHA-256 integrity hash.
   - Download formula-sanitized CSV export.

---

## Production Deployment

### Option A: Single Container Docker (Recommended)
DAB includes a production multi-stage Dockerfile that compiles the React frontend and packages it directly with the Python FastAPI backend:

```bash
# Build the production image
docker build -t dab-app:latest .

# Run container with persistent data volume
docker run -d -p 8000:8000 -v dab-data:/app/data --name dab-production dab-app:latest
```
Access the complete application at `http://localhost:8000`.

### Option B: Docker Compose
```bash
docker-compose up -d
```

### Option C: Cloud Deployment (Vercel + Railway / Render)
1. **Frontend (Vercel / Netlify)**:
   - Root directory: `./`
   - Build command: `npm run build`
   - Output directory: `dist`
   - Environment variable: `VITE_API_BASE_URL=https://your-backend-api.com`
2. **Backend (Railway / Render / Fly.io)**:
   - Root directory: `./backend`
   - Build command: `pip install -r requirements.txt`
   - Start command: `uvicorn app.main:app --host 0.0.0.0 --port $PORT`
   - Attach persistent volume at `/app/data` for uploads and reports.

---

## Security & Reliability Controls

- **No Formula Injection in CSVs**: All exported cells starting with `=`, `+`, `-`, `@`, `\t`, or `\r` are sanitized with single-quote escaping.
- **Path Traversal Protection**: Uploaded files use randomly generated UUIDs; report downloads strictly validate that resolved file paths remain inside the authorized storage directory.
- **Payload Validation**: Strict 25MB file size limit, extension whitelisting (`.csv`, `.xlsx`, `.xls`), and robust candidate encoding detection (UTF-8, Latin-1, CP1252).
- **Zero Secret Exposure**: `.gitignore` strictly protects `.env`, database files (`*.db`, `*.sqlite3`), virtual environments, and generated artifacts.

---

## License

Proprietary analytical engine. All rights reserved.
