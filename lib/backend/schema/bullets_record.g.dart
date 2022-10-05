// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bullets_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<BulletsRecord> _$bulletsRecordSerializer =
    new _$BulletsRecordSerializer();

class _$BulletsRecordSerializer implements StructuredSerializer<BulletsRecord> {
  @override
  final Iterable<Type> types = const [BulletsRecord, _$BulletsRecord];
  @override
  final String wireName = 'BulletsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, BulletsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.isDone;
    if (value != null) {
      result
        ..add('isDone')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
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
  BulletsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new BulletsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'isDone':
          result.isDone = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
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

class _$BulletsRecord extends BulletsRecord {
  @override
  final bool? isDone;
  @override
  final String? text;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$BulletsRecord([void Function(BulletsRecordBuilder)? updates]) =>
      (new BulletsRecordBuilder()..update(updates))._build();

  _$BulletsRecord._({this.isDone, this.text, this.ffRef}) : super._();

  @override
  BulletsRecord rebuild(void Function(BulletsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  BulletsRecordBuilder toBuilder() => new BulletsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is BulletsRecord &&
        isDone == other.isDone &&
        text == other.text &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, isDone.hashCode), text.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'BulletsRecord')
          ..add('isDone', isDone)
          ..add('text', text)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class BulletsRecordBuilder
    implements Builder<BulletsRecord, BulletsRecordBuilder> {
  _$BulletsRecord? _$v;

  bool? _isDone;
  bool? get isDone => _$this._isDone;
  set isDone(bool? isDone) => _$this._isDone = isDone;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  BulletsRecordBuilder() {
    BulletsRecord._initializeBuilder(this);
  }

  BulletsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _isDone = $v.isDone;
      _text = $v.text;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(BulletsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$BulletsRecord;
  }

  @override
  void update(void Function(BulletsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  BulletsRecord build() => _build();

  _$BulletsRecord _build() {
    final _$result =
        _$v ?? new _$BulletsRecord._(isDone: isDone, text: text, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
