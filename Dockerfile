FROM alpine:latest

# نصب ابزارهای لازم
RUN apk add --no-cache curl unzip bash

# دانلود Xray-core (آخرین نسخه)
WORKDIR /app
RUN curl -L -o xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip xray.zip \
    && rm xray.zip \
    && chmod +x xray

# کپی کانفیگ و اسکریپت شروع
COPY config.json /app/config.json
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# اجرا
CMD ["/app/start.sh"]
