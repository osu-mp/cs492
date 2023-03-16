import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  final _formKey = GlobalKey<FormState>();

  FoodWastePost _newEntry = FoodWastePost.empty();


  void getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    // final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    image = File(pickedFile!.path);

    var fileName = '${DateTime.now()}.jpg';
    Reference storageReference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = storageReference.putFile(image!);
    await uploadTask;
    var url = await storageReference.getDownloadURL();

    _newEntry.photoURL = url;

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
            key: _formKey,
            child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            imgWidget,
            SizedBox(height: 40,),
            // ElevatedButton(onPressed: (){}, child: Text('Post It')),
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(labelText: "Number of wasted items"),
              textAlign: TextAlign.center,
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
              if (_formKey.currentState!.validate()) {
                _newEntry.date = DateTime.now();
                _formKey.currentState!.save();
                uploadEntry();
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Uploading entry')),
                );
              }
              _formKey.currentState!.save();
            },
              child: Text('Save Entry'),
            ),
        ],
      ),
          )
      ),
    );
  }

  void uploadEntry() async {
    // final url = await getImage();
    _newEntry.longitude = 123.4;
    _newEntry.latitude = 22.2;    // TODO

    FirebaseFirestore.instance
        .collection('food_waste')
        .add({'date': Timestamp.fromDate(_newEntry.date),
              'photoURL': _newEntry.photoURL,
              'quantity': _newEntry.quantity,
              'latitude': _newEntry.latitude,
              'longitude': _newEntry.longitude,
    });
  }


}