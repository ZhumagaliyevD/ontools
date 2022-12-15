import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'purchase_record.g.dart';

abstract class PurchaseRecord
    implements Built<PurchaseRecord, PurchaseRecordBuilder> {
  static Serializer<PurchaseRecord> get serializer =>
      _$purchaseRecordSerializer;

  String? get toolName;

  String? get chqueImg;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  DateTime? get buyDate;

  String? get chequeName;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PurchaseRecordBuilder builder) => builder
    ..toolName = ''
    ..chqueImg = ''
    ..chequeName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('purchase');

  static Stream<PurchaseRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PurchaseRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PurchaseRecord._();
  factory PurchaseRecord([void Function(PurchaseRecordBuilder) updates]) =
      _$PurchaseRecord;

  static PurchaseRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPurchaseRecordData({
  String? toolName,
  String? chqueImg,
  DocumentReference? createdBy,
  DateTime? buyDate,
  String? chequeName,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    PurchaseRecord.serializer,
    PurchaseRecord(
      (p) => p
        ..toolName = toolName
        ..chqueImg = chqueImg
        ..createdBy = createdBy
        ..buyDate = buyDate
        ..chequeName = chequeName
        ..createdAt = createdAt,
    ),
  );

  return firestoreData;
}
