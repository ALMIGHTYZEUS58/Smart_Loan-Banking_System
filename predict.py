from flask import Flask, request, jsonify
import joblib
import numpy as np
from utils.preprocess import preprocess_input
from utils.config import MODEL_PATH

# Initialize Flask App and Load Model
app = Flask(__name__)
model = joblib.load(MODEL_PATH)

@app.route("/predict", methods=["POST"])
def predict():
    """
    Predict loan default risk based on user inputs.
    Expects a JSON payload with relevant features.
    """
    try:
        input_data = request.json
        input_features = preprocess_input(input_data)
        prediction = model.predict([input_features])[0]
        probability = model.predict_proba([input_features])[0][1]
        return jsonify({
            "loan_default_risk": bool(prediction),
            "default_probability": round(probability, 2),
        })
    except Exception as e:
        return jsonify({"error": str(e)}), 400

if __name__ == "__main__":
    app.run(debug=True)