FROM python:3.10.5

ENV PYTHONUNBUFFERED=1

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir --upgrade -r /app/requirements.txt


CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]