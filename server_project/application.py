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
    result_res = []
    if request.method == "POST":
        image_file = request.files["image"]
        file_name = secure_filename(filename=image_file.filename)
        file_save = f"uploads/{file_name}"
        image_file.save(file_save)
        result = object_finder.predict(file_save)
        for idx, score in enumerate(result["detection_scores"]):
            score = score * 100
            if score > 30:
                entity = str(result["detection_class_entities"][idx])
                name = str(result["detection_class_names"][idx])
                box = result["detection_boxes"][idx]
                box = [float(b) for b in box]

                print(type(name), type(box), type(score), type(entity))

                result_res.append({
                    "name": name,
                    "entity": entity,
                    "box": box,
                    "score": float(score)
                })

    return {
        "status": "success",
        "result": result_res
    }


if __name__ == '__main__':
    app.run()
