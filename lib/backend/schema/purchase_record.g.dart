// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'purchase_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PurchaseRecord> _$purchaseRecordSerializer =
    new _$PurchaseRecordSerializer();

class _$PurchaseRecordSerializer
    implements StructuredSerializer<PurchaseRecord> {
  @override
  final Iterable<Type> types = const [PurchaseRecord, _$PurchaseRecord];
  @override
  final String wireName = 'PurchaseRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PurchaseRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.toolName;
    if (value != null) {
      result
        ..add('toolName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chqueImg;
    if (value != null) {
      result
        ..add('chqueImg')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.buyDate;
    if (value != null) {
      result
        ..add('buyDate')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.chequeName;
    if (value != null) {
      result
        ..add('chequeName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.storeAddress;
    if (value != null) {
      result
        ..add('storeAddress')
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
  PurchaseRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PurchaseRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'toolName':
          result.toolName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chqueImg':
          result.chqueImg = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'buyDate':
          result.buyDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'chequeName':
          result.chequeName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'storeAddress':
          result.storeAddress = serializers.deserialize(value,
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

class _$PurchaseRecord extends PurchaseRecord {
  @override
  final String? toolName;
  @override
  final String? chqueImg;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? buyDate;
  @override
  final String? chequeName;
  @override
  final DateTime? createdAt;
  @override
  final String? storeAddress;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PurchaseRecord([void Function(PurchaseRecordBuilder)? updates]) =>
      (new PurchaseRecordBuilder()..update(updates))._build();

  _$PurchaseRecord._(
      {this.toolName,
      this.chqueImg,
      this.createdBy,
      this.buyDate,
      this.chequeName,
      this.createdAt,
      this.storeAddress,
      this.ffRef})
      : super._();

  @override
  PurchaseRecord rebuild(void Function(PurchaseRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PurchaseRecordBuilder toBuilder() =>
      new PurchaseRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PurchaseRecord &&
        toolName == other.toolName &&
        chqueImg == other.chqueImg &&
        createdBy == other.createdBy &&
        buyDate == other.buyDate &&
        chequeName == other.chequeName &&
        createdAt == other.createdAt &&
        storeAddress == other.storeAddress &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, toolName.hashCode), chqueImg.hashCode),
                            createdBy.hashCode),
                        buyDate.hashCode),
                    chequeName.hashCode),
                createdAt.hashCode),
            storeAddress.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PurchaseRecord')
          ..add('toolName', toolName)
          ..add('chqueImg', chqueImg)
          ..add('createdBy', createdBy)
          ..add('buyDate', buyDate)
          ..add('chequeName', chequeName)
          ..add('createdAt', createdAt)
          ..add('storeAddress', storeAddress)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PurchaseRecordBuilder
    implements Builder<PurchaseRecord, PurchaseRecordBuilder> {
  _$PurchaseRecord? _$v;

  String? _toolName;
  String? get toolName => _$this._toolName;
  set toolName(String? toolName) => _$this._toolName = toolName;

  String? _chqueImg;
  String? get chqueImg => _$this._chqueImg;
  set chqueImg(String? chqueImg) => _$this._chqueImg = chqueImg;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DateTime? _buyDate;
  DateTime? get buyDate => _$this._buyDate;
  set buyDate(DateTime? buyDate) => _$this._buyDate = buyDate;

  String? _chequeName;
  String? get chequeName => _$this._chequeName;
  set chequeName(String? chequeName) => _$this._chequeName = chequeName;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _storeAddress;
  String? get storeAddress => _$this._storeAddress;
  set storeAddress(String? storeAddress) => _$this._storeAddress = storeAddress;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PurchaseRecordBuilder() {
    PurchaseRecord._initializeBuilder(this);
  }

  PurchaseRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _toolName = $v.toolName;
      _chqueImg = $v.chqueImg;
      _createdBy = $v.createdBy;
      _buyDate = $v.buyDate;
      _chequeName = $v.chequeName;
      _createdAt = $v.createdAt;
      _storeAddress = $v.storeAddress;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PurchaseRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PurchaseRecord;
  }

  @override
  void update(void Function(PurchaseRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PurchaseRecord build() => _build();

  _$PurchaseRecord _build() {
    final _$result = _$v ??
        new _$PurchaseRecord._(
            toolName: toolName,
            chqueImg: chqueImg,
            createdBy: createdBy,
            buyDate: buyDate,
            chequeName: chequeName,
            createdAt: createdAt,
            storeAddress: storeAddress,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
