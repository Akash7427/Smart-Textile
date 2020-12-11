from flask import Flask, request, jsonify
import json
from werkzeug import secure_filename

from keras.applications import vgg16
from keras.preprocessing.image import load_img,img_to_array
from keras.models import Model
from keras.applications.imagenet_utils import preprocess_input
#from tensorflow.keras.models import model_from_json

from PIL import Image
import pickle

import os
import matplotlib.pyplot as plt
import numpy as np
from sklearn.metrics.pairwise import cosine_similarity
import pandas as pd


app = Flask(__name__)

vgg_model = vgg16.VGG16(weights='imagenet')
feat_extractor = Model(inputs=vgg_model.input, outputs=vgg_model.get_layer("fc2").output)


imgs_path = "images/"
imgs_model_width, imgs_model_height = 224, 224
nb_closest_images = 5

files = [imgs_path + x for x in os.listdir(imgs_path) if "jpg" or "png" or "jpeg" in x]

def get_similar_img(original,path1):

    #original = load_img(given_img,target_size=(imgs_model_width, imgs_model_height))
    #print(original)
    numpy_image = img_to_array(original)
    image_batch = np.expand_dims(numpy_image, axis=0)
    processed_original_image = preprocess_input(image_batch.copy())
    print("------hello--------")

    img_features = feat_extractor.predict(processed_original_image)
    print(img_features)

    importedImages = []
    for f in files:
        filename = f
        original = load_img(filename, target_size=(224, 224))
        numpy_image = img_to_array(original)
        image_batch = np.expand_dims(numpy_image, axis=0)
        importedImages.append(image_batch)

    images = np.vstack(importedImages)
    processed_imgs = preprocess_input(images.copy())
    imgs_features = feat_extractor.predict(processed_imgs)
    print(img_features)

    cosSimilarities = cosine_similarity(imgs_features)
    cos_similarities_df = pd.DataFrame(cosSimilarities, columns=files, index=files)
    print(cos_similarities_df.head())

    print(original)

    #given = os.path.relpath(original)
    #print(given)

    closest_imgs = cos_similarities_df[path1].sort_values(ascending=False)[0:nb_closest_images].index
    closest_imgs_scores = cos_similarities_df[path1].sort_values(ascending=False)[0:nb_closest_images]
    #print(closest_imgs_scores)

    for i in range(0,len(closest_imgs)):
    #print("similarity score : ",closest_imgs_scores[i])
        print(closest_imgs[i])
    
    return closest_imgs



UPLOAD_FOLDER = 'C:/Users/Khushi/Img_api/images'
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}
app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
#APP_ROOT = os.path.dirname(os.path.abspath(__file__))


def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/predict_api', methods=['POST','GET'])
def predict_api():
    if request.method == 'POST':
        file = request.files['file']
    
    if file and allowed_file(file.filename):
        filename = secure_filename(file.filename)
        file.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
    
    new_path = "images/"+ filename

    img = load_img(new_path,target_size=(imgs_model_width, imgs_model_height))
    similar = get_similar_img(img,new_path)
    output = similar.tolist()
    print(output)
    return jsonify(o=output)
    

if __name__ == '__main__':
    app.run(debug=True)







  









