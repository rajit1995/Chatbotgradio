#!/bin/sh
# Start Ollama bound to all interfaces
OLLAMA_HOST=0.0.0.0 ollama serve &

# Give Ollama a few seconds to boot
sleep 8

# Pull the model if not already present
ollama pull llama3.2

# Start your Gradio/LangChain app
python3 RoyBotgr.py

