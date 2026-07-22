// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MenuEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuEvent()';
}


}

/// @nodoc
class $MenuEventCopyWith<$Res>  {
$MenuEventCopyWith(MenuEvent _, $Res Function(MenuEvent) __);
}


/// Adds pattern-matching-related methods to [MenuEvent].
extension MenuEventPatterns on MenuEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _LoadLevelsProgress value)?  loadLevelsProgress,TResult Function( _LoadLevelsMetadata value)?  loadLevelsMetadata,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoadLevelsProgress() when loadLevelsProgress != null:
return loadLevelsProgress(_that);case _LoadLevelsMetadata() when loadLevelsMetadata != null:
return loadLevelsMetadata(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _LoadLevelsProgress value)  loadLevelsProgress,required TResult Function( _LoadLevelsMetadata value)  loadLevelsMetadata,}){
final _that = this;
switch (_that) {
case _LoadLevelsProgress():
return loadLevelsProgress(_that);case _LoadLevelsMetadata():
return loadLevelsMetadata(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _LoadLevelsProgress value)?  loadLevelsProgress,TResult? Function( _LoadLevelsMetadata value)?  loadLevelsMetadata,}){
final _that = this;
switch (_that) {
case _LoadLevelsProgress() when loadLevelsProgress != null:
return loadLevelsProgress(_that);case _LoadLevelsMetadata() when loadLevelsMetadata != null:
return loadLevelsMetadata(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  loadLevelsProgress,TResult Function()?  loadLevelsMetadata,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoadLevelsProgress() when loadLevelsProgress != null:
return loadLevelsProgress();case _LoadLevelsMetadata() when loadLevelsMetadata != null:
return loadLevelsMetadata();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  loadLevelsProgress,required TResult Function()  loadLevelsMetadata,}) {final _that = this;
switch (_that) {
case _LoadLevelsProgress():
return loadLevelsProgress();case _LoadLevelsMetadata():
return loadLevelsMetadata();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  loadLevelsProgress,TResult? Function()?  loadLevelsMetadata,}) {final _that = this;
switch (_that) {
case _LoadLevelsProgress() when loadLevelsProgress != null:
return loadLevelsProgress();case _LoadLevelsMetadata() when loadLevelsMetadata != null:
return loadLevelsMetadata();case _:
  return null;

}
}

}

/// @nodoc


class _LoadLevelsProgress implements MenuEvent {
  const _LoadLevelsProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadLevelsProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuEvent.loadLevelsProgress()';
}


}




/// @nodoc


class _LoadLevelsMetadata implements MenuEvent {
  const _LoadLevelsMetadata();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadLevelsMetadata);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MenuEvent.loadLevelsMetadata()';
}


}




/// @nodoc
mixin _$MenuState {

 List<String> get loadedLevelsIds;
/// Create a copy of MenuState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MenuStateCopyWith<MenuState> get copyWith => _$MenuStateCopyWithImpl<MenuState>(this as MenuState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MenuState&&const DeepCollectionEquality().equals(other.loadedLevelsIds, loadedLevelsIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(loadedLevelsIds));

@override
String toString() {
  return 'MenuState(loadedLevelsIds: $loadedLevelsIds)';
}


}

/// @nodoc
abstract mixin class $MenuStateCopyWith<$Res>  {
  factory $MenuStateCopyWith(MenuState value, $Res Function(MenuState) _then) = _$MenuStateCopyWithImpl;
@useResult
$Res call({
 List<String> loadedLevelsIds
});




}
/// @nodoc
class _$MenuStateCopyWithImpl<$Res>
    implements $MenuStateCopyWith<$Res> {
  _$MenuStateCopyWithImpl(this._self, this._then);

  final MenuState _self;
  final $Res Function(MenuState) _then;

/// Create a copy of MenuState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadedLevelsIds = null,}) {
  return _then(MenuState(
loadedLevelsIds: null == loadedLevelsIds ? _self.loadedLevelsIds : loadedLevelsIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [MenuState].
extension MenuStatePatterns on MenuState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MenuState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MenuState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MenuState value)  $default,){
final _that = this;
switch (_that) {
case _MenuState():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MenuState value)?  $default,){
final _that = this;
switch (_that) {
case _MenuState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<String> loadedLevelsIds)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MenuState() when $default != null:
return $default(_that.loadedLevelsIds);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<String> loadedLevelsIds)  $default,) {final _that = this;
switch (_that) {
case _MenuState():
return $default(_that.loadedLevelsIds);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<String> loadedLevelsIds)?  $default,) {final _that = this;
switch (_that) {
case _MenuState() when $default != null:
return $default(_that.loadedLevelsIds);case _:
  return null;

}
}

}

/// @nodoc


class _MenuState extends MenuState {
  const _MenuState({ List<String> loadedLevelsIds = const []}): _loadedLevelsIds = loadedLevelsIds,super._();
  

 final  List<String> _loadedLevelsIds;
@override@JsonKey() List<String> get loadedLevelsIds {
  if (_loadedLevelsIds is EqualUnmodifiableListView) return _loadedLevelsIds;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_loadedLevelsIds);
}


/// Create a copy of MenuState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MenuStateCopyWith<_MenuState> get copyWith => __$MenuStateCopyWithImpl<_MenuState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MenuState&&const DeepCollectionEquality().equals(other._loadedLevelsIds, _loadedLevelsIds));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_loadedLevelsIds));

@override
String toString() {
  return 'MenuState(loadedLevelsIds: $loadedLevelsIds)';
}


}

/// @nodoc
abstract mixin class _$MenuStateCopyWith<$Res> implements $MenuStateCopyWith<$Res> {
  factory _$MenuStateCopyWith(_MenuState value, $Res Function(_MenuState) _then) = __$MenuStateCopyWithImpl;
@override @useResult
$Res call({
 List<String> loadedLevelsIds
});




}
/// @nodoc
class __$MenuStateCopyWithImpl<$Res>
    implements _$MenuStateCopyWith<$Res> {
  __$MenuStateCopyWithImpl(this._self, this._then);

  final _MenuState _self;
  final $Res Function(_MenuState) _then;

/// Create a copy of MenuState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadedLevelsIds = null,}) {
  return _then(_MenuState(
loadedLevelsIds: null == loadedLevelsIds ? _self._loadedLevelsIds : loadedLevelsIds // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
