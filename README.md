Test with:

1. Locally (without container):
```
cargo run
```

2. In Docker container:

2.1. Build an image:
   ```
   docker build --tag  rust-meminfo:latest .
   ```
2.2. Run without max memory:
  ```
  docker run --rm  -it rust-meminfo:latest
  Max memory: Some(65854062592)
  ```
2.3. Run with max memory
  ```
  docker run --rm --memory 11m -it rust-meminfo:latest
  Max memory: Some(11534336)
  ```
