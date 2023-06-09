import 'package:flutter/material.dart';

abstract class DialogService {
  static Future<T?> show<T>(BuildContext context) async {
    T? result = await showDialog<T>(
        context: context,
        builder: (BuildContext context) => const AlertDialog());
    return result;
  }
}
