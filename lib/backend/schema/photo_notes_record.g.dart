// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_notes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PhotoNotesRecord> _$photoNotesRecordSerializer =
    new _$PhotoNotesRecordSerializer();

class _$PhotoNotesRecordSerializer
    implements StructuredSerializer<PhotoNotesRecord> {
  @override
  final Iterable<Type> types = const [PhotoNotesRecord, _$PhotoNotesRecord];
  @override
  final String wireName = 'PhotoNotesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PhotoNotesRecord object,
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
  PhotoNotesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PhotoNotesRecordBuilder();

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

class _$PhotoNotesRecord extends PhotoNotesRecord {
  @override
  final double? dx;
  @override
  final double? dy;
  @override
  final String? description;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PhotoNotesRecord(
          [void Function(PhotoNotesRecordBuilder)? updates]) =>
      (new PhotoNotesRecordBuilder()..update(updates))._build();

  _$PhotoNotesRecord._({this.dx, this.dy, this.description, this.ffRef})
      : super._();

  @override
  PhotoNotesRecord rebuild(void Function(PhotoNotesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PhotoNotesRecordBuilder toBuilder() =>
      new PhotoNotesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PhotoNotesRecord &&
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
    return (newBuiltValueToStringHelper(r'PhotoNotesRecord')
          ..add('dx', dx)
          ..add('dy', dy)
          ..add('description', description)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PhotoNotesRecordBuilder
    implements Builder<PhotoNotesRecord, PhotoNotesRecordBuilder> {
  _$PhotoNotesRecord? _$v;

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

  PhotoNotesRecordBuilder() {
    PhotoNotesRecord._initializeBuilder(this);
  }

  PhotoNotesRecordBuilder get _$this {
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
  void replace(PhotoNotesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PhotoNotesRecord;
  }

  @override
  void update(void Function(PhotoNotesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PhotoNotesRecord build() => _build();

  _$PhotoNotesRecord _build() {
    final _$result = _$v ??
        new _$PhotoNotesRecord._(
            dx: dx, dy: dy, description: description, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
