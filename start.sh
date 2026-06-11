#!/bin/sh
# Start Ollama in background
ollama serve &

# Give Ollama a few seconds to boot
sleep 5

# Pull the model if not already present
ollama pull llama3.2

# Start your Gradio/LangChain app
python RoyBotgr.py

