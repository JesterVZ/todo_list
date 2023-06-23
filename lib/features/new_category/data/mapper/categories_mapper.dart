import 'package:flutter/material.dart';
import 'package:todo_list/core/data/db_const.dart';
import 'package:todo_list/features/new_category/data/entities/category_entity.dart';
import 'package:todo_list/features/new_category/data/entities/category_list.dart';
import 'package:todo_list/features/new_category/domain/model/category_model.dart';
abstract interface class CategotyMapper {
  CategoryList transformToModel(final List<Map<String, dynamic>> categories);
  Entity transformToNewEntityMap(CategoryModel model);
}

class CategotyMapperImpl implements CategotyMapper {
  @override
  CategoryList transformToModel(List<Map<String, dynamic>> categories) {
    final values = categories
        .map((x) => CategoryEntity(
            id: x['id'],
            name: x['name'],
            color: Color(int.parse(x['color'], radix: 16)),
            count: x['count']))
        .toList();
    return CategoryList(values: values);
  }

  @override
  Entity transformToNewEntityMap(CategoryModel model) => {
        'id': null,
        'name': model.name,
        'color': model.color!.value.toRadixString(16),
        'count': model.count
      };
}
