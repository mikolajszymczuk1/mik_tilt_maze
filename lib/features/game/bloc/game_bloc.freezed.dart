// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent()';
}


}

/// @nodoc
class $GameEventCopyWith<$Res>  {
$GameEventCopyWith(GameEvent _, $Res Function(GameEvent) __);
}


/// Adds pattern-matching-related methods to [GameEvent].
extension GameEventPatterns on GameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Something value)?  something,TResult Function( _LoadLevel value)?  loadLevel,TResult Function( _AddStar value)?  addStar,TResult Function( _StartTimer value)?  startTimer,TResult Function( _PauseTimer value)?  pauseTimer,TResult Function( _ResumeTimer value)?  resumeTimer,TResult Function( _ResetTimer value)?  resetTimer,TResult Function( _TimerTicked value)?  timerTicked,TResult Function( _RestartGame value)?  restartGame,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Something() when something != null:
return something(_that);case _LoadLevel() when loadLevel != null:
return loadLevel(_that);case _AddStar() when addStar != null:
return addStar(_that);case _StartTimer() when startTimer != null:
return startTimer(_that);case _PauseTimer() when pauseTimer != null:
return pauseTimer(_that);case _ResumeTimer() when resumeTimer != null:
return resumeTimer(_that);case _ResetTimer() when resetTimer != null:
return resetTimer(_that);case _TimerTicked() when timerTicked != null:
return timerTicked(_that);case _RestartGame() when restartGame != null:
return restartGame(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Something value)  something,required TResult Function( _LoadLevel value)  loadLevel,required TResult Function( _AddStar value)  addStar,required TResult Function( _StartTimer value)  startTimer,required TResult Function( _PauseTimer value)  pauseTimer,required TResult Function( _ResumeTimer value)  resumeTimer,required TResult Function( _ResetTimer value)  resetTimer,required TResult Function( _TimerTicked value)  timerTicked,required TResult Function( _RestartGame value)  restartGame,}){
final _that = this;
switch (_that) {
case _Something():
return something(_that);case _LoadLevel():
return loadLevel(_that);case _AddStar():
return addStar(_that);case _StartTimer():
return startTimer(_that);case _PauseTimer():
return pauseTimer(_that);case _ResumeTimer():
return resumeTimer(_that);case _ResetTimer():
return resetTimer(_that);case _TimerTicked():
return timerTicked(_that);case _RestartGame():
return restartGame(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Something value)?  something,TResult? Function( _LoadLevel value)?  loadLevel,TResult? Function( _AddStar value)?  addStar,TResult? Function( _StartTimer value)?  startTimer,TResult? Function( _PauseTimer value)?  pauseTimer,TResult? Function( _ResumeTimer value)?  resumeTimer,TResult? Function( _ResetTimer value)?  resetTimer,TResult? Function( _TimerTicked value)?  timerTicked,TResult? Function( _RestartGame value)?  restartGame,}){
final _that = this;
switch (_that) {
case _Something() when something != null:
return something(_that);case _LoadLevel() when loadLevel != null:
return loadLevel(_that);case _AddStar() when addStar != null:
return addStar(_that);case _StartTimer() when startTimer != null:
return startTimer(_that);case _PauseTimer() when pauseTimer != null:
return pauseTimer(_that);case _ResumeTimer() when resumeTimer != null:
return resumeTimer(_that);case _ResetTimer() when resetTimer != null:
return resetTimer(_that);case _TimerTicked() when timerTicked != null:
return timerTicked(_that);case _RestartGame() when restartGame != null:
return restartGame(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  something,TResult Function( String levelName)?  loadLevel,TResult Function()?  addStar,TResult Function()?  startTimer,TResult Function()?  pauseTimer,TResult Function()?  resumeTimer,TResult Function()?  resetTimer,TResult Function( int secondsLeft)?  timerTicked,TResult Function()?  restartGame,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Something() when something != null:
return something();case _LoadLevel() when loadLevel != null:
return loadLevel(_that.levelName);case _AddStar() when addStar != null:
return addStar();case _StartTimer() when startTimer != null:
return startTimer();case _PauseTimer() when pauseTimer != null:
return pauseTimer();case _ResumeTimer() when resumeTimer != null:
return resumeTimer();case _ResetTimer() when resetTimer != null:
return resetTimer();case _TimerTicked() when timerTicked != null:
return timerTicked(_that.secondsLeft);case _RestartGame() when restartGame != null:
return restartGame();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  something,required TResult Function( String levelName)  loadLevel,required TResult Function()  addStar,required TResult Function()  startTimer,required TResult Function()  pauseTimer,required TResult Function()  resumeTimer,required TResult Function()  resetTimer,required TResult Function( int secondsLeft)  timerTicked,required TResult Function()  restartGame,}) {final _that = this;
switch (_that) {
case _Something():
return something();case _LoadLevel():
return loadLevel(_that.levelName);case _AddStar():
return addStar();case _StartTimer():
return startTimer();case _PauseTimer():
return pauseTimer();case _ResumeTimer():
return resumeTimer();case _ResetTimer():
return resetTimer();case _TimerTicked():
return timerTicked(_that.secondsLeft);case _RestartGame():
return restartGame();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  something,TResult? Function( String levelName)?  loadLevel,TResult? Function()?  addStar,TResult? Function()?  startTimer,TResult? Function()?  pauseTimer,TResult? Function()?  resumeTimer,TResult? Function()?  resetTimer,TResult? Function( int secondsLeft)?  timerTicked,TResult? Function()?  restartGame,}) {final _that = this;
switch (_that) {
case _Something() when something != null:
return something();case _LoadLevel() when loadLevel != null:
return loadLevel(_that.levelName);case _AddStar() when addStar != null:
return addStar();case _StartTimer() when startTimer != null:
return startTimer();case _PauseTimer() when pauseTimer != null:
return pauseTimer();case _ResumeTimer() when resumeTimer != null:
return resumeTimer();case _ResetTimer() when resetTimer != null:
return resetTimer();case _TimerTicked() when timerTicked != null:
return timerTicked(_that.secondsLeft);case _RestartGame() when restartGame != null:
return restartGame();case _:
  return null;

}
}

}

/// @nodoc


class _Something implements GameEvent {
  const _Something();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Something);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.something()';
}


}




/// @nodoc


class _LoadLevel implements GameEvent {
  const _LoadLevel(this.levelName);
  

 final  String levelName;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadLevelCopyWith<_LoadLevel> get copyWith => __$LoadLevelCopyWithImpl<_LoadLevel>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoadLevel&&(identical(other.levelName, levelName) || other.levelName == levelName));
}


@override
int get hashCode => Object.hash(runtimeType,levelName);

@override
String toString() {
  return 'GameEvent.loadLevel(levelName: $levelName)';
}


}

/// @nodoc
abstract mixin class _$LoadLevelCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory _$LoadLevelCopyWith(_LoadLevel value, $Res Function(_LoadLevel) _then) = __$LoadLevelCopyWithImpl;
@useResult
$Res call({
 String levelName
});




}
/// @nodoc
class __$LoadLevelCopyWithImpl<$Res>
    implements _$LoadLevelCopyWith<$Res> {
  __$LoadLevelCopyWithImpl(this._self, this._then);

  final _LoadLevel _self;
  final $Res Function(_LoadLevel) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? levelName = null,}) {
  return _then(_LoadLevel(
null == levelName ? _self.levelName : levelName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _AddStar implements GameEvent {
  const _AddStar();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddStar);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.addStar()';
}


}




/// @nodoc


class _StartTimer implements GameEvent {
  const _StartTimer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StartTimer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.startTimer()';
}


}




/// @nodoc


class _PauseTimer implements GameEvent {
  const _PauseTimer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PauseTimer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.pauseTimer()';
}


}




/// @nodoc


class _ResumeTimer implements GameEvent {
  const _ResumeTimer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResumeTimer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.resumeTimer()';
}


}




/// @nodoc


class _ResetTimer implements GameEvent {
  const _ResetTimer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResetTimer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.resetTimer()';
}


}




/// @nodoc


class _TimerTicked implements GameEvent {
  const _TimerTicked(this.secondsLeft);
  

 final  int secondsLeft;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerTickedCopyWith<_TimerTicked> get copyWith => __$TimerTickedCopyWithImpl<_TimerTicked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerTicked&&(identical(other.secondsLeft, secondsLeft) || other.secondsLeft == secondsLeft));
}


@override
int get hashCode => Object.hash(runtimeType,secondsLeft);

@override
String toString() {
  return 'GameEvent.timerTicked(secondsLeft: $secondsLeft)';
}


}

/// @nodoc
abstract mixin class _$TimerTickedCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory _$TimerTickedCopyWith(_TimerTicked value, $Res Function(_TimerTicked) _then) = __$TimerTickedCopyWithImpl;
@useResult
$Res call({
 int secondsLeft
});




}
/// @nodoc
class __$TimerTickedCopyWithImpl<$Res>
    implements _$TimerTickedCopyWith<$Res> {
  __$TimerTickedCopyWithImpl(this._self, this._then);

  final _TimerTicked _self;
  final $Res Function(_TimerTicked) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? secondsLeft = null,}) {
  return _then(_TimerTicked(
null == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class _RestartGame implements GameEvent {
  const _RestartGame();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RestartGame);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.restartGame()';
}


}




/// @nodoc
mixin _$GameState {

 String get msg; MazeLevel? get currentLevel; int get stars; int get secondsLeft; GameTimerStatus get timerStatus;
/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateCopyWith<GameState> get copyWith => _$GameStateCopyWithImpl<GameState>(this as GameState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.currentLevel, currentLevel) || other.currentLevel == currentLevel)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.secondsLeft, secondsLeft) || other.secondsLeft == secondsLeft)&&(identical(other.timerStatus, timerStatus) || other.timerStatus == timerStatus));
}


@override
int get hashCode => Object.hash(runtimeType,msg,currentLevel,stars,secondsLeft,timerStatus);

@override
String toString() {
  return 'GameState(msg: $msg, currentLevel: $currentLevel, stars: $stars, secondsLeft: $secondsLeft, timerStatus: $timerStatus)';
}


}

/// @nodoc
abstract mixin class $GameStateCopyWith<$Res>  {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) _then) = _$GameStateCopyWithImpl;
@useResult
$Res call({
 String msg, MazeLevel? currentLevel, int stars, int secondsLeft, GameTimerStatus timerStatus
});




}
/// @nodoc
class _$GameStateCopyWithImpl<$Res>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._self, this._then);

  final GameState _self;
  final $Res Function(GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? msg = null,Object? currentLevel = freezed,Object? stars = null,Object? secondsLeft = null,Object? timerStatus = null,}) {
  return _then(GameState(
msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,currentLevel: freezed == currentLevel ? _self.currentLevel : currentLevel // ignore: cast_nullable_to_non_nullable
as MazeLevel?,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,secondsLeft: null == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int,timerStatus: null == timerStatus ? _self.timerStatus : timerStatus // ignore: cast_nullable_to_non_nullable
as GameTimerStatus,
  ));
}

}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameState value)  $default,){
final _that = this;
switch (_that) {
case _GameState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameState value)?  $default,){
final _that = this;
switch (_that) {
case _GameState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String msg,  MazeLevel? currentLevel,  int stars,  int secondsLeft,  GameTimerStatus timerStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.msg,_that.currentLevel,_that.stars,_that.secondsLeft,_that.timerStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String msg,  MazeLevel? currentLevel,  int stars,  int secondsLeft,  GameTimerStatus timerStatus)  $default,) {final _that = this;
switch (_that) {
case _GameState():
return $default(_that.msg,_that.currentLevel,_that.stars,_that.secondsLeft,_that.timerStatus);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String msg,  MazeLevel? currentLevel,  int stars,  int secondsLeft,  GameTimerStatus timerStatus)?  $default,) {final _that = this;
switch (_that) {
case _GameState() when $default != null:
return $default(_that.msg,_that.currentLevel,_that.stars,_that.secondsLeft,_that.timerStatus);case _:
  return null;

}
}

}

/// @nodoc


class _GameState extends GameState {
  const _GameState({this.msg = 'hello', this.currentLevel, this.stars = 0, this.secondsLeft = GameBloc.timerDuration, this.timerStatus = GameTimerStatus.initial}): super._();
  

@override@JsonKey() final  String msg;
@override final  MazeLevel? currentLevel;
@override@JsonKey() final  int stars;
@override@JsonKey() final  int secondsLeft;
@override@JsonKey() final  GameTimerStatus timerStatus;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameStateCopyWith<_GameState> get copyWith => __$GameStateCopyWithImpl<_GameState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameState&&(identical(other.msg, msg) || other.msg == msg)&&(identical(other.currentLevel, currentLevel) || other.currentLevel == currentLevel)&&(identical(other.stars, stars) || other.stars == stars)&&(identical(other.secondsLeft, secondsLeft) || other.secondsLeft == secondsLeft)&&(identical(other.timerStatus, timerStatus) || other.timerStatus == timerStatus));
}


@override
int get hashCode => Object.hash(runtimeType,msg,currentLevel,stars,secondsLeft,timerStatus);

@override
String toString() {
  return 'GameState(msg: $msg, currentLevel: $currentLevel, stars: $stars, secondsLeft: $secondsLeft, timerStatus: $timerStatus)';
}


}

/// @nodoc
abstract mixin class _$GameStateCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory _$GameStateCopyWith(_GameState value, $Res Function(_GameState) _then) = __$GameStateCopyWithImpl;
@override @useResult
$Res call({
 String msg, MazeLevel? currentLevel, int stars, int secondsLeft, GameTimerStatus timerStatus
});




}
/// @nodoc
class __$GameStateCopyWithImpl<$Res>
    implements _$GameStateCopyWith<$Res> {
  __$GameStateCopyWithImpl(this._self, this._then);

  final _GameState _self;
  final $Res Function(_GameState) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? msg = null,Object? currentLevel = freezed,Object? stars = null,Object? secondsLeft = null,Object? timerStatus = null,}) {
  return _then(_GameState(
msg: null == msg ? _self.msg : msg // ignore: cast_nullable_to_non_nullable
as String,currentLevel: freezed == currentLevel ? _self.currentLevel : currentLevel // ignore: cast_nullable_to_non_nullable
as MazeLevel?,stars: null == stars ? _self.stars : stars // ignore: cast_nullable_to_non_nullable
as int,secondsLeft: null == secondsLeft ? _self.secondsLeft : secondsLeft // ignore: cast_nullable_to_non_nullable
as int,timerStatus: null == timerStatus ? _self.timerStatus : timerStatus // ignore: cast_nullable_to_non_nullable
as GameTimerStatus,
  ));
}


}

// dart format on
