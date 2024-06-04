// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'food_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Food _$FoodFromJson(Map<String, dynamic> json) {
  return _Food.fromJson(json);
}

/// @nodoc
mixin _$Food {
  String get foodId => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  String get foodName => throw _privateConstructorUsedError;
  String? get foodDescription => throw _privateConstructorUsedError;
  String get foodImage => throw _privateConstructorUsedError;
  double get foodPrice => throw _privateConstructorUsedError;
  double get foodSalePrice => throw _privateConstructorUsedError;
  double? get foodRating => throw _privateConstructorUsedError;
  List<String>? get relatedDetailFoods => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FoodCopyWith<Food> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FoodCopyWith<$Res> {
  factory $FoodCopyWith(Food value, $Res Function(Food) then) =
      _$FoodCopyWithImpl<$Res, Food>;
  @useResult
  $Res call(
      {String foodId,
      Category category,
      String foodName,
      String? foodDescription,
      String foodImage,
      double foodPrice,
      double foodSalePrice,
      double? foodRating,
      List<String>? relatedDetailFoods});

  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$FoodCopyWithImpl<$Res, $Val extends Food>
    implements $FoodCopyWith<$Res> {
  _$FoodCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodId = null,
    Object? category = null,
    Object? foodName = null,
    Object? foodDescription = freezed,
    Object? foodImage = null,
    Object? foodPrice = null,
    Object? foodSalePrice = null,
    Object? foodRating = freezed,
    Object? relatedDetailFoods = freezed,
  }) {
    return _then(_value.copyWith(
      foodId: null == foodId
          ? _value.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      foodDescription: freezed == foodDescription
          ? _value.foodDescription
          : foodDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      foodImage: null == foodImage
          ? _value.foodImage
          : foodImage // ignore: cast_nullable_to_non_nullable
              as String,
      foodPrice: null == foodPrice
          ? _value.foodPrice
          : foodPrice // ignore: cast_nullable_to_non_nullable
              as double,
      foodSalePrice: null == foodSalePrice
          ? _value.foodSalePrice
          : foodSalePrice // ignore: cast_nullable_to_non_nullable
              as double,
      foodRating: freezed == foodRating
          ? _value.foodRating
          : foodRating // ignore: cast_nullable_to_non_nullable
              as double?,
      relatedDetailFoods: freezed == relatedDetailFoods
          ? _value.relatedDetailFoods
          : relatedDetailFoods // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryCopyWith<$Res> get category {
    return $CategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FoodImplCopyWith<$Res> implements $FoodCopyWith<$Res> {
  factory _$$FoodImplCopyWith(
          _$FoodImpl value, $Res Function(_$FoodImpl) then) =
      __$$FoodImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String foodId,
      Category category,
      String foodName,
      String? foodDescription,
      String foodImage,
      double foodPrice,
      double foodSalePrice,
      double? foodRating,
      List<String>? relatedDetailFoods});

  @override
  $CategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$FoodImplCopyWithImpl<$Res>
    extends _$FoodCopyWithImpl<$Res, _$FoodImpl>
    implements _$$FoodImplCopyWith<$Res> {
  __$$FoodImplCopyWithImpl(_$FoodImpl _value, $Res Function(_$FoodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? foodId = null,
    Object? category = null,
    Object? foodName = null,
    Object? foodDescription = freezed,
    Object? foodImage = null,
    Object? foodPrice = null,
    Object? foodSalePrice = null,
    Object? foodRating = freezed,
    Object? relatedDetailFoods = freezed,
  }) {
    return _then(_$FoodImpl(
      foodId: null == foodId
          ? _value.foodId
          : foodId // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      foodName: null == foodName
          ? _value.foodName
          : foodName // ignore: cast_nullable_to_non_nullable
              as String,
      foodDescription: freezed == foodDescription
          ? _value.foodDescription
          : foodDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      foodImage: null == foodImage
          ? _value.foodImage
          : foodImage // ignore: cast_nullable_to_non_nullable
              as String,
      foodPrice: null == foodPrice
          ? _value.foodPrice
          : foodPrice // ignore: cast_nullable_to_non_nullable
              as double,
      foodSalePrice: null == foodSalePrice
          ? _value.foodSalePrice
          : foodSalePrice // ignore: cast_nullable_to_non_nullable
              as double,
      foodRating: freezed == foodRating
          ? _value.foodRating
          : foodRating // ignore: cast_nullable_to_non_nullable
              as double?,
      relatedDetailFoods: freezed == relatedDetailFoods
          ? _value._relatedDetailFoods
          : relatedDetailFoods // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FoodImpl implements _Food {
  _$FoodImpl(
      {required this.foodId,
      required this.category,
      required this.foodName,
      required this.foodDescription,
      required this.foodImage,
      required this.foodPrice,
      required this.foodSalePrice,
      required this.foodRating,
      final List<String>? relatedDetailFoods})
      : _relatedDetailFoods = relatedDetailFoods;

  factory _$FoodImpl.fromJson(Map<String, dynamic> json) =>
      _$$FoodImplFromJson(json);

  @override
  final String foodId;
  @override
  final Category category;
  @override
  final String foodName;
  @override
  final String? foodDescription;
  @override
  final String foodImage;
  @override
  final double foodPrice;
  @override
  final double foodSalePrice;
  @override
  final double? foodRating;
  final List<String>? _relatedDetailFoods;
  @override
  List<String>? get relatedDetailFoods {
    final value = _relatedDetailFoods;
    if (value == null) return null;
    if (_relatedDetailFoods is EqualUnmodifiableListView)
      return _relatedDetailFoods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Food(foodId: $foodId, category: $category, foodName: $foodName, foodDescription: $foodDescription, foodImage: $foodImage, foodPrice: $foodPrice, foodSalePrice: $foodSalePrice, foodRating: $foodRating, relatedDetailFoods: $relatedDetailFoods)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FoodImpl &&
            (identical(other.foodId, foodId) || other.foodId == foodId) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.foodName, foodName) ||
                other.foodName == foodName) &&
            (identical(other.foodDescription, foodDescription) ||
                other.foodDescription == foodDescription) &&
            (identical(other.foodImage, foodImage) ||
                other.foodImage == foodImage) &&
            (identical(other.foodPrice, foodPrice) ||
                other.foodPrice == foodPrice) &&
            (identical(other.foodSalePrice, foodSalePrice) ||
                other.foodSalePrice == foodSalePrice) &&
            (identical(other.foodRating, foodRating) ||
                other.foodRating == foodRating) &&
            const DeepCollectionEquality()
                .equals(other._relatedDetailFoods, _relatedDetailFoods));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      foodId,
      category,
      foodName,
      foodDescription,
      foodImage,
      foodPrice,
      foodSalePrice,
      foodRating,
      const DeepCollectionEquality().hash(_relatedDetailFoods));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FoodImplCopyWith<_$FoodImpl> get copyWith =>
      __$$FoodImplCopyWithImpl<_$FoodImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FoodImplToJson(
      this,
    );
  }
}

abstract class _Food implements Food {
  factory _Food(
      {required final String foodId,
      required final Category category,
      required final String foodName,
      required final String? foodDescription,
      required final String foodImage,
      required final double foodPrice,
      required final double foodSalePrice,
      required final double? foodRating,
      final List<String>? relatedDetailFoods}) = _$FoodImpl;

  factory _Food.fromJson(Map<String, dynamic> json) = _$FoodImpl.fromJson;

  @override
  String get foodId;
  @override
  Category get category;
  @override
  String get foodName;
  @override
  String? get foodDescription;
  @override
  String get foodImage;
  @override
  double get foodPrice;
  @override
  double get foodSalePrice;
  @override
  double? get foodRating;
  @override
  List<String>? get relatedDetailFoods;
  @override
  @JsonKey(ignore: true)
  _$$FoodImplCopyWith<_$FoodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
