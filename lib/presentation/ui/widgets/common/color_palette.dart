import 'dart:async';

import 'package:flutter/material.dart';

class ColorPalette extends StatefulWidget {
  const ColorPalette({super.key});

  @override
  State<StatefulWidget> createState() => _ColorPaletteState();
}

class _ColorPaletteState extends State<ColorPalette> {
  int index = -1;
  static var controller = StreamController<int>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
