import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'photo_note_point_record.g.dart';

abstract class PhotoNotePointRecord
    implements Built<PhotoNotePointRecord, PhotoNotePointRecordBuilder> {
  static Serializer<PhotoNotePointRecord> get serializer =>
      _$photoNotePointRecordSerializer;

  double? get dx;

  double? get dy;

  String? get description;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PhotoNotePointRecordBuilder builder) => builder
    ..dx = 0.0
    ..dy = 0.0
    ..description = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('photo_note_point');

  static Stream<PhotoNotePointRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PhotoNotePointRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PhotoNotePointRecord._();
  factory PhotoNotePointRecord(
          [void Function(PhotoNotePointRecordBuilder) updates]) =
      _$PhotoNotePointRecord;

  static PhotoNotePointRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPhotoNotePointRecordData({
  double? dx,
  double? dy,
  String? description,
}) {
  final firestoreData = serializers.toFirestore(
    PhotoNotePointRecord.serializer,
    PhotoNotePointRecord(
      (p) => p
        ..dx = dx
        ..dy = dy
        ..description = description,
    ),
  );

  return firestoreData;
}
