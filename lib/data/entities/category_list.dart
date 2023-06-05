import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/data/entities/category_entity.dart';

part 'category_list.freezed.dart';

@freezed
class CategoryList with _$CategoryList {
  const factory CategoryList({required List<CategoryEntity> values}) =
      _CategoryList;

  const CategoryList._();

  operator [](final int index) => values[index];

  int get length => values.length;
}
