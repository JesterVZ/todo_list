import 'package:flutter/material.dart';
import 'package:todo_list/core/data/db_const.dart';
import 'package:todo_list/features/new_category/domain/model/category_model.dart';
abstract interface class CategotyMapper {
  List<CategoryModel> transformToModel(final List<Map<String, dynamic>> categories);
  Entity transformToNewEntityMap(CategoryModel model);
}

class CategotyMapperImpl implements CategotyMapper {
  @override
  List<CategoryModel> transformToModel(List<Map<String, dynamic>> categories) {
    return categories
        .map((x) => CategoryModel(
            id: x['id'],
            name: x['name'],
            color: Color(int.parse(x['color'], radix: 16)),
            count: x['count']))
        .toList();
  }

  @override
  Entity transformToNewEntityMap(CategoryModel model) => {
        'id': null,
        'name': model.name,
        'color': model.color!.value.toRadixString(16),
        'count': model.count
      };
}
