function Debug-Python {
    python -m debugpy --wait-for-client --listen 5678 $args
}