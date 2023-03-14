import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:wastegram/models/food_waste_post.dart';

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

  final formKey = GlobalKey<FormState>();

  FoodWastePost _newEntry = FoodWastePost.empty();


  void getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    // final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    image = File(pickedFile!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Widget imgWidget = SizedBox(child: CircularProgressIndicator(), height:  100,);

    if (image == null) {
      getImage();
    } else {
      imgWidget = SizedBox(child: Image.file(image!), height:  100,);
    }

    return Scaffold(
      appBar: AppBar(title: const Text('New Post'), centerTitle: true,),
      body: Center(
          child: Form(
            key: formKey,
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            imgWidget,
            SizedBox(height: 40,),
            // ElevatedButton(onPressed: (){}, child: Text('Post It')),
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(labelText: "Count of wasted items"),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
              onSaved: (value) {
                _newEntry.quantity = int.parse(value!);
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {
              if (formKey.currentState!.validate()) {
                _newEntry.date = DateTime.now();
                formKey.currentState!.save();
                //widget.saveEntryFunc(_newEntry);
                print("TODO save entry");
                Navigator.of(context).pop();
              }
              formKey.currentState!.save();
            },
              child: Text('Save Entry'),
            ),
        ],
      ),
          )
      ),
    );
  }
}