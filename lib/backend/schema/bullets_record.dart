import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'bullets_record.g.dart';

abstract class BulletsRecord
    implements Built<BulletsRecord, BulletsRecordBuilder> {
  static Serializer<BulletsRecord> get serializer => _$bulletsRecordSerializer;

  bool? get isDone;

  String? get text;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(BulletsRecordBuilder builder) => builder
    ..isDone = false
    ..text = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('bullets')
          : FirebaseFirestore.instance.collectionGroup('bullets');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('bullets').doc();

  static Stream<BulletsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<BulletsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  BulletsRecord._();
  factory BulletsRecord([void Function(BulletsRecordBuilder) updates]) =
      _$BulletsRecord;

  static BulletsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createBulletsRecordData({
  bool? isDone,
  String? text,
}) {
  final firestoreData = serializers.toFirestore(
    BulletsRecord.serializer,
    BulletsRecord(
      (b) => b
        ..isDone = isDone
        ..text = text,
    ),
  );

  return firestoreData;
}
