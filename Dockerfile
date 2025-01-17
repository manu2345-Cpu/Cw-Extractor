
FROM python:3.10-slim

RUN apt-get update && apt-get install -y gcc libffi-dev musl-dev ffmpeg aria2 && \
    pip install --no-cache-dir -r requirements.txt

WORKDIR .
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev ffmpeg mediainfo
COPY . .
RUN pip3 install -r requirements.txt
RUN apk add --no-cache gcc libffi-dev musl-dev ffmpeg aria2 && pip install --no-cache-dir -r requirements.txt
RUN apt install ffmpeg

CMD ["python3", "main.py"]
