from json import dumps
from flask import Flask, Response

app = Flask(__name__)


@app.get("/health")
def get_sensors():
    responseData = {"health": "Ok"}

    response = Response(
        response=(dumps(responseData)), status=200, mimetype="application/json"
    )
    return response


app.run(port=8000)
