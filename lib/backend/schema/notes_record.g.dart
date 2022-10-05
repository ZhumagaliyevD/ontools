// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<NotesRecord> _$notesRecordSerializer = new _$NotesRecordSerializer();

class _$NotesRecordSerializer implements StructuredSerializer<NotesRecord> {
  @override
  final Iterable<Type> types = const [NotesRecord, _$NotesRecord];
  @override
  final String wireName = 'NotesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, NotesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('Title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.isCheckbox;
    if (value != null) {
      result
        ..add('is_checkbox')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdBy;
    if (value != null) {
      result
        ..add('created_by')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('created_at')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.photoNotes;
    if (value != null) {
      result
        ..add('photo_notes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(
                  DocumentReference, const [const FullType.nullable(Object)])
            ])));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  NotesRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new NotesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'is_checkbox':
          result.isCheckbox = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'created_by':
          result.createdBy = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'created_at':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'photo_notes':
          result.photoNotes.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType.nullable(Object)])
              ]))! as BuiltList<Object?>);
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$NotesRecord extends NotesRecord {
  @override
  final String? title;
  @override
  final String? description;
  @override
  final bool? isCheckbox;
  @override
  final String? image;
  @override
  final DocumentReference<Object?>? createdBy;
  @override
  final DateTime? createdAt;
  @override
  final BuiltList<DocumentReference<Object?>>? photoNotes;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$NotesRecord([void Function(NotesRecordBuilder)? updates]) =>
      (new NotesRecordBuilder()..update(updates))._build();

  _$NotesRecord._(
      {this.title,
      this.description,
      this.isCheckbox,
      this.image,
      this.createdBy,
      this.createdAt,
      this.photoNotes,
      this.ffRef})
      : super._();

  @override
  NotesRecord rebuild(void Function(NotesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  NotesRecordBuilder toBuilder() => new NotesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is NotesRecord &&
        title == other.title &&
        description == other.description &&
        isCheckbox == other.isCheckbox &&
        image == other.image &&
        createdBy == other.createdBy &&
        createdAt == other.createdAt &&
        photoNotes == other.photoNotes &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc($jc($jc(0, title.hashCode), description.hashCode),
                            isCheckbox.hashCode),
                        image.hashCode),
                    createdBy.hashCode),
                createdAt.hashCode),
            photoNotes.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'NotesRecord')
          ..add('title', title)
          ..add('description', description)
          ..add('isCheckbox', isCheckbox)
          ..add('image', image)
          ..add('createdBy', createdBy)
          ..add('createdAt', createdAt)
          ..add('photoNotes', photoNotes)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class NotesRecordBuilder implements Builder<NotesRecord, NotesRecordBuilder> {
  _$NotesRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  bool? _isCheckbox;
  bool? get isCheckbox => _$this._isCheckbox;
  set isCheckbox(bool? isCheckbox) => _$this._isCheckbox = isCheckbox;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  DocumentReference<Object?>? _createdBy;
  DocumentReference<Object?>? get createdBy => _$this._createdBy;
  set createdBy(DocumentReference<Object?>? createdBy) =>
      _$this._createdBy = createdBy;

  DateTime? _createdAt;
  DateTime? get createdAt => _$this._createdAt;
  set createdAt(DateTime? createdAt) => _$this._createdAt = createdAt;

  ListBuilder<DocumentReference<Object?>>? _photoNotes;
  ListBuilder<DocumentReference<Object?>> get photoNotes =>
      _$this._photoNotes ??= new ListBuilder<DocumentReference<Object?>>();
  set photoNotes(ListBuilder<DocumentReference<Object?>>? photoNotes) =>
      _$this._photoNotes = photoNotes;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  NotesRecordBuilder() {
    NotesRecord._initializeBuilder(this);
  }

  NotesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _isCheckbox = $v.isCheckbox;
      _image = $v.image;
      _createdBy = $v.createdBy;
      _createdAt = $v.createdAt;
      _photoNotes = $v.photoNotes?.toBuilder();
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(NotesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$NotesRecord;
  }

  @override
  void update(void Function(NotesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  NotesRecord build() => _build();

  _$NotesRecord _build() {
    _$NotesRecord _$result;
    try {
      _$result = _$v ??
          new _$NotesRecord._(
              title: title,
              description: description,
              isCheckbox: isCheckbox,
              image: image,
              createdBy: createdBy,
              createdAt: createdAt,
              photoNotes: _photoNotes?.build(),
              ffRef: ffRef);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'photoNotes';
        _photoNotes?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'NotesRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
