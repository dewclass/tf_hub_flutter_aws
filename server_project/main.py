from flask import Flask, request
from werkzeug.utils import secure_filename

from landmark_find_service import LandMarkFinder
from object_detection import IdentifyObjects

app = Flask(__name__)

land_mark_finder = LandMarkFinder()
object_finder = IdentifyObjects()


@app.route("/api/identify_landmarks", methods=["POST"])
def identify_landmarks():
    if request.method == "POST":
        image_file = request.files["image"]
        file_name = secure_filename(filename=image_file.filename)
        file_save = f"uploads/{file_name}"
        image_file.save(file_save)
        result = land_mark_finder.predict(file_save)
        print(result["locations"][0])
        print(result["descriptors"][0])

    return {
        "status": "success",
        "label": None
    }


@app.route("/api/identify_objects", methods=["POST"])
def identify_objects():
    if request.method == "POST":
        image_file = request.files["image"]
        file_name = secure_filename(filename=image_file.filename)
        file_save = f"uploads/{file_name}"
        image_file.save(file_save)
        result = object_finder.predict(file_save)
        print(result)

    return {
        "status": "success",
        "label": None
    }


if __name__ == '__main__':
    app.run()
