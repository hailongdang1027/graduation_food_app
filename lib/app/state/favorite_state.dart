import 'package:freezed_annotation/freezed_annotation.dart';

import '../../models/favorite.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState({
    Favorite? favoriteModel,
    @Default(false) bool isLoading,
  }) = _FavoriteState;
}