// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tools_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ToolsRecord> _$toolsRecordSerializer = new _$ToolsRecordSerializer();

class _$ToolsRecordSerializer implements StructuredSerializer<ToolsRecord> {
  @override
  final Iterable<Type> types = const [ToolsRecord, _$ToolsRecord];
  @override
  final String wireName = 'ToolsRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ToolsRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.toolName;
    if (value != null) {
      result
        ..add('ToolName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('Description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.shopName;
    if (value != null) {
      result
        ..add('ShopName')
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
        ..add('buy_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.photo;
    if (value != null) {
      result
        ..add('Photo')
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
    value = object.chequeIMG;
    if (value != null) {
      result
        ..add('chequeIMG')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.chequeName;
    if (value != null) {
      result
        ..add('chequeName')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isCheque;
    if (value != null) {
      result
        ..add('is_cheque')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.inSale;
    if (value != null) {
      result
        ..add('inSale')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('Price')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
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
  ToolsRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ToolsRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'ToolName':
          result.toolName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'ShopName':
          result.shopName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'buy_date':
          result.buyDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'Photo':
          result.photo = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'chequeIMG':
          result.chequeIMG = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'chequeName':
          result.chequeName = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_cheque':
          result.isCheque = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'inSale':
          result.inSale = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Price':
          result.price = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
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

class _$ToolsRecord extends ToolsRecord {
  @override
  final String? toolName;
  @override
  final String? description;
  @override
  final String? shopName;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? buyDate;
  @override
  final String? photo;
  @override
  final DateTime? createdAt;
  @override
  final String? chequeIMG;
  @override
  final String? chequeName;
  @override
  final String? isCheque;
  @override
  final bool? inSale;
  @override
  final double? price;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ToolsRecord([void Function(ToolsRecordBuilder)? updates]) =>
      (new ToolsRecordBuilder()..update(updates))._build();

  _$ToolsRecord._(
      {this.toolName,
      this.description,
      this.shopName,
      this.createdBy,
      this.buyDate,
      this.photo,
      this.createdAt,
      this.chequeIMG,
      this.chequeName,
      this.isCheque,
      this.inSale,
      this.price,
      this.ffRef})
      : super._();

  @override
  ToolsRecord rebuild(void Function(ToolsRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ToolsRecordBuilder toBuilder() => new ToolsRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ToolsRecord &&
        toolName == other.toolName &&
        description == other.description &&
        shopName == other.shopName &&
        createdBy == other.createdBy &&
        buyDate == other.buyDate &&
        photo == other.photo &&
        createdAt == other.createdAt &&
        chequeIMG == other.chequeIMG &&
        chequeName == other.chequeName &&
        isCheque == other.isCheque &&
        inSale == other.inSale &&
        price == other.price &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc($jc(0, toolName.hashCode),
                                                    description.hashCode),
                                                shopName.hashCode),
                                            createdBy.hashCode),
                                        buyDate.hashCode),
                                    photo.hashCode),
                                createdAt.hashCode),
                            chequeIMG.hashCode),
                        chequeName.hashCode),
                    isCheque.hashCode),
                inSale.hashCode),
            price.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ToolsRecord')
          ..add('toolName', toolName)
          ..add('description', description)
          ..add('shopName', shopName)
          ..add('createdBy', createdBy)
          ..add('buyDate', buyDate)
          ..add('photo', photo)
          ..add('createdAt', createdAt)
          ..add('chequeIMG', chequeIMG)
          ..add('chequeName', chequeName)
          ..add('isCheque', isCheque)
          ..add('inSale', inSale)
          ..add('price', price)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ToolsRecordBuilder implements Builder<ToolsRecord, ToolsRecordBuilder> {
  _$ToolsRecord? _$v;

  String? _toolName;
  String? get toolName => _$this._toolName;
  set toolName(String? toolName) => _$this._toolName = toolName;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _shopName;
  String? get shopName => _$this._shopName;
  set shopName(String? shopName) => _$this._shopName = shopName;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DateTime? _buyDate;
  DateTime? get buyDate => _$this._buyDate;
  set buyDate(DateTime? buyDate) => _$this._buyDate = buyDate;

  String? _photo;
  String? get photo => _$this._photo;
  set photo(String? photo) => _$this._photo = photo;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  String? _chequeIMG;
  String? get chequeIMG => _$this._chequeIMG;
  set chequeIMG(String? chequeIMG) => _$this._chequeIMG = chequeIMG;

  String? _chequeName;
  String? get chequeName => _$this._chequeName;
  set chequeName(String? chequeName) => _$this._chequeName = chequeName;

  String? _isCheque;
  String? get isCheque => _$this._isCheque;
  set isCheque(String? isCheque) => _$this._isCheque = isCheque;

  bool? _inSale;
  bool? get inSale => _$this._inSale;
  set inSale(bool? inSale) => _$this._inSale = inSale;

  double? _price;
  double? get price => _$this._price;
  set price(double? price) => _$this._price = price;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ToolsRecordBuilder() {
    ToolsRecord._initializeBuilder(this);
  }

  ToolsRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _toolName = $v.toolName;
      _description = $v.description;
      _shopName = $v.shopName;
      _createdBy = $v.createdBy;
      _buyDate = $v.buyDate;
      _photo = $v.photo;
      _createdAt = $v.createdAt;
      _chequeIMG = $v.chequeIMG;
      _chequeName = $v.chequeName;
      _isCheque = $v.isCheque;
      _inSale = $v.inSale;
      _price = $v.price;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ToolsRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ToolsRecord;
  }

  @override
  void update(void Function(ToolsRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ToolsRecord build() => _build();

  _$ToolsRecord _build() {
    final _$result = _$v ??
        new _$ToolsRecord._(
            toolName: toolName,
            description: description,
            shopName: shopName,
            createdBy: createdBy,
            buyDate: buyDate,
            photo: photo,
            createdAt: createdAt,
            chequeIMG: chequeIMG,
            chequeName: chequeName,
            isCheque: isCheque,
            inSale: inSale,
            price: price,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
