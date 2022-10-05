import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'photo_notes_record.g.dart';

abstract class PhotoNotesRecord
    implements Built<PhotoNotesRecord, PhotoNotesRecordBuilder> {
  static Serializer<PhotoNotesRecord> get serializer =>
      _$photoNotesRecordSerializer;

  double? get dx;

  double? get dy;

  String? get description;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  DocumentReference get parentReference => reference.parent.parent!;

  static void _initializeBuilder(PhotoNotesRecordBuilder builder) => builder
    ..dx = 0.0
    ..dy = 0.0
    ..description = '';

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('photo_notes')
          : FirebaseFirestore.instance.collectionGroup('photo_notes');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('photo_notes').doc();

  static Stream<PhotoNotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PhotoNotesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PhotoNotesRecord._();
  factory PhotoNotesRecord([void Function(PhotoNotesRecordBuilder) updates]) =
      _$PhotoNotesRecord;

  static PhotoNotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPhotoNotesRecordData({
  double? dx,
  double? dy,
  String? description,
}) {
  final firestoreData = serializers.toFirestore(
    PhotoNotesRecord.serializer,
    PhotoNotesRecord(
      (p) => p
        ..dx = dx
        ..dy = dy
        ..description = description,
    ),
  );

  return firestoreData;
}
