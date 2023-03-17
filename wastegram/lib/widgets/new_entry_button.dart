import 'package:flutter/material.dart';
import '../screens/waste_detail_entry.dart';

class NewEntryButton extends StatelessWidget{
  final Function? updateFunc;

  NewEntryButton({super.key, this.updateFunc});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Icon(Icons.camera_alt,
        semanticLabel: 'Upload waste image',
      ),


      onPressed: (){
        Navigator.of(context)
            .pushNamed(WasteDetailEntry.routeName,
              arguments: updateFunc,
        );
      },
    );
  }

}