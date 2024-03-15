import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img;
import 'package:image_picker/image_picker.dart';

class OCRPage extends StatefulWidget {
  @override
  _OCRPageState createState() => _OCRPageState();
}

class _OCRPageState extends State<OCRPage> {
  final picker = ImagePicker();
  String recognizedText = '';
  List<File> images = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OCR Page'),
      ),
      body: Stack(
        children: [
          images.isEmpty
              ? Center(
                  child: Text(
                    'Select Image From Camera or Gallery',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.indigo[900],
                      fontSize: 20.0,
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.file(images[index]),
                    );
                  },
                ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton(
              onPressed: _getImageFromGallery,
              tooltip: 'Select Image',
              child: Icon(Icons.image),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FloatingActionButton(
              onPressed: _recognizeText,
              tooltip: 'Recognize Text',
              child: Icon(Icons.check),
            ),
          ),
          if (recognizedText.isNotEmpty)
            Align(
              alignment: Alignment.center,
              child: SingleChildScrollView(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  recognizedText,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Future<void> _getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      images.add(imageFile);
      setState(() {});
    }
  }

  Future<void> _recognizeText() async {
    // Perform OCR on images and update recognizedText
    // This is a placeholder implementation
    String text = '';
    for (var imageFile in images) {
      final Uint8List bytes = await imageFile.readAsBytes();
      final img.Image image = img.decodeImage(bytes)!;

      // Convert image to grayscale
      img.grayscale(image);

      // Replace each pixel with 'X' or space based on intensity
      for (int y = 0; y < image.height; y++) {
        for (int x = 0; x < image.width; x++) {
          if (image.getPixel(x, y) < 128) {
            text += 'X';
          } else {
            text += ' ';
          }
        }
        text += '\n';
      }
    }

    setState(() {
      recognizedText = text;
    });
  }
}
