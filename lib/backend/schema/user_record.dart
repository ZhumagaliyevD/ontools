import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_record.g.dart';

abstract class UserRecord implements Built<UserRecord, UserRecordBuilder> {
  static Serializer<UserRecord> get serializer => _$userRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  AddressStruct get address;

  String? get specialty;

  DateTime? get birthday;

  String? get industry;

  @BuiltValueField(wireName: 'trial_start')
  DateTime? get trialStart;

  PermissionsStruct get permissions;

  bool? get isCompleteTrial;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..address = AddressStructBuilder()
    ..specialty = ''
    ..industry = ''
    ..permissions = PermissionsStructBuilder()
    ..isCompleteTrial = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserRecord._();
  factory UserRecord([void Function(UserRecordBuilder) updates]) = _$UserRecord;

  static UserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  AddressStruct? address,
  String? specialty,
  DateTime? birthday,
  String? industry,
  DateTime? trialStart,
  PermissionsStruct? permissions,
  bool? isCompleteTrial,
}) {
  final firestoreData = serializers.toFirestore(
    UserRecord.serializer,
    UserRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..address = AddressStructBuilder()
        ..specialty = specialty
        ..birthday = birthday
        ..industry = industry
        ..trialStart = trialStart
        ..permissions = PermissionsStructBuilder()
        ..isCompleteTrial = isCompleteTrial,
    ),
  );

  // Handle nested data for "address" field.
  addAddressStructData(firestoreData, address, 'address');

  // Handle nested data for "permissions" field.
  addPermissionsStructData(firestoreData, permissions, 'permissions');

  return firestoreData;
}
