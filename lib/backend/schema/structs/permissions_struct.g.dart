// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions_struct.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PermissionsStruct> _$permissionsStructSerializer =
    new _$PermissionsStructSerializer();

class _$PermissionsStructSerializer
    implements StructuredSerializer<PermissionsStruct> {
  @override
  final Iterable<Type> types = const [PermissionsStruct, _$PermissionsStruct];
  @override
  final String wireName = 'PermissionsStruct';

  @override
  Iterable<Object?> serialize(Serializers serializers, PermissionsStruct object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[
      'firestoreUtilData',
      serializers.serialize(object.firestoreUtilData,
          specifiedType: const FullType(FirestoreUtilData)),
    ];
    Object? value;
    value = object.createDoc;
    if (value != null) {
      result
        ..add('create_doc')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.deleteDoc;
    if (value != null) {
      result
        ..add('delete_doc')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.updateDoc;
    if (value != null) {
      result
        ..add('update_doc')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    return result;
  }

  @override
  PermissionsStruct deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PermissionsStructBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'create_doc':
          result.createDoc = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'delete_doc':
          result.deleteDoc = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'update_doc':
          result.updateDoc = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'firestoreUtilData':
          result.firestoreUtilData = serializers.deserialize(value,
                  specifiedType: const FullType(FirestoreUtilData))!
              as FirestoreUtilData;
          break;
      }
    }

    return result.build();
  }
}

class _$PermissionsStruct extends PermissionsStruct {
  @override
  final bool? createDoc;
  @override
  final bool? deleteDoc;
  @override
  final bool? updateDoc;
  @override
  final FirestoreUtilData firestoreUtilData;

  factory _$PermissionsStruct(
          [void Function(PermissionsStructBuilder)? updates]) =>
      (new PermissionsStructBuilder()..update(updates))._build();

  _$PermissionsStruct._(
      {this.createDoc,
      this.deleteDoc,
      this.updateDoc,
      required this.firestoreUtilData})
      : super._() {
    BuiltValueNullFieldError.checkNotNull(
        firestoreUtilData, r'PermissionsStruct', 'firestoreUtilData');
  }

  @override
  PermissionsStruct rebuild(void Function(PermissionsStructBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PermissionsStructBuilder toBuilder() =>
      new PermissionsStructBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PermissionsStruct &&
        createDoc == other.createDoc &&
        deleteDoc == other.deleteDoc &&
        updateDoc == other.updateDoc &&
        firestoreUtilData == other.firestoreUtilData;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, createDoc.hashCode), deleteDoc.hashCode),
            updateDoc.hashCode),
        firestoreUtilData.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PermissionsStruct')
          ..add('createDoc', createDoc)
          ..add('deleteDoc', deleteDoc)
          ..add('updateDoc', updateDoc)
          ..add('firestoreUtilData', firestoreUtilData))
        .toString();
  }
}

class PermissionsStructBuilder
    implements Builder<PermissionsStruct, PermissionsStructBuilder> {
  _$PermissionsStruct? _$v;

  bool? _createDoc;
  bool? get createDoc => _$this._createDoc;
  set createDoc(bool? createDoc) => _$this._createDoc = createDoc;

  bool? _deleteDoc;
  bool? get deleteDoc => _$this._deleteDoc;
  set deleteDoc(bool? deleteDoc) => _$this._deleteDoc = deleteDoc;

  bool? _updateDoc;
  bool? get updateDoc => _$this._updateDoc;
  set updateDoc(bool? updateDoc) => _$this._updateDoc = updateDoc;

  FirestoreUtilData? _firestoreUtilData;
  FirestoreUtilData? get firestoreUtilData => _$this._firestoreUtilData;
  set firestoreUtilData(FirestoreUtilData? firestoreUtilData) =>
      _$this._firestoreUtilData = firestoreUtilData;

  PermissionsStructBuilder() {
    PermissionsStruct._initializeBuilder(this);
  }

  PermissionsStructBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _createDoc = $v.createDoc;
      _deleteDoc = $v.deleteDoc;
      _updateDoc = $v.updateDoc;
      _firestoreUtilData = $v.firestoreUtilData;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PermissionsStruct other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PermissionsStruct;
  }

  @override
  void update(void Function(PermissionsStructBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PermissionsStruct build() => _build();

  _$PermissionsStruct _build() {
    final _$result = _$v ??
        new _$PermissionsStruct._(
            createDoc: createDoc,
            deleteDoc: deleteDoc,
            updateDoc: updateDoc,
            firestoreUtilData: BuiltValueNullFieldError.checkNotNull(
                firestoreUtilData, r'PermissionsStruct', 'firestoreUtilData'));
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
