import 'package:flutter/material.dart';

class Styles {
  static const _textSizeDefault = 36.0;

  static final textHeader = TextStyle(
    // fontFamily: _fontNameDefault,
    fontSize: 26,
    // fontWeight: FontWeight.bold,
  );

  static final textSubHeading = TextStyle(
    // fontFamily: _fontNameDefault,
    fontSize: 20,
    // fontWeight: FontWeight.bold,
  );

  static final textHeading1 = TextStyle(
    // fontFamily: _fontNameDefault,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final textHeading2 = TextStyle(
    // fontFamily: _fontNameDefault,
    fontSize: 16,
    fontStyle: FontStyle.italic,
  );

  static final textDefaultSmall = TextStyle(
    //fontFamily: _fontNameDefault,
    fontSize: 14,

  );

  static final textDefaultExtraSmall = TextStyle(
    //fontFamily: _fontNameDefault,
    fontSize: 12,

  );
}

Divider defaultDivider(BuildContext context) {
  return Divider(
    color: Theme.of(context).primaryColor,
    height: 20, thickness: 4, indent: 8, endIndent: 8);
}