import 'dart:html' as html; // For web image picking and handling
import 'dart:io'; // For non-web platforms (mobile, desktop)
import 'dart:typed_data'; // For handling bytes data on web
import 'package:flutter/foundation.dart'; // For checking platform
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class HomeScrn extends StatefulWidget {
  @override
  _HomeScrnState createState() => _HomeScrnState();
}

class _HomeScrnState extends State<HomeScrn> {
  File? _image; // For mobile/desktop platforms
  Uint8List? _webImage; // For web platforms
  final picker = ImagePicker();

  // Image picker function
  Future<void> _pickImage() async {
    if (kIsWeb) {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _webImage = bytes; // Save image as bytes
        });
      }
    } else {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
      }
    }
  }

  // Upload image to Firebase
  Future<void> _uploadFile() async {
    if (kIsWeb && _webImage != null) {
      // Handle web file upload
      String fileName = 'web-image-${DateTime.now().millisecondsSinceEpoch}.png';
      String destination = 'images/$fileName';

      try {
        Reference ref = FirebaseStorage.instance.ref(destination);
        UploadTask uploadTask = ref.putData(_webImage!, SettableMetadata(contentType: 'image/png'));

        await uploadTask.whenComplete(() async {
          String imageUrl = await ref.getDownloadURL();
          print('File uploaded successfully, URL: $imageUrl');
          _showImage(imageUrl);
        });
      } catch (e) {
        print('Error uploading image: $e');
      }
    } else if (_image != null) {
      // Handle mobile/desktop file upload
      String fileName = basename(_image!.path);
      String destination = 'images/$fileName';

      try {
        Reference ref = FirebaseStorage.instance.ref(destination);
        UploadTask uploadTask = ref.putFile(_image!, SettableMetadata(contentType: 'image/png'));

        await uploadTask.whenComplete(() async {
          String imageUrl = await ref.getDownloadURL();
          print('File uploaded successfully, URL: $imageUrl');
          _showImage(imageUrl);
        });
      } catch (e) {
        print('Error uploading image: $e');
      }
    }
  }

  // Show image in a dialog
  void _showImage(String imageUrl) {
    showDialog(
      context: this.context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Image uploaded successfully!'),
              SizedBox(height: 10),
              Image.network(imageUrl),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upload Image to Firebase'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (!kIsWeb && _image != null)
              Image.file(_image!, height: 150) // For non-web platforms
            else if (kIsWeb && _webImage != null)
              Image.memory(_webImage!, height: 150) // For web platforms
            else
              Text('No image selected.'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _pickImage,
              child: Text('Pick Image'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _uploadFile,
              child: Text('Upload to Firebase'),
            ),
          ],
        ),
      ),
    );
  }
}
