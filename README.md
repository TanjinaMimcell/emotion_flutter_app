# Emotion Detection Flutter App

A real-time **Emotion & Stress Detection** app using **Flutter** for frontend and **Flask** (or FastAPI) for backend with **DeepFace** and **OpenCV**.

---

## Features

- Detect multiple faces in real-time.
- Predict **emotion**, **gender**, **age**, and **race**.
- Show **stress level** and **advice** based on emotion.
- Camera feed overlay with bounding boxes and labels.

---

## Project Structure

final_year_projects_practice/

├── app/ # Backend folder
│   ├── backend.py
│   ├── requirements.txt
│   └── ...
└── emotion_app/ # Flutter frontend
    ├── lib/
    ├── android/
    ├── ios/
    └── ...

---

## Setup Instructions

### Backend (Flask)

1. Create a virtual environment:

```bash
python -m venv venv
