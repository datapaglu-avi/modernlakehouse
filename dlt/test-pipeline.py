import dlt
from datetime import datetime, timezone


# ---- dummy source ----
@dlt.resource(name="dummy_users")
def get_data():
    data = [
        {"id": 1, "name": "Virat", "created_at": datetime.now()},
        {"id": 2, "name": "Rohit", "created_at": datetime.now()},
        {"id": 3, "name": "Gill", "created_at": datetime.now()},
    ]
    yield data


# ---- pipeline ----
pipeline = dlt.pipeline(
    pipeline_name="dummy_pipeline",
    destination="filesystem",  # S3-compatible via env
    dataset_name="demo_dataset",
)

load_info = pipeline.run(get_data())

print(load_info)