# Modern Lakehouse (AI-Ready) — Open Source Template

I am building an end-to-end, fully containerized modern data lakehouse using only open-source technologies. This project demonstrates how to ingest, transform, govern, and serve analytical data in a way that is **analytics-ready today and AI-ready tomorrow**.

---

## 🎯 Goals

- Reproducible local lakehouse using Docker Compose  
- Iceberg-based open table format  
- Versioned data with Nessie  
- SQL-first transformations with testing  
- BI-ready semantic outputs  
- Designed with future AI/ML integration in mind  

---

## 🧱 Architecture Overview

```
                ┌─────────────┐
                │   Sources   │
                └──────┬──────┘
                       │
                       ▼
                ┌─────────────┐
                │     DLT     │  (Ingestion)
                └──────┬──────┘
                       │
                       ▼
                ┌─────────────┐
                │    MinIO    │  (Object Storage)
                └──────┬──────┘
                       │
                       ▼
                ┌─────────────┐
                │   Iceberg   │
                │   + Nessie  │  (Catalog + Versioning)
                └──────┬──────┘
                       │
                       ▼
                ┌─────────────┐
                │    Trino    │  (Query Engine)
                └──────┬──────┘
                       │
                       ▼
                ┌─────────────┐
                │   SQLMesh   │  (Transforms + Tests)
                └──────┬──────┘
                       │
                       ▼
                ┌─────────────┐
                │ Evidence BI │
                └─────────────┘
```

---

## 🔧 Tech Stack

### Core Platform

- **MinIO** — S3-compatible object storage  
- **Apache Iceberg** — open table format  
- **Project Nessie** — versioned catalog  
- **Trino** — distributed SQL query engine  
- **SQLMesh** — SQL transformations, testing, and audits  
- **DLT** — data ingestion framework  
- **Apache Airflow** — orchestration  
- **Evidence BI** — analytics dashboard  
- **Docker Compose** — local reproducibility  

---

## 🧠 AI-Readiness Design

This template is built to support future AI workloads.

### Already supported

- Time travel (Iceberg)  
- Schema evolution  
- Incremental pipelines  
- Reproducible data snapshots  
- SQL-based feature engineering  

### Planned extension points

- Vector store integration  
- Feature pipelines  
- Metadata platform  
- Semantic layer (optional)

---

## 📂 Recommended Repository Structure

```
lakehouse-template/
│
├── docker/
│   ├── trino/
│   ├── airflow/
│   └── evidence/
│
├── ingestion/
│   └── dlt_pipelines/
│
├── transformations/
│   └── sqlmesh/
│
├── orchestration/
│   └── airflow_dags/
│
├── ai/                    # future-ready
│   ├── embeddings/
│   └── vector_store/
│
├── docs/
├── docker-compose.yml
└── README.md
```

---

## 🐳 Docker Compose Topology

This is the practical service layout balancing realism and simplicity.

```
                        ┌──────────────┐
                        │   Airflow    │
                        └──────┬───────┘
                               │
                               ▼
┌──────────┐    ┌──────────┐   ┌──────────┐
│   DLT    │──▶ │  MinIO   │◀──│  Trino   │
└──────────┘    └────┬─────┘   └────┬─────┘
                     │              │
                     ▼              ▼
                ┌──────────┐   ┌──────────┐
                │  Nessie  │   │ SQLMesh  │
                └──────────┘   └────┬─────┘
                                    │
                                    ▼
                               ┌──────────┐
                               │ Evidence │
                               └──────────┘
```

---

## 📦 Services in docker-compose

### Infrastructure Layer (Required)

- minio  
- nessie  
- trino  
- postgres (Airflow metadata DB)  
- airflow-webserver  
- airflow-scheduler  

### Data Layer

- dlt-runner (custom container)  
- sqlmesh-runner (custom container)

### Consumption Layer

- evidence

---

## ⭐ Next Phase (Phase 2)

- OpenMetadata  
- Cube semantic layer  
- Vector database  
- Streaming ingestion  

---

If you are exploring modern lakehouse architecture or building an AI-ready analytics platform, this repo should give you a practical, reproducible starting point.