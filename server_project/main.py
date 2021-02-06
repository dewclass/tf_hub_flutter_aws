from flask import Flask, request
from werkzeug.utils import secure_filename

app = Flask(__name__)


@app.route("/api/identify_landmarks", methods=["POST"])
def identify_landmarks():
    if request.method == "POST":
        image_file = request.files["image"]
        file_name = secure_filename(filename=image_file.filename)
        image_file.save(f"uploads/{file_name}")

    return {
        "status": "success",
        "label": None
    }


if __name__ == '__main__':
    app.run()
