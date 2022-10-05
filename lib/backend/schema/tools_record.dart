import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tools_record.g.dart';

abstract class ToolsRecord implements Built<ToolsRecord, ToolsRecordBuilder> {
  static Serializer<ToolsRecord> get serializer => _$toolsRecordSerializer;

  @BuiltValueField(wireName: 'ToolName')
  String? get toolName;

  @BuiltValueField(wireName: 'Price')
  int? get price;

  @BuiltValueField(wireName: 'Description')
  String? get description;

  @BuiltValueField(wireName: 'ShopName')
  String? get shopName;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'buy_date')
  DateTime? get buyDate;

  @BuiltValueField(wireName: 'Photo')
  String? get photo;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get chequeIMG;

  String? get chequeName;

  @BuiltValueField(wireName: 'is_cheque')
  String? get isCheque;

  bool? get inSale;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ToolsRecordBuilder builder) => builder
    ..toolName = ''
    ..price = 0
    ..description = ''
    ..shopName = ''
    ..photo = ''
    ..chequeIMG = ''
    ..chequeName = ''
    ..isCheque = ''
    ..inSale = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Tools');

  static Stream<ToolsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ToolsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ToolsRecord._();
  factory ToolsRecord([void Function(ToolsRecordBuilder) updates]) =
      _$ToolsRecord;

  static ToolsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createToolsRecordData({
  String? toolName,
  int? price,
  String? description,
  String? shopName,
  DocumentReference? createdBy,
  DateTime? buyDate,
  String? photo,
  DateTime? createdAt,
  String? chequeIMG,
  String? chequeName,
  String? isCheque,
  bool? inSale,
}) {
  final firestoreData = serializers.toFirestore(
    ToolsRecord.serializer,
    ToolsRecord(
      (t) => t
        ..toolName = toolName
        ..price = price
        ..description = description
        ..shopName = shopName
        ..createdBy = createdBy
        ..buyDate = buyDate
        ..photo = photo
        ..createdAt = createdAt
        ..chequeIMG = chequeIMG
        ..chequeName = chequeName
        ..isCheque = isCheque
        ..inSale = inSale,
    ),
  );

  return firestoreData;
}
