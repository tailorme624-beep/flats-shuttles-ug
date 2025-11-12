import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminRecord extends FirestoreRecord {
  AdminRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "password_hash" field.
  String? _passwordHash;
  String get passwordHash => _passwordHash ?? '';
  bool hasPasswordHash() => _passwordHash != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _role = snapshotData['role'] as String?;
    _email = snapshotData['email'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _isActive = snapshotData['is_active'] as bool?;
    _displayName = snapshotData['display_name'] as String?;
    _passwordHash = snapshotData['password_hash'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('Admin')
          : FirebaseFirestore.instanceFor(
                  app: Firebase.app(), databaseId: 'flatsshuttles-gr3bc7')
              .collectionGroup('Admin');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('Admin').doc(id);

  static Stream<AdminRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminRecord.fromSnapshot(s));

  static Future<AdminRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminRecord.fromSnapshot(s));

  static AdminRecord fromSnapshot(DocumentSnapshot snapshot) => AdminRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminRecordData({
  String? role,
  String? email,
  DateTime? createdAt,
  bool? isActive,
  String? displayName,
  String? passwordHash,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'role': role,
      'email': email,
      'created_at': createdAt,
      'is_active': isActive,
      'display_name': displayName,
      'password_hash': passwordHash,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminRecordDocumentEquality implements Equality<AdminRecord> {
  const AdminRecordDocumentEquality();

  @override
  bool equals(AdminRecord? e1, AdminRecord? e2) {
    return e1?.role == e2?.role &&
        e1?.email == e2?.email &&
        e1?.createdAt == e2?.createdAt &&
        e1?.isActive == e2?.isActive &&
        e1?.displayName == e2?.displayName &&
        e1?.passwordHash == e2?.passwordHash &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(AdminRecord? e) => const ListEquality().hash([
        e?.role,
        e?.email,
        e?.createdAt,
        e?.isActive,
        e?.displayName,
        e?.passwordHash,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is AdminRecord;
}
