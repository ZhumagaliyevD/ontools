import 'dart:async';

import '../index.dart';
import '../serializers.dart';
import 'package:built_value/built_value.dart';

part 'permissions_struct.g.dart';

abstract class PermissionsStruct
    implements Built<PermissionsStruct, PermissionsStructBuilder> {
  static Serializer<PermissionsStruct> get serializer =>
      _$permissionsStructSerializer;

  @BuiltValueField(wireName: 'create_doc')
  bool? get createDoc;

  @BuiltValueField(wireName: 'delete_doc')
  bool? get deleteDoc;

  @BuiltValueField(wireName: 'update_doc')
  bool? get updateDoc;

  /// Utility class for Firestore updates
  FirestoreUtilData get firestoreUtilData;

  static void _initializeBuilder(PermissionsStructBuilder builder) => builder
    ..createDoc = false
    ..deleteDoc = false
    ..updateDoc = false
    ..firestoreUtilData = FirestoreUtilData();

  PermissionsStruct._();
  factory PermissionsStruct([void Function(PermissionsStructBuilder) updates]) =
      _$PermissionsStruct;
}

PermissionsStruct createPermissionsStruct({
  bool? createDoc,
  bool? deleteDoc,
  bool? updateDoc,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PermissionsStruct(
      (p) => p
        ..createDoc = createDoc
        ..deleteDoc = deleteDoc
        ..updateDoc = updateDoc
        ..firestoreUtilData = FirestoreUtilData(
          clearUnsetFields: clearUnsetFields,
          create: create,
          delete: delete,
          fieldValues: fieldValues,
        ),
    );

PermissionsStruct? updatePermissionsStruct(
  PermissionsStruct? permissions, {
  bool clearUnsetFields = true,
}) =>
    permissions != null
        ? (permissions.toBuilder()
              ..firestoreUtilData =
                  FirestoreUtilData(clearUnsetFields: clearUnsetFields))
            .build()
        : null;

void addPermissionsStructData(
  Map<String, dynamic> firestoreData,
  PermissionsStruct? permissions,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (permissions == null) {
    return;
  }
  if (permissions.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  if (!forFieldValue && permissions.firestoreUtilData.clearUnsetFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final permissionsData =
      getPermissionsFirestoreData(permissions, forFieldValue);
  final nestedData =
      permissionsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final create = permissions.firestoreUtilData.create;
  firestoreData.addAll(create ? mergeNestedFields(nestedData) : nestedData);

  return;
}

Map<String, dynamic> getPermissionsFirestoreData(
  PermissionsStruct? permissions, [
  bool forFieldValue = false,
]) {
  if (permissions == null) {
    return {};
  }
  final firestoreData =
      serializers.toFirestore(PermissionsStruct.serializer, permissions);

  // Add any Firestore field values
  permissions.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPermissionsListFirestoreData(
  List<PermissionsStruct>? permissionss,
) =>
    permissionss?.map((p) => getPermissionsFirestoreData(p, true)).toList() ??
    [];
