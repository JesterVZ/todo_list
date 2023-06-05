import 'package:todo_list/data/entities/category_entity.dart';
import 'package:todo_list/data/entities/category_list.dart';

abstract class CategotyListMapper {
  CategoryList transformToModel(final List<Map<String, dynamic>> categories);
}

class CategotyListMapperImpl implements CategotyListMapper {
  @override
  CategoryList transformToModel(List<Map<String, dynamic>> categories) {
    final values = categories
        .map((x) =>
            CategoryEntity(id: x['id'], name: x['name'], count: x['count']))
        .toList();
    return CategoryList(values: values);
  }
}
