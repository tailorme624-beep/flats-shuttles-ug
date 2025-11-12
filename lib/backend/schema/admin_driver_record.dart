import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AdminDriverRecord extends FirestoreRecord {
  AdminDriverRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "fullname" field.
  DocumentReference? _fullname;
  DocumentReference? get fullname => _fullname;
  bool hasFullname() => _fullname != null;

  // "phone_number" field.
  DocumentReference? _phoneNumber;
  DocumentReference? get phoneNumber => _phoneNumber;
  bool hasPhoneNumber() => _phoneNumber != null;

  // "email" field.
  DocumentReference? _email;
  DocumentReference? get email => _email;
  bool hasEmail() => _email != null;

  // "license_number" field.
  String? _licenseNumber;
  String get licenseNumber => _licenseNumber ?? '';
  bool hasLicenseNumber() => _licenseNumber != null;

  // "vehicle_number" field.
  String? _vehicleNumber;
  String get vehicleNumber => _vehicleNumber ?? '';
  bool hasVehicleNumber() => _vehicleNumber != null;

  // "is_active" field.
  List<bool>? _isActive;
  List<bool> get isActive => _isActive ?? const [];
  bool hasIsActive() => _isActive != null;

  // "date_joined" field.
  DateTime? _dateJoined;
  DateTime? get dateJoined => _dateJoined;
  bool hasDateJoined() => _dateJoined != null;

  // "addedByAdmin" field.
  DocumentReference? _addedByAdmin;
  DocumentReference? get addedByAdmin => _addedByAdmin;
  bool hasAddedByAdmin() => _addedByAdmin != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _fullname = snapshotData['fullname'] as DocumentReference?;
    _phoneNumber = snapshotData['phone_number'] as DocumentReference?;
    _email = snapshotData['email'] as DocumentReference?;
    _licenseNumber = snapshotData['license_number'] as String?;
    _vehicleNumber = snapshotData['vehicle_number'] as String?;
    _isActive = getDataList(snapshotData['is_active']);
    _dateJoined = snapshotData['date_joined'] as DateTime?;
    _addedByAdmin = snapshotData['addedByAdmin'] as DocumentReference?;
    _password = snapshotData['password'] as String?;
    _uid = snapshotData['uid'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('admin_driver')
          : FirebaseFirestore.instanceFor(
                  app: Firebase.app(), databaseId: 'flatsshuttles-gr3bc7')
              .collectionGroup('admin_driver');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('admin_driver').doc(id);

  static Stream<AdminDriverRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AdminDriverRecord.fromSnapshot(s));

  static Future<AdminDriverRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AdminDriverRecord.fromSnapshot(s));

  static AdminDriverRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AdminDriverRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AdminDriverRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AdminDriverRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AdminDriverRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AdminDriverRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAdminDriverRecordData({
  DocumentReference? fullname,
  DocumentReference? phoneNumber,
  DocumentReference? email,
  String? licenseNumber,
  String? vehicleNumber,
  DateTime? dateJoined,
  DocumentReference? addedByAdmin,
  String? password,
  String? uid,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'fullname': fullname,
      'phone_number': phoneNumber,
      'email': email,
      'license_number': licenseNumber,
      'vehicle_number': vehicleNumber,
      'date_joined': dateJoined,
      'addedByAdmin': addedByAdmin,
      'password': password,
      'uid': uid,
    }.withoutNulls,
  );

  return firestoreData;
}

class AdminDriverRecordDocumentEquality implements Equality<AdminDriverRecord> {
  const AdminDriverRecordDocumentEquality();

  @override
  bool equals(AdminDriverRecord? e1, AdminDriverRecord? e2) {
    const listEquality = ListEquality();
    return e1?.fullname == e2?.fullname &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.email == e2?.email &&
        e1?.licenseNumber == e2?.licenseNumber &&
        e1?.vehicleNumber == e2?.vehicleNumber &&
        listEquality.equals(e1?.isActive, e2?.isActive) &&
        e1?.dateJoined == e2?.dateJoined &&
        e1?.addedByAdmin == e2?.addedByAdmin &&
        e1?.password == e2?.password &&
        e1?.uid == e2?.uid;
  }

  @override
  int hash(AdminDriverRecord? e) => const ListEquality().hash([
        e?.fullname,
        e?.phoneNumber,
        e?.email,
        e?.licenseNumber,
        e?.vehicleNumber,
        e?.isActive,
        e?.dateJoined,
        e?.addedByAdmin,
        e?.password,
        e?.uid
      ]);

  @override
  bool isValidKey(Object? o) => o is AdminDriverRecord;
}
