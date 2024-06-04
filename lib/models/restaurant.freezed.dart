// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'restaurant.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Restaurant _$RestaurantFromJson(Map<String, dynamic> json) {
  return _Restaurant.fromJson(json);
}

/// @nodoc
mixin _$Restaurant {
  String get restaurantId => throw _privateConstructorUsedError;
  String get restaurantName => throw _privateConstructorUsedError;
  String get restaurantDescription => throw _privateConstructorUsedError;
  String get restaurantAddress => throw _privateConstructorUsedError;
  double get restaurantRating => throw _privateConstructorUsedError;
  String get restaurantImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RestaurantCopyWith<Restaurant> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RestaurantCopyWith<$Res> {
  factory $RestaurantCopyWith(
          Restaurant value, $Res Function(Restaurant) then) =
      _$RestaurantCopyWithImpl<$Res, Restaurant>;
  @useResult
  $Res call(
      {String restaurantId,
      String restaurantName,
      String restaurantDescription,
      String restaurantAddress,
      double restaurantRating,
      String restaurantImage});
}

/// @nodoc
class _$RestaurantCopyWithImpl<$Res, $Val extends Restaurant>
    implements $RestaurantCopyWith<$Res> {
  _$RestaurantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? restaurantDescription = null,
    Object? restaurantAddress = null,
    Object? restaurantRating = null,
    Object? restaurantImage = null,
  }) {
    return _then(_value.copyWith(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantDescription: null == restaurantDescription
          ? _value.restaurantDescription
          : restaurantDescription // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantAddress: null == restaurantAddress
          ? _value.restaurantAddress
          : restaurantAddress // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantRating: null == restaurantRating
          ? _value.restaurantRating
          : restaurantRating // ignore: cast_nullable_to_non_nullable
              as double,
      restaurantImage: null == restaurantImage
          ? _value.restaurantImage
          : restaurantImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RestaurantImplCopyWith<$Res>
    implements $RestaurantCopyWith<$Res> {
  factory _$$RestaurantImplCopyWith(
          _$RestaurantImpl value, $Res Function(_$RestaurantImpl) then) =
      __$$RestaurantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String restaurantId,
      String restaurantName,
      String restaurantDescription,
      String restaurantAddress,
      double restaurantRating,
      String restaurantImage});
}

/// @nodoc
class __$$RestaurantImplCopyWithImpl<$Res>
    extends _$RestaurantCopyWithImpl<$Res, _$RestaurantImpl>
    implements _$$RestaurantImplCopyWith<$Res> {
  __$$RestaurantImplCopyWithImpl(
      _$RestaurantImpl _value, $Res Function(_$RestaurantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? restaurantId = null,
    Object? restaurantName = null,
    Object? restaurantDescription = null,
    Object? restaurantAddress = null,
    Object? restaurantRating = null,
    Object? restaurantImage = null,
  }) {
    return _then(_$RestaurantImpl(
      restaurantId: null == restaurantId
          ? _value.restaurantId
          : restaurantId // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantName: null == restaurantName
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantDescription: null == restaurantDescription
          ? _value.restaurantDescription
          : restaurantDescription // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantAddress: null == restaurantAddress
          ? _value.restaurantAddress
          : restaurantAddress // ignore: cast_nullable_to_non_nullable
              as String,
      restaurantRating: null == restaurantRating
          ? _value.restaurantRating
          : restaurantRating // ignore: cast_nullable_to_non_nullable
              as double,
      restaurantImage: null == restaurantImage
          ? _value.restaurantImage
          : restaurantImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RestaurantImpl implements _Restaurant {
  _$RestaurantImpl(
      {required this.restaurantId,
      required this.restaurantName,
      required this.restaurantDescription,
      required this.restaurantAddress,
      required this.restaurantRating,
      required this.restaurantImage});

  factory _$RestaurantImpl.fromJson(Map<String, dynamic> json) =>
      _$$RestaurantImplFromJson(json);

  @override
  final String restaurantId;
  @override
  final String restaurantName;
  @override
  final String restaurantDescription;
  @override
  final String restaurantAddress;
  @override
  final double restaurantRating;
  @override
  final String restaurantImage;

  @override
  String toString() {
    return 'Restaurant(restaurantId: $restaurantId, restaurantName: $restaurantName, restaurantDescription: $restaurantDescription, restaurantAddress: $restaurantAddress, restaurantRating: $restaurantRating, restaurantImage: $restaurantImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RestaurantImpl &&
            (identical(other.restaurantId, restaurantId) ||
                other.restaurantId == restaurantId) &&
            (identical(other.restaurantName, restaurantName) ||
                other.restaurantName == restaurantName) &&
            (identical(other.restaurantDescription, restaurantDescription) ||
                other.restaurantDescription == restaurantDescription) &&
            (identical(other.restaurantAddress, restaurantAddress) ||
                other.restaurantAddress == restaurantAddress) &&
            (identical(other.restaurantRating, restaurantRating) ||
                other.restaurantRating == restaurantRating) &&
            (identical(other.restaurantImage, restaurantImage) ||
                other.restaurantImage == restaurantImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      restaurantId,
      restaurantName,
      restaurantDescription,
      restaurantAddress,
      restaurantRating,
      restaurantImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      __$$RestaurantImplCopyWithImpl<_$RestaurantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RestaurantImplToJson(
      this,
    );
  }
}

abstract class _Restaurant implements Restaurant {
  factory _Restaurant(
      {required final String restaurantId,
      required final String restaurantName,
      required final String restaurantDescription,
      required final String restaurantAddress,
      required final double restaurantRating,
      required final String restaurantImage}) = _$RestaurantImpl;

  factory _Restaurant.fromJson(Map<String, dynamic> json) =
      _$RestaurantImpl.fromJson;

  @override
  String get restaurantId;
  @override
  String get restaurantName;
  @override
  String get restaurantDescription;
  @override
  String get restaurantAddress;
  @override
  double get restaurantRating;
  @override
  String get restaurantImage;
  @override
  @JsonKey(ignore: true)
  _$$RestaurantImplCopyWith<_$RestaurantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
