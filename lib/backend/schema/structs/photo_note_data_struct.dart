import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'photo_note_data_struct.g.dart';

abstract class PhotoNoteDataStruct
    implements Built<PhotoNoteDataStruct, PhotoNoteDataStructBuilder> {
  static Serializer<PhotoNoteDataStruct> get serializer =>
      _$photoNoteDataStructSerializer;

  double? get dx;

  double? get dy;

  String? get description;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(PhotoNoteDataStructBuilder builder) => builder
    ..dx = 0.0
    ..dy = 0.0
    ..description = ''
    ..firestoreUtilData = FirestoreUtilData();

  PhotoNoteDataStruct._();
  factory PhotoNoteDataStruct(
          [void Function(PhotoNoteDataStructBuilder) updates]) =
      _$PhotoNoteDataStruct;
}

PhotoNoteDataStruct createPhotoNoteDataStruct({
  double? dx,
  double? dy,
  String? description,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PhotoNoteDataStruct(
      (p) => p
        ..dx = dx
        ..dy = dy
        ..description = description
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

PhotoNoteDataStruct? updatePhotoNoteDataStruct(
  PhotoNoteDataStruct? photoNoteData, {
  bool clearUnsetFields = true,
}) =>
    photoNoteData != null
        ? (photoNoteData.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addPhotoNoteDataStructData(
  Map<String, dynamic> firestoreData,
  PhotoNoteDataStruct? photoNoteData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (photoNoteData == null) {
    return;
  }
  if (photoNoteData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && photoNoteData.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final photoNoteDataData =
      getPhotoNoteDataFirestoreData(photoNoteData, forFieldValue);
  final nestedData =
      photoNoteDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = photoNoteData.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getPhotoNoteDataFirestoreData(
  PhotoNoteDataStruct? photoNoteData, [
  bool forFieldValue = false,
]) {
  if (photoNoteData == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(PhotoNoteDataStruct.serializer, photoNoteData);

  // Add any Firestore field values
  photoNoteData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPhotoNoteDataListFirestoreData(
  List<PhotoNoteDataStruct>? photoNoteDatas,
) =>
    photoNoteDatas
        ?.map((p) => getPhotoNoteDataFirestoreData(p, true))
        .toList() ??
    [];
