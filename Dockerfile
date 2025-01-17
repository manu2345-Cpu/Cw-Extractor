
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
