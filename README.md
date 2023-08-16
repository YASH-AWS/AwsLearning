Pre-Requiste for Deployment on Local

1. Install Python with version above 3.6
2. Install Django Rest Framework package with pip

pip install django-rest-framework

3. Install Required Packages to Integrate Opentelemetry

pip install opentelemetry-api opentelemetry-sdk opentelemetry-instrumentation-django opentelemetry-exporter-otlp

4. To run the above payment microservice

Execute the below cmds

> python manage.py makemigrations
> python manage.py migrate
> python manage.py runserver

Access the service from the url: http://127.0.0.1:8000/payment/

