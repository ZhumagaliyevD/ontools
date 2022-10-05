// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_note_data_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhotoNoteDataStruct> _$photoNoteDataStructSerializer =
    new _$PhotoNoteDataStructSerializer();

class _$PhotoNoteDataStructSerializer
    implements StructuredSerializer<PhotoNoteDataStruct> {
  @override
  final Iterable<Type> types = const [
    PhotoNoteDataStruct,
    _$PhotoNoteDataStruct
  ];
  @override
  final String wireName = 'PhotoNoteDataStruct';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PhotoNoteDataStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.dx;
    if (value != null) {
      result
        ..add('dx')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.dy;
    if (value != null) {
      result
        ..add('dy')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  PhotoNoteDataStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhotoNoteDataStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'dx':
          result.dx = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'dy':
          result.dy = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$PhotoNoteDataStruct extends PhotoNoteDataStruct {
  @override
  final double? dx;
  @override
  final double? dy;
  @override
  final String? description;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PhotoNoteDataStruct(
          [void Function(PhotoNoteDataStructBuilder)? updates]) =>
      (new PhotoNoteDataStructBuilder()..update(updates))._build();

  _$PhotoNoteDataStruct._(
      {this.dx, this.dy, this.description, required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PhotoNoteDataStruct', 'firestoreUtilData');
  }

  @override
  PhotoNoteDataStruct rebuild(
          void Function(PhotoNoteDataStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhotoNoteDataStructBuilder toBuilder() =>
      new PhotoNoteDataStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhotoNoteDataStruct &&
        dx == other.dx &&
        dy == other.dy &&
        description == other.description &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, dx.hashCode), dy.hashCode), description.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PhotoNoteDataStruct')
          ..add('dx', dx)
          ..add('dy', dy)
          ..add('description', description)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PhotoNoteDataStructBuilder
    implements Builder<PhotoNoteDataStruct, PhotoNoteDataStructBuilder> {
  _$PhotoNoteDataStruct? _$v;

  double? _dx;
  double? get dx => _$this._dx;
  set dx(double? dx) => _$this._dx = dx;

  double? _dy;
  double? get dy => _$this._dy;
  set dy(double? dy) => _$this._dy = dy;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PhotoNoteDataStructBuilder() {
    PhotoNoteDataStruct._initializeBuilder(this);
  }

  PhotoNoteDataStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dx = $v.dx;
      _dy = $v.dy;
      _description = $v.description;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhotoNoteDataStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PhotoNoteDataStruct;
  }

  @override
  void update(void Function(PhotoNoteDataStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PhotoNoteDataStruct build() => _build();

  _$PhotoNoteDataStruct _build() {
    final _$result = _$v ??
        new _$PhotoNoteDataStruct._(
            dx: dx,
            dy: dy,
            description: description,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData,
                r'PhotoNoteDataStruct',
                'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
