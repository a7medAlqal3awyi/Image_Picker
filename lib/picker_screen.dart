import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  File? cameraFile;
  File? galleryFile;

  getCameraImage() async {
    final ImagePicker cameraPicker = ImagePicker();
    final XFile? imageCamera =
        await cameraPicker.pickImage(source: ImageSource.camera);
    cameraFile = File(imageCamera!.path);
    setState(() {});
  }

  getGalleryImage() async {
    final ImagePicker galleryPicker = ImagePicker();
    final XFile? imageGallery =
        await galleryPicker.pickImage(source: ImageSource.gallery);
    galleryFile = File(imageGallery!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Picker',
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  getCameraImage();
                },
                child: const Text(
                  'Pick Image From Camera',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
              if (cameraFile != null) Image.file(cameraFile!),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  getGalleryImage();
                },
                child: const Text(
                  'Choose Image From Gallery',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                ),
              ),
              if (galleryFile != null) Image.file(galleryFile!),
            ],
          ),
        ),
      ),
    );
  }
}
