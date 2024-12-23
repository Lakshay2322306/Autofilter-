# Use Python 3.12 slim image as base
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy and install dependencies first to optimize caching
COPY requirements.txt /app/
RUN python -m pip install --upgrade pip \
    && python -m pip install -r requirements.txt

# Copy the rest of the application files
COPY . /app/

# Expose port if required by the application
EXPOSE 8080

# Define the command to run your bot
CMD ["python", "bot.py"]
