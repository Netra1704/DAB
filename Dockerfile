# Multi-stage production Dockerfile for DAB Backend
FROM python:3.12-slim AS base

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONPATH=/app/backend

WORKDIR /app

# Install system dependencies for psycopg2 and reportlab
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    libpq-dev \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Install python dependencies
COPY backend/requirements.txt /app/requirements.txt
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r /app/requirements.txt

# Copy backend application, alembic migrations and configuration
COPY backend /app/backend
COPY alembic.ini /app/alembic.ini

# Ensure directories for private storage
RUN mkdir -p /app/data/uploads /app/data/reports /app/data/backups

# Set execution permissions on entrypoint
RUN chmod +x /app/backend/docker-entrypoint.sh

EXPOSE 8000

# Health check probe
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
    CMD curl -f http://localhost:8000/api/health || exit 1

ENTRYPOINT ["/app/backend/docker-entrypoint.sh"]
