# URL Shortener — Serverless Multi-Tenant Platform

A production-grade multi-tenant URL shortener built on AWS serverless 
architecture. Designed as a portfolio project demonstrating cloud 
engineering, system design, and infrastructure-as-code skills.

## Architecture

> Diagram coming in Phase 5

## Tech stack

| Layer | Service | Why |
|---|---|---|
| CDN + edge cache | CloudFront + CF Functions | Sub-ms cache-hit redirects |
| Cache-miss compute | Lambda (regional) | Always-free 1M req/month |
| Storage | DynamoDB (single-table) | Always-free 25GB |
| Analytics pipeline | SQS + Lambda consumer | Always-free 1M msgs/month |
| Management API | Lambda + API Gateway HTTP | Always-free 1M calls/month |
| Config | SSM Parameter Store | Always-free standard tier |
| DNS | Cloudflare | Always-free |
| IaC | Terraform | Reproducible infra |
| CI/CD | GitHub Actions + OIDC | No long-lived AWS keys |

## Cost

**$0/month** at portfolio scale. All services are within AWS always-free 
tier limits. No 12-month expiry dependencies.

## Local setup

> Setup guide coming in Phase 1

## Deployment

> Deployment guide coming in Phase 2

## Architecture Decision Records

- [ADR-001](docs/adr/001-dynamodb-over-rds.md) — coming Phase 6
- [ADR-002](docs/adr/002-sqs-over-firehose.md) — coming Phase 6
- [ADR-003](docs/adr/003-regional-lambda-dev.md) — coming Phase 6

## Load test results

> Coming Phase 5
