#dockerfile for deploying payment app

FROM python:3.9

# environment variables
ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    NEW_RELIC_LICENSE_KEY='614b4552090f778420eca65f763ce5baFFFFNRAL' \
    NEW_RELIC_APP_NAME='Payment-Service'

# Installing system dependencies
RUN apt-get update && \
    apt-get install -y wget && \
    rm -rf /var/lib/apt/lists/*

# Create and set the working directory
RUN mkdir /payment_app
WORKDIR /payment_app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Django app code
COPY . .

# Set up OpenTelemetry
RUN pip install opentelemetry-api opentelemetry-sdk opentelemetry-instrumentation-django

# Set up New Relic
RUN pip install newrelic

# Expose the Django app port
EXPOSE 8000

# Set the command to run the Django app with OpenTelemetry and New Relic
CMD gunicorn Otel.wsgi:application --bind 0.0.0.0:8000
