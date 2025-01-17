
# Specify an Alpine-based image
FROM alpine:latest

# Install dependencies
RUN apk add --no-cache gcc libffi-dev musl-dev ffmpeg aria2 python3 py3-pip

# Copy application files
COPY . /app

# Set working directory
WORKDIR /app

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Command to run the application
CMD ["python3", "main.py"]

# Ensure the system is updated
RUN apt-get update && apt-get install -y build-essential

# Upgrade pip
RUN python -m pip install --upgrade pip

# Install dependencies from requirements.txt
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
