# Use a Rust base image with Cargo installed
FROM rust:1.88.0 AS builder

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the Cargo.toml and Cargo.lock files
COPY Cargo.toml Cargo.lock ./

# Now copy the source code
COPY ./src ./src

# Build your application
RUN cargo build --release

# Start a new stage to create a smaller image without unnecessary build dependencies
FROM debian:bookworm-slim

# Set the working directory
WORKDIR /usr/src/app

# Copy the built binary from the previous stage
COPY --from=builder /usr/src/app/target/release/meminfo ./

# Command to run the application
CMD ["./meminfo"]
