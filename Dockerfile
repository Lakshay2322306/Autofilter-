# Use Python 3.12 slim image as base
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Install system dependencies required by Pillow and tgcrypto
RUN apt-get update && apt-get install -y \
    git \
    build-essential \
    libjpeg-dev \
    zlib1g-dev \
    libffi-dev \
    libssl-dev \
    && rm -rf /var/lib/apt/lists/*

# Copy only the requirements file first
COPY requirements.txt /app/

# Upgrade pip and install dependencies
RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copy the rest of the application files
COPY . /app/

# Expose port if required by the application
EXPOSE 8080

# Define the command to run your bot
CMD ["python", "bot.py"]
