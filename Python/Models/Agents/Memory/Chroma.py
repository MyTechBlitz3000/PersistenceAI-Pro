# memory/chroma.py

import chromadb

client = chromadb.Client()

collection = client.create_collection(
    "persistence-memory"
)

def save_memory(key: str, value: str):

    collection.add(
        documents=[value],
        ids=[key]
    )

def search_memory(query: str):

    return collection.query(
        query_texts=[query],
        n_results=3
    )
