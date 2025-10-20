FROM python:3.13-slim

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY main.py .
COPY src/ ./src/

# 设置默认环境变量值
ENV ZAI_SIGNING_SECRET=junjie

EXPOSE 8080

CMD ["python", "main.py"]
