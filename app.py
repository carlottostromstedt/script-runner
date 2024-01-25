from flask import Flask, request
import os
import subprocess

app = Flask(__name__)


@app.route('/')
def hello():
    return '<h1>Hello, World!</h1>'

@app.route('/run_script', methods=["GET", "POST"])
def run_script():
    data = request.get_json()
    fullImageName = data.get('fullImageName')
    imageName = data.get('imageName')
    port = data.get('port')

    if imageName is None or port is None:
        return 'Invalid JSON payload', 400

    script_path = "script.sh"

    result = subprocess.run(["bash", script_path, fullImageName, imageName, str(port)], capture_output=True, text=True)

    print("Script Output:")
    print(result.stdout)

    return '<h1>Script running!</h1>'

