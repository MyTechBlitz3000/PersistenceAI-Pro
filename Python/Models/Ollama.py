# models/ollama.py

import requests

OLLAMA_URL = "http://localhost:11434/api/generate"

MODEL = "qwen2.5-coder"

def ask_model(prompt: str):

    response = requests.post(
        OLLAMA_URL,
        json={
            "model": MODEL,
            "prompt": prompt,
            "stream": False
        }
    )

    data = response.json()

    return data.get("response", "No response")
