# main.py

from fastapi import FastAPI
from pydantic import BaseModel
from models.ollama import ask_model
from agents.planner import planner_agent

app = FastAPI()

class Prompt(BaseModel):
    message: str

@app.get("/")
def home():
    return {
        "name": "PersistenceAI Pro",
        "status": "online",
        "tagline": "AI That Builds"
    }

@app.post("/chat")
def chat(prompt: Prompt):
    plan = planner_agent(prompt.message)
    response = ask_model(plan)

    return {
        "plan": plan,
        "response": response
    }
