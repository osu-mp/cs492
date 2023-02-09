import 'package:flutter/cupertino.dart';

class CenteredPlaceholder extends StatelessWidget {
  final double padding;

  const CenteredPlaceholder({Key? key, required this.padding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(this.padding),
        child: Placeholder(),
      ),
    );
  }
  
}