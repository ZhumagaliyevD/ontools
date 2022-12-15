import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'reports_record.g.dart';

abstract class ReportsRecord
    implements Built<ReportsRecord, ReportsRecordBuilder> {
  static Serializer<ReportsRecord> get serializer => _$reportsRecordSerializer;

  @BuiltValueField(wireName: 'Start_date')
  DateTime? get startDate;

  @BuiltValueField(wireName: 'End_date')
  DateTime? get endDate;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'Tools')
  BuiltList<DocumentReference>? get tools;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  String? get pdfFile;

  @BuiltValueField(wireName: 'Tool2')
  BuiltList<DocumentReference>? get tool2;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(ReportsRecordBuilder builder) => builder
    ..tools = ListBuilder()
    ..pdfFile = ''
    ..tool2 = ListBuilder();

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('reports')
          : FirebaseFirestore.instance.collectionGroup('reports');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('reports').doc();

  static Stream<ReportsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ReportsRecord._();
  factory ReportsRecord([void Function(ReportsRecordBuilder) updates]) =
      _$ReportsRecord;

  static ReportsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createReportsRecordData({
  DateTime? startDate,
  DateTime? endDate,
  DocumentReference? createdBy,
  DateTime? createdAt,
  String? pdfFile,
}) {
  final firestoreData = serializers.toFirestore(
    ReportsRecord.serializer,
    ReportsRecord(
      (r) => r
        ..startDate = startDate
        ..endDate = endDate
        ..createdBy = createdBy
        ..tools = null
        ..createdAt = createdAt
        ..pdfFile = pdfFile
        ..tool2 = null,
    ),
  );

  return firestoreData;
}
