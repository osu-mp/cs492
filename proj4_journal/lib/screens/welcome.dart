import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = 'WelcomeScreen';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.post_add_rounded,
              size: 50,
            ),
            Text('Journal Empty')
          ],
        ),
      ),
    );
  }
}