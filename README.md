\# Emotion Detection Flutter App# Emotion Detection Flutter App



A real-time \*\*Emotion \& Stress Detection\*\* app using \*\*Flutter\*\* for frontend and \*\*Flask\*\* (or FastAPI) for backend with \*\*DeepFace\*\* and \*\*OpenCV\*\*.



---



\## Features



\- Detect multiple faces in real-time.

\- Predict \*\*emotion\*\*, \*\*gender\*\*, \*\*age\*\*, and \*\*race\*\*.

\- Show \*\*stress level\*\* and \*\*advice\*\* based on emotion.

\- Camera feed overlay with bounding boxes and labels.



---



\## Project Structure



final\_year\_projects\_practice/

├── app/ # Backend folder

│ ├── backend.py

│ ├── requirements.txt

│ └── ...

└── emotion\_app/ # Flutter frontend

├── lib/

├── android/

├── ios/

└── ...





---



\## Setup Instructions



\### Backend (Flask)



1\. Create a virtual environment:

&nbsp;  ```bash

&nbsp;  python -m venv venv





2\. Activate venv:



Windows: venv\\Scripts\\activate



Linux/macOS: source venv/bin/activate



3\. Install dependencies:

pip install -r requirements.txt



4\. Run backend:

&nbsp;python backend.py



5\. Default API runs at: http://127.0.0.1:5000/predict











Frontend (Flutter)



1\. Install Flutter SDK (if not installed)

Flutter installation guide



2\. Get dependencies:

&nbsp;  flutter pub get



3\. Run app:

flutter run



4\. Connect your camera, then click the camera button to capture and analyze emotions.



Notes



Make sure the backend server is running before opening the Flutter app.



Tested on Windows and Chrome.



Requires a working webcam.















Author



Tanjina Mim





A real-time \*\*Emotion \& Stress Detection\*\* app using \*\*Flutter\*\* for frontend and \*\*Flask\*\* (or FastAPI) for backend with \*\*DeepFace\*\* and \*\*OpenCV\*\*.



---



\## Features



\- Detect multiple faces in real-time.

\- Predict \*\*emotion\*\*, \*\*gender\*\*, \*\*age\*\*, and \*\*race\*\*.

\- Show \*\*stress level\*\* and \*\*advice\*\* based on emotion.

\- Camera feed overlay with bounding boxes and labels.



---



\## Project Structure



final\_year\_projects\_practice/

├── app/ # Backend folder

│ ├── backend.py

│ ├── requirements.txt

│ └── ...

└── emotion\_app/ # Flutter frontend

├── lib/

├── android/

├── ios/

└── ...





---



\## Setup Instructions



\### Backend (Flask)



1\. Create a virtual environment:

&nbsp;  ```bash

&nbsp;  python -m venv venv





2\. Activate venv:



Windows: venv\\Scripts\\activate



Linux/macOS: source venv/bin/activate



3\. Install dependencies:

pip install -r requirements.txt



4\. Run backend:

&nbsp;python backend.py



5\. Default API runs at: http://127.0.0.1:5000/predict











Frontend (Flutter)



1\. Install Flutter SDK (if not installed)

Flutter installation guide



2\. Get dependencies:

&nbsp;  flutter pub get



3\. Run app:

flutter run



4\. Connect your camera, then click the camera button to capture and analyze emotions.



Notes



Make sure the backend server is running before opening the Flutter app.



Tested on Windows and Chrome.



Requires a working webcam.















Author



Tanjina Mim



