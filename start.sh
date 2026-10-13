#!/bin/bash

# اگه PORT ست نشده بود، پیش‌فرض 8080
PORT=${PORT:-8080}

echo "Starting Xray on port $PORT..."

# جایگزینی پورت توی کانفیگ
sed -i "s/__PORT__/$PORT/g" /app/config.json

# اجرای Xray
exec /app/xray -config /app/config.json
