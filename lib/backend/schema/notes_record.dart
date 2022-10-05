import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'notes_record.g.dart';

abstract class NotesRecord implements Built<NotesRecord, NotesRecordBuilder> {
  static Serializer<NotesRecord> get serializer => _$notesRecordSerializer;

  @BuiltValueField(wireName: 'Title')
  String? get title;

  String? get description;

  @BuiltValueField(wireName: 'is_checkbox')
  bool? get isCheckbox;

  String? get image;

  @BuiltValueField(wireName: 'created_by')
  DocumentReference? get createdBy;

  @BuiltValueField(wireName: 'created_at')
  DateTime? get createdAt;

  @BuiltValueField(wireName: 'photo_notes')
  BuiltList<DocumentReference>? get photoNotes;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(NotesRecordBuilder builder) => builder
    ..title = ''
    ..description = ''
    ..isCheckbox = false
    ..image = ''
    ..photoNotes = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notes');

  static Stream<NotesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<NotesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  NotesRecord._();
  factory NotesRecord([void Function(NotesRecordBuilder) updates]) =
      _$NotesRecord;

  static NotesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createNotesRecordData({
  String? title,
  String? description,
  bool? isCheckbox,
  String? image,
  DocumentReference? createdBy,
  DateTime? createdAt,
}) {
  final firestoreData = serializers.toFirestore(
    NotesRecord.serializer,
    NotesRecord(
      (n) => n
        ..title = title
        ..description = description
        ..isCheckbox = isCheckbox
        ..image = image
        ..createdBy = createdBy
        ..createdAt = createdAt
        ..photoNotes = null,
    ),
  );

  return firestoreData;
}
