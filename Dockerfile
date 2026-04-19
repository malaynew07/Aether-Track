# Use a lightweight Python image
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY app/requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code
COPY app/ .

# Expose the port Flask runs on
EXPOSE 5000

# Set Environment Variables
ENV FLASK_APP=main.py

# Run with Gunicorn for production-grade stability
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "main:app"]
