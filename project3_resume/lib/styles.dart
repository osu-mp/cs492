import 'package:flutter/material.dart';

class Styles {
  static const _textSizeDefault = 36.0;
  static final String _fontNameDefault = 'Raleway';

  static final textDefault = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    fontWeight: FontWeight.bold,
  );

  static final textDefaultSmall = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault * 0.6,

  );

}