FROM nvidia/cuda:12.1.1-runtime-ubuntu20.04

WORKDIR /app

# Install Python + curl
RUN apt-get update && apt-get install -y python3 python3-pip curl && rm -rf /var/lib/apt/lists/*

# Install Ollama runtime
RUN curl -fsSL https://ollama.com/download.sh | sh

# Copy requirements first
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your Gradio app + start script
COPY RoyBotgr.py .
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

# Expose Gradio + Ollama ports
EXPOSE 8080
EXPOSE 11434

# Run start.sh
CMD ["/app/start.sh"]
