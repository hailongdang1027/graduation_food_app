// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_pagination.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$FoodPaginationModel {
  PageModel get pageModel => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  List<String>? get foodIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FoodPaginationModelCopyWith<FoodPaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodPaginationModelCopyWith<$Res> {
  factory $FoodPaginationModelCopyWith(
          FoodPaginationModel value, $Res Function(FoodPaginationModel) then) =
      _$FoodPaginationModelCopyWithImpl<$Res, FoodPaginationModel>;
  @useResult
  $Res call({PageModel pageModel, String? categoryId, List<String>? foodIds});

  $PageModelCopyWith<$Res> get pageModel;
}

/// @nodoc
class _$FoodPaginationModelCopyWithImpl<$Res, $Val extends FoodPaginationModel>
    implements $FoodPaginationModelCopyWith<$Res> {
  _$FoodPaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageModel = null,
    Object? categoryId = freezed,
    Object? foodIds = freezed,
  }) {
    return _then(_value.copyWith(
      pageModel: null == pageModel
          ? _value.pageModel
          : pageModel // ignore: cast_nullable_to_non_nullable
              as PageModel,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      foodIds: freezed == foodIds
          ? _value.foodIds
          : foodIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PageModelCopyWith<$Res> get pageModel {
    return $PageModelCopyWith<$Res>(_value.pageModel, (value) {
      return _then(_value.copyWith(pageModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodPaginationModelImplCopyWith<$Res>
    implements $FoodPaginationModelCopyWith<$Res> {
  factory _$$FoodPaginationModelImplCopyWith(_$FoodPaginationModelImpl value,
          $Res Function(_$FoodPaginationModelImpl) then) =
      __$$FoodPaginationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PageModel pageModel, String? categoryId, List<String>? foodIds});

  @override
  $PageModelCopyWith<$Res> get pageModel;
}

/// @nodoc
class __$$FoodPaginationModelImplCopyWithImpl<$Res>
    extends _$FoodPaginationModelCopyWithImpl<$Res, _$FoodPaginationModelImpl>
    implements _$$FoodPaginationModelImplCopyWith<$Res> {
  __$$FoodPaginationModelImplCopyWithImpl(_$FoodPaginationModelImpl _value,
      $Res Function(_$FoodPaginationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageModel = null,
    Object? categoryId = freezed,
    Object? foodIds = freezed,
  }) {
    return _then(_$FoodPaginationModelImpl(
      pageModel: null == pageModel
          ? _value.pageModel
          : pageModel // ignore: cast_nullable_to_non_nullable
              as PageModel,
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      foodIds: freezed == foodIds
          ? _value._foodIds
          : foodIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$FoodPaginationModelImpl implements _FoodPaginationModel {
  _$FoodPaginationModelImpl(
      {required this.pageModel, this.categoryId, final List<String>? foodIds})
      : _foodIds = foodIds;

  @override
  final PageModel pageModel;
  @override
  final String? categoryId;
  final List<String>? _foodIds;
  @override
  List<String>? get foodIds {
    final value = _foodIds;
    if (value == null) return null;
    if (_foodIds is EqualUnmodifiableListView) return _foodIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FoodPaginationModel(pageModel: $pageModel, categoryId: $categoryId, foodIds: $foodIds)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodPaginationModelImpl &&
            (identical(other.pageModel, pageModel) ||
                other.pageModel == pageModel) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            const DeepCollectionEquality().equals(other._foodIds, _foodIds));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageModel, categoryId,
      const DeepCollectionEquality().hash(_foodIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodPaginationModelImplCopyWith<_$FoodPaginationModelImpl> get copyWith =>
      __$$FoodPaginationModelImplCopyWithImpl<_$FoodPaginationModelImpl>(
          this, _$identity);
}

abstract class _FoodPaginationModel implements FoodPaginationModel {
  factory _FoodPaginationModel(
      {required final PageModel pageModel,
      final String? categoryId,
      final List<String>? foodIds}) = _$FoodPaginationModelImpl;

  @override
  PageModel get pageModel;
  @override
  String? get categoryId;
  @override
  List<String>? get foodIds;
  @override
  @JsonKey(ignore: true)
  _$$FoodPaginationModelImplCopyWith<_$FoodPaginationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
