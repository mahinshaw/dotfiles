---
paths:
  - "**/*.rs"
  - "**/Cargo.toml"
---

## Rust builds go through kache

`~/.cargo/config.toml` makes kache (a build cache) rustc's wrapper. If a build fails or misbehaves in a way the cache could explain, rebuild once with `KACHE_DISABLED=1`. If kache itself won't run, use `RUSTC_WRAPPER=` instead, which takes cargo off kache entirely.
