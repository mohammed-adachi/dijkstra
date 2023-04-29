FROM python:3.6

RUN mkdir /app
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY gunicorn.py .
COPY source

EXPOSE 5000

CMD ["gunicorn", "--chdir", "source", "--config", "./gunicorn.py", "flask_app:app"]
