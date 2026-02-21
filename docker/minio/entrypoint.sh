#!/bin/sh

set -e

echo "🚀 Starting MinIO..."

minio server /data --console-address ":9001" &
MINIO_PID=$!

echo "⏳ Waiting for MinIO to be ready..."

until mc alias set mlhs3 http://localhost:9000 "$MINIO_ROOT_USER" "$MINIO_ROOT_PASSWORD"
do
  echo "MinIO not ready yet..."
  sleep 2
done

echo "✅ MinIO is ready"

mc mb mlhs3/$MINIO_DEFAULT_BUCKET --ignore-existing
mc anonymous set none mlhs3/$MINIO_DEFAULT_BUCKET

echo "🌱 Seeding bucket..."
mc cp /opt/seed-data/sample-data.csv mlhs3/$MINIO_DEFAULT_BUCKET

echo "🎉 Bootstrap complete"

wait $MINIO_PID