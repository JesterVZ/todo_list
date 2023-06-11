import 'package:flutter/material.dart';
import 'package:todo_list/data/datasource/database/db_const.dart';

abstract interface class ColorMapper {
  Entity transformToNewEntityMap(Color color);
}

class ColorMapperImpl implements ColorMapper {
  @override
  Entity transformToNewEntityMap(Color color) {
    return {'id': null, 'value': color.toString()};
  }
}
