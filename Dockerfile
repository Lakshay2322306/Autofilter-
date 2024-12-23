FROM python:3.12-slim

# Set the working directory
WORKDIR /app

# Install system dependencies (including git)
RUN apt-get update \
    && apt-get install -y --no-install-recommends git curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY . /app/

# Upgrade pip and install dependencies
RUN python -m pip install --upgrade pip \
    && python -m pip install -r requirements.txt

# Expose the port your application will run on
EXPOSE 8080

# Define the command to run your application
CMD ["python", "bot.py"]
