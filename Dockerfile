FROM python:3.11-slim

WORKDIR /app

RUN pip install --no-cache-dir \
    flask \
    flask-cors \
    pandas \
    sqlalchemy \
    psycopg2-binary \
    scikit-learn \
    python-dotenv

COPY . .

EXPOSE 5000

CMD ["python", "app.py"]