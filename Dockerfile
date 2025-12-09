FROM python:3.9-slim

# تثبيت Poppler ومكتبات النظام الضرورية
RUN apt-get update && apt-get install -y \
    poppler-utils \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir -r requirements.txt

# تشغيل التطبيق
CMD ["gunicorn", "--bind", "0.0.0.0:10000", "app:app"]
