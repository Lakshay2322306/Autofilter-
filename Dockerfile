# Use Python 3.12 slim image as base
FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Copy only the requirements file
COPY requirements.txt /app/

# Upgrade pip and install dependencies with debugging options
RUN python -m pip install --no-cache-dir --upgrade pip \
    && python -m pip install --no-cache-dir -r requirements.txt --default-timeout=100

# Copy the rest of the application files
COPY . /app/

# Expose port if required by the application
EXPOSE 8080

# Define the command to run your bot
CMD ["python", "bot.py"]
