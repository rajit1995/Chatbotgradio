FROM nvidia/cuda:12.1.1-runtime-ubuntu20.04

WORKDIR /app

# Install Python
RUN apt-get update && apt-get install -y python3 python3-pip
RUN curl -fsSL https://ollama.com/download.sh | sh
RUN ollama pull llama3.2

# Copy requirements first
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy your Gradio app
COPY RoyBotgr.py .

# Expose Gradio port
EXPOSE 8080

# Run the app
CMD ["python3", "RoyBotgr.py"]

