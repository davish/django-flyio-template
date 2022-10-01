FROM python:3  
  
ENV PYTHONUNBUFFERED 1  
  
WORKDIR /app  
  
COPY poetry.lock pyproject.toml /app/  
  
RUN pip3 install poetry  
RUN poetry install --no-root  
  
COPY . .  
  
ENV DJANGO_SETTINGS_MODULE "{{ project_name }}.settings"  
ENV DJANGO_SECRET_KEY "secret key for building the dockerfile"
  
RUN poetry run python manage.py collectstatic --noinput  
  
CMD poetry run daphne -b 0.0.0.0 -p 8080 {{ project_name }}.asgi:application
