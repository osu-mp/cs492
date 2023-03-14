import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

class WasteDetailEntry extends StatefulWidget{
  static  final String routeName = 'WasteDetailEntry';

  WasteDetailEntry({Key? key}) : super(key: key);

  @override
  State<WasteDetailEntry> createState() => _WasteDetailEntryState();
}

class _WasteDetailEntryState extends State<WasteDetailEntry> {
  File? image;
  final ImagePicker _picker = ImagePicker();
  String? text;

  void getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    // final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    image = File(pickedFile!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget body = Text('matt');
    if (image == null) {
      getImage();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('New Post'), centerTitle: true,),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(child: Image.file(image!), height:  100,),
          SizedBox(height: 40,),
          ElevatedButton(onPressed: (){}, child: Text('Post It')),
          // TextField(
          //   decoration: new InputDecoration(labelText: "Enter your number"),
          //   keyboardType: TextInputType.number,
          //   inputFormatters: <TextInputFormatter>[
          //     FilteringTextInputFormatter.digitsOnly
          //   ], // Only numbers can be entered
          // ),
        ],
      )
      ),
    );
  }
}