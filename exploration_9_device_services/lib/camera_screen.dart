import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CameraScreen extends StatefulWidget {
  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  File? image;
  final ImagePicker _picker = ImagePicker();

  void getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    // final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    image = File(pickedFile!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return Center(
        child: ElevatedButton(
          child: Text('Select Photo'),
          onPressed: () {
            getImage();
          },
        ),
      );
    } else{
      return Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(child: Image.file(image!), height:  100,),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){}, child: Text('Post It')),
        ],
      )
      );
    }
  }
}