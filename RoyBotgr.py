import gradio as gr
import torch
from langchain_ollama import ChatOllama
from langchain_core.prompts import ChatPromptTemplate

# Detect CUDA availability
if torch.cuda.is_available():
    device = "cuda"
    print("✅ Using GPU:", torch.cuda.get_device_name(0))
else:
    device = "cpu"
    print("⚠️ CUDA not available, falling back to CPU")

# Initialize Ollama with chosen device
llm = ChatOllama(model="llama3.2:latest")

prompt = ChatPromptTemplate(
    messages=[
        ("system", "You are a helpful assistant. Answer the user's questions to the best of your ability."),
        ("human", "{question}"),
    ]
)

chain = prompt | llm

def chatbot(message, history):
    response = chain.invoke({"question": message})
    return response.content

demo = gr.ChatInterface(
    fn=chatbot,
    title="Ultron Chat interface",
    description="Ask me anything and I'll respond."
)

demo.launch(server_name="0.0.0.0", server_port=8080, share=True)
