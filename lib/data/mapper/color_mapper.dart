import 'package:flutter/material.dart';
import 'package:todo_list/data/datasource/database/db_const.dart';
import 'package:todo_list/data/entities/color_entity.dart';

abstract interface class ColorMapper {
  Entity transformToNewEntityMap(Color color);
  List<ColorEntity> transformToModel(final List<Map<String, dynamic>> colors);
}

class ColorMapperImpl implements ColorMapper {
  @override
  Entity transformToNewEntityMap(Color color) =>
      {'id': null, 'value': color.value.toRadixString(16)};

  @override
  List<ColorEntity> transformToModel(List<Map<String, dynamic>> colors) =>
      colors.map((x) => ColorEntity(id: x['id'], hex: x['value'])).toList();
}
