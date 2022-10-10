// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_note_point_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhotoNotePointRecord> _$photoNotePointRecordSerializer =
    new _$PhotoNotePointRecordSerializer();

class _$PhotoNotePointRecordSerializer
    implements StructuredSerializer<PhotoNotePointRecord> {
  @override
  final Iterable<Type> types = const [
    PhotoNotePointRecord,
    _$PhotoNotePointRecord
  ];
  @override
  final String wireName = 'PhotoNotePointRecord';

  @override
  Iterable<Object?> serialize(
      Serializers serializers, PhotoNotePointRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
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
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  PhotoNotePointRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhotoNotePointRecordBuilder();

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
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$PhotoNotePointRecord extends PhotoNotePointRecord {
  @override
  final double? dx;
  @override
  final double? dy;
  @override
  final String? description;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PhotoNotePointRecord(
          [void Function(PhotoNotePointRecordBuilder)? updates]) =>
      (new PhotoNotePointRecordBuilder()..update(updates))._build();

  _$PhotoNotePointRecord._({this.dx, this.dy, this.description, this.ffRef})
      : super._();

  @override
  PhotoNotePointRecord rebuild(
          void Function(PhotoNotePointRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhotoNotePointRecordBuilder toBuilder() =>
      new PhotoNotePointRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhotoNotePointRecord &&
        dx == other.dx &&
        dy == other.dy &&
        description == other.description &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, dx.hashCode), dy.hashCode), description.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PhotoNotePointRecord')
          ..add('dx', dx)
          ..add('dy', dy)
          ..add('description', description)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PhotoNotePointRecordBuilder
    implements Builder<PhotoNotePointRecord, PhotoNotePointRecordBuilder> {
  _$PhotoNotePointRecord? _$v;

  double? _dx;
  double? get dx => _$this._dx;
  set dx(double? dx) => _$this._dx = dx;

  double? _dy;
  double? get dy => _$this._dy;
  set dy(double? dy) => _$this._dy = dy;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PhotoNotePointRecordBuilder() {
    PhotoNotePointRecord._initializeBuilder(this);
  }

  PhotoNotePointRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _dx = $v.dx;
      _dy = $v.dy;
      _description = $v.description;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PhotoNotePointRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PhotoNotePointRecord;
  }

  @override
  void update(void Function(PhotoNotePointRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PhotoNotePointRecord build() => _build();

  _$PhotoNotePointRecord _build() {
    final _$result = _$v ??
        new _$PhotoNotePointRecord._(
            dx: dx, dy: dy, description: description, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
