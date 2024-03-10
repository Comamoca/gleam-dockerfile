FROM rust:latest AS builder

WORKDIR /build

RUN git clone https://github.com/gleam-lang/gleam

RUN cd gleam \
    && cargo build --release \
    && cp ./target/release/gleam /bin

WORKDIR /root

FROM elixir:latest

COPY --from=builder /build/gleam/target/release/gleam /bin
