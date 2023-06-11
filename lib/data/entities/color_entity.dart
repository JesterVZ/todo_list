import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_entity.freezed.dart';

@freezed
class ColorEntity with _$ColorEntity {
  const factory ColorEntity({required int id, required String hex}) =
      _ColorEntity;
}
