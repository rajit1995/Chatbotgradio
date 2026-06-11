FROM python:3.12

WORKDIR /app

# Install Python + curl
RUN apt-get update && apt-get install -y python3 python3-pip curl && rm -rf /var/lib/apt/lists/*

# Copy requirements first
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# Copy your Gradio app
COPY RoyBotgr.py .

# Expose Gradio port
EXPOSE 8080

# Environment variables
ENV OLLAMA_HOST=0.0.0.0
ENV GRADIO_PORT=8080

# Override NVIDIA entrypoint completely
ENTRYPOINT ["python3", "RoyBotgr.py"]
