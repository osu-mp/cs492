import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';
import 'package:wastegram/models/food_waste_post.dart';
import '../services/location_helper.dart';

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
  LocationHelper locationHelper = LocationHelper();


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
    Widget imgWidget = CircularProgressIndicator();

    if (image == null) {
      getImage();
    } else {
      imgWidget = Expanded(child: Image.file(image!));
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
            TextFormField(
              autofocus: true,
              decoration: const InputDecoration(
                  labelText: "Number of wasted items",
                  floatingLabelAlignment: FloatingLabelAlignment.center),
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
                  return 'Please enter the number of wasted items';
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

    try {
      var location = await locationHelper.retrieveLocation();
      _newEntry.latitude = location.latitude!;
      _newEntry.longitude = location.longitude!;
    } catch (e){
      print(e);
      _newEntry.latitude = 0.0;
      _newEntry.longitude = 0.0;
    }


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