// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reports_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ReportsRecord> _$reportsRecordSerializer =
    new _$ReportsRecordSerializer();

class _$ReportsRecordSerializer implements StructuredSerializer<ReportsRecord> {
  @override
  final Iterable<Type> types = const [ReportsRecord, _$ReportsRecord];
  @override
  final String wireName = 'ReportsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ReportsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.startDate;
    if (value != null) {
      result
        ..add('Start_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.endDate;
    if (value != null) {
      result
        ..add('End_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.tools;
    if (value != null) {
      result
        ..add('Tools')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
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
  ReportsRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ReportsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Start_date':
          result.startDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'End_date':
          result.endDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Tools':
          result.tools.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
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

class _$ReportsRecord extends ReportsRecord {
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final BuiltList<DocumentReference<Object?>>? tools;
  @override
  final DateTime? createdAt;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ReportsRecord([void Function(ReportsRecordBuilder)? updates]) =>
      (new ReportsRecordBuilder()..update(updates))._build();

  _$ReportsRecord._(
      {this.startDate,
      this.endDate,
      this.createdBy,
      this.tools,
      this.createdAt,
      this.ffRef})
      : super._();

  @override
  ReportsRecord rebuild(void Function(ReportsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ReportsRecordBuilder toBuilder() => new ReportsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ReportsRecord &&
        startDate == other.startDate &&
        endDate == other.endDate &&
        createdBy == other.createdBy &&
        tools == other.tools &&
        createdAt == other.createdAt &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, startDate.hashCode), endDate.hashCode),
                    createdBy.hashCode),
                tools.hashCode),
            createdAt.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ReportsRecord')
          ..add('startDate', startDate)
          ..add('endDate', endDate)
          ..add('createdBy', createdBy)
          ..add('tools', tools)
          ..add('createdAt', createdAt)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ReportsRecordBuilder
    implements Builder<ReportsRecord, ReportsRecordBuilder> {
  _$ReportsRecord? _$v;

  DateTime? _startDate;
  DateTime? get startDate => _$this._startDate;
  set startDate(DateTime? startDate) => _$this._startDate = startDate;

  DateTime? _endDate;
  DateTime? get endDate => _$this._endDate;
  set endDate(DateTime? endDate) => _$this._endDate = endDate;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  ListBuilder<DocumentReference<Object?>>? _tools;
  ListBuilder<DocumentReference<Object?>> get tools =>
      _$this._tools ??= new ListBuilder<DocumentReference<Object?>>();
  set tools(ListBuilder<DocumentReference<Object?>>? tools) =>
      _$this._tools = tools;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ReportsRecordBuilder() {
    ReportsRecord._initializeBuilder(this);
  }

  ReportsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _startDate = $v.startDate;
      _endDate = $v.endDate;
      _createdBy = $v.createdBy;
      _tools = $v.tools?.toBuilder();
      _createdAt = $v.createdAt;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ReportsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ReportsRecord;
  }

  @override
  void update(void Function(ReportsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ReportsRecord build() => _build();

  _$ReportsRecord _build() {
    _$ReportsRecord _$result;
    try {
      _$result = _$v ??
          new _$ReportsRecord._(
              startDate: startDate,
              endDate: endDate,
              createdBy: createdBy,
              tools: _tools?.build(),
              createdAt: createdAt,
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'tools';
        _tools?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ReportsRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
