import 'package:flutter/material.dart';

class Styles {
  static const _textSizeDefault = 36.0;
  static final String _fontNameDefault = 'Roboto';

  static final textHeadline = TextStyle(
    fontFamily: 'EBGaramond',
    fontSize: 36,
  );

  static final textDefault = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault,
    fontWeight: FontWeight.bold,
  );

  static final textHeading1 = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  static final textHeading2 = TextStyle(
    fontFamily: _fontNameDefault,
    fontSize: 16,
    // fontWeight: FontWeight.bold,
  );

  static final textDefaultSmall = TextStyle(
    //fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault * 0.4,

  );

  static final textDefaultExtraSmall = TextStyle(
    //fontFamily: _fontNameDefault,
    fontSize: _textSizeDefault * 0.3,

  );
}
