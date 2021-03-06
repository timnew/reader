// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'ChapterRef.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ChapterRefTearOff {
  const _$ChapterRefTearOff();

// ignore: unused_element
  _ChapterRef call(
      {@required BookIndex bookIndex,
      @required String title,
      @required Uri url,
      bool isLocked = false}) {
    return _ChapterRef(
      bookIndex: bookIndex,
      title: title,
      url: url,
      isLocked: isLocked,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ChapterRef = _$ChapterRefTearOff();

/// @nodoc
mixin _$ChapterRef {
  BookIndex get bookIndex;
  String get title;
  Uri get url;
  bool get isLocked;

  $ChapterRefCopyWith<ChapterRef> get copyWith;
}

/// @nodoc
abstract class $ChapterRefCopyWith<$Res> {
  factory $ChapterRefCopyWith(
          ChapterRef value, $Res Function(ChapterRef) then) =
      _$ChapterRefCopyWithImpl<$Res>;
  $Res call({BookIndex bookIndex, String title, Uri url, bool isLocked});

  $BookIndexCopyWith<$Res> get bookIndex;
}

/// @nodoc
class _$ChapterRefCopyWithImpl<$Res> implements $ChapterRefCopyWith<$Res> {
  _$ChapterRefCopyWithImpl(this._value, this._then);

  final ChapterRef _value;
  // ignore: unused_field
  final $Res Function(ChapterRef) _then;

  @override
  $Res call({
    Object bookIndex = freezed,
    Object title = freezed,
    Object url = freezed,
    Object isLocked = freezed,
  }) {
    return _then(_value.copyWith(
      bookIndex:
          bookIndex == freezed ? _value.bookIndex : bookIndex as BookIndex,
      title: title == freezed ? _value.title : title as String,
      url: url == freezed ? _value.url : url as Uri,
      isLocked: isLocked == freezed ? _value.isLocked : isLocked as bool,
    ));
  }

  @override
  $BookIndexCopyWith<$Res> get bookIndex {
    if (_value.bookIndex == null) {
      return null;
    }
    return $BookIndexCopyWith<$Res>(_value.bookIndex, (value) {
      return _then(_value.copyWith(bookIndex: value));
    });
  }
}

/// @nodoc
abstract class _$ChapterRefCopyWith<$Res> implements $ChapterRefCopyWith<$Res> {
  factory _$ChapterRefCopyWith(
          _ChapterRef value, $Res Function(_ChapterRef) then) =
      __$ChapterRefCopyWithImpl<$Res>;
  @override
  $Res call({BookIndex bookIndex, String title, Uri url, bool isLocked});

  @override
  $BookIndexCopyWith<$Res> get bookIndex;
}

/// @nodoc
class __$ChapterRefCopyWithImpl<$Res> extends _$ChapterRefCopyWithImpl<$Res>
    implements _$ChapterRefCopyWith<$Res> {
  __$ChapterRefCopyWithImpl(
      _ChapterRef _value, $Res Function(_ChapterRef) _then)
      : super(_value, (v) => _then(v as _ChapterRef));

  @override
  _ChapterRef get _value => super._value as _ChapterRef;

  @override
  $Res call({
    Object bookIndex = freezed,
    Object title = freezed,
    Object url = freezed,
    Object isLocked = freezed,
  }) {
    return _then(_ChapterRef(
      bookIndex:
          bookIndex == freezed ? _value.bookIndex : bookIndex as BookIndex,
      title: title == freezed ? _value.title : title as String,
      url: url == freezed ? _value.url : url as Uri,
      isLocked: isLocked == freezed ? _value.isLocked : isLocked as bool,
    ));
  }
}

/// @nodoc
class _$_ChapterRef extends _ChapterRef {
  _$_ChapterRef(
      {@required this.bookIndex,
      @required this.title,
      @required this.url,
      this.isLocked = false})
      : assert(bookIndex != null),
        assert(title != null),
        assert(url != null),
        assert(isLocked != null),
        super._();

  @override
  final BookIndex bookIndex;
  @override
  final String title;
  @override
  final Uri url;
  @JsonKey(defaultValue: false)
  @override
  final bool isLocked;

  @override
  String toString() {
    return 'ChapterRef(bookIndex: $bookIndex, title: $title, url: $url, isLocked: $isLocked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ChapterRef &&
            (identical(other.bookIndex, bookIndex) ||
                const DeepCollectionEquality()
                    .equals(other.bookIndex, bookIndex)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.isLocked, isLocked) ||
                const DeepCollectionEquality()
                    .equals(other.isLocked, isLocked)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(bookIndex) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(isLocked);

  @override
  _$ChapterRefCopyWith<_ChapterRef> get copyWith =>
      __$ChapterRefCopyWithImpl<_ChapterRef>(this, _$identity);
}

abstract class _ChapterRef extends ChapterRef {
  _ChapterRef._() : super._();
  factory _ChapterRef(
      {@required BookIndex bookIndex,
      @required String title,
      @required Uri url,
      bool isLocked}) = _$_ChapterRef;

  @override
  BookIndex get bookIndex;
  @override
  String get title;
  @override
  Uri get url;
  @override
  bool get isLocked;
  @override
  _$ChapterRefCopyWith<_ChapterRef> get copyWith;
}
