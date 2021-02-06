import tensorflow as tf
import tensorflow_hub as hub
from PIL import Image
import numpy as np


class LandMarkFinder:

    def __init__(self):
        self.delf_module = hub.load("https://tfhub.dev/google/delf/1").signatures['default']

    def predict(self, image_path):
        im = Image.open(image_path)
        image_arr = np.array(im)

        image = tf.image.convert_image_dtype(image_arr, tf.float32)
        delf_outputs = self.delf_module(
            image=image,
            score_threshold=tf.constant(100.0),
            image_scales=tf.constant([0.25, 0.3536, 0.5, 0.7071, 1.0, 1.4142, 2.0]),
            max_feature_num=tf.constant(1000)
        )
        return delf_outputs
