import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:http/http.dart' as http;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final cameras = await availableCameras();
  final firstCamera = cameras.first;

  runApp(MaterialApp(
    home: EmotionApp(camera: firstCamera),
  ));
}

class EmotionApp extends StatefulWidget {
  final CameraDescription camera;
  EmotionApp({required this.camera});

  @override
  _EmotionAppState createState() => _EmotionAppState();
}

class _EmotionAppState extends State<EmotionApp> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  List<dynamic> faces = [];

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> captureAndAnalyze() async {
    try {
      await _initializeControllerFuture;
      final image = await _controller.takePicture();
      final bytes = await image.readAsBytes();
      final base64Image = base64Encode(bytes);

      final response = await http.post(
        Uri.parse("http://127.0.0.1:5000/predict"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"image": base64Image}),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          faces = data['faces']; // list of detected faces
        });
      } else {
        print("Error from server: ${response.body}");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Emotion & Stress Detection")),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Stack(
              children: [
                CameraPreview(_controller),
                CustomPaint(
                  painter: FacePainter(faces),
                  child: Container(),
                ),
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: captureAndAnalyze,
      ),
    );
  }
}

class FacePainter extends CustomPainter {
  final List<dynamic> faces;
  FacePainter(this.faces);

  final Map<String, Color> emotionColors = {
    "angry": Colors.red,
    "disgust": Colors.green,
    "fear": Colors.purple,
    "happy": Colors.greenAccent,
    "sad": Colors.blue,
    "surprise": Colors.orange,
    "neutral": Colors.grey,
  };

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    for (var face in faces) {
      int x = face['region']?['x'] ?? 50; // fallback if region not provided
      int y = face['region']?['y'] ?? 50;
      int w = face['region']?['w'] ?? 100;
      int h = face['region']?['h'] ?? 100;

      String emotion = face['emotion']?.toLowerCase() ?? "neutral";
      String gender = face['gender'] ?? "";
      int age = face['age'] ?? 0;
      String race = face['race'] ?? "";
      String advice = face['advice'] ?? "";
      String stress = face['stress_level'] ?? "";

      paint.color = emotionColors[emotion] ?? Colors.white;
      canvas.drawRect(Rect.fromLTWH(x.toDouble(), y.toDouble(), w.toDouble(), h.toDouble()), paint);

      final overlayText = "$emotion, $gender, Age:$age, Race:$race\nAdvice: $advice\nStress: $stress";
      textPainter.text = TextSpan(
        text: overlayText,
        style: TextStyle(
          color: paint.color,
          fontSize: 14,
          backgroundColor: Colors.black45,
        ),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(x.toDouble(), y.toDouble() - 40));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}