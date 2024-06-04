import 'package:freezed_annotation/freezed_annotation.dart';

part 'page_model.freezed.dart';
// part 'page_model.g.dart';


@freezed
abstract class PageModel with _$PageModel{
  factory PageModel(
    {
      required int page,
      required int pageSize,
    }
  ) = _PageModel; 
  // factory PageModel.fromJson(Map<String, dynamic> json) => _$PageModelFromJson(json); 
}
