from fastapi import FastAPI
import psutil

app = FastAPI()

@app.get("/")
def root():
    return {"message": "Startup Diagnostic Agent is running"}

@app.get("/diagnostics")
def get_system_diagnostics():
    return {
        "cpu_usage": f"{psutil.cpu_percent()}%",
        "memory": {
            "total": f"{psutil.virtual_memory().total / (1024**3):.2f} GB",
            "available": f"{psutil.virtual_memory().available / (1024**3):.2f} GB",
            "used": f"{psutil.virtual_memory().used / (1024**3):.2f} GB",
            "percent": f"{psutil.virtual_memory().percent}%"
        },
        "disk": {
            "total": f"{psutil.disk_usage('/').total / (1024**3):.2f} GB",
            "used": f"{psutil.disk_usage('/').used / (1024**3):.2f} GB",
            "free": f"{psutil.disk_usage('/').free / (1024**3):.2f} GB",
            "percent": f"{psutil.disk_usage('/').percent}%"
        }
    }

