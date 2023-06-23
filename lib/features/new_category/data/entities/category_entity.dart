import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'category_entity.freezed.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity(
      {required int id,
      required String name,
      required Color color,
      required int count}) = _CategoryEntity;
  const CategoryEntity._();
}
