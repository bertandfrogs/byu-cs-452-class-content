# USAGE
# python simple_request.py

# import the necessary packages
import requests

# initialize the Keras REST API endpoint URL along with the input
# image path
KERAS_REST_API_URL = "http://127.0.0.1:5000/predict"
IMAGE_PATH = "test.jpg"
IMAGE_PATH = "dog.png"
IMAGE_PATH = "panda.png"
IMAGE_PATH = "jemma.png"
IMAGE_PATH = "castle_image.jpg"
IMAGE_PATH = "house-finch.jpg"
IMAGE_PATH = "tobe.jpg"
IMAGE_PATH = "grungle.jpg"

# load the input image and construct the payload for the request
image = open(IMAGE_PATH, "rb").read()
payload = {"image": image}

# submit the request
r = requests.post(KERAS_REST_API_URL, files=payload).json()

# ensure the request was sucessful
if r["success"]:
	# loop over the predictions and display them
	for (i, result) in enumerate(r["predictions"]):
		print("{}. {}: {:.4f}".format(i + 1, result["label"],
			result["probability"]))

# otherwise, the request failed
else:
	print("Request failed")
