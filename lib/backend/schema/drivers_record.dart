import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// this is to collect data from the drivers
class DriversRecord extends FirestoreRecord {
  DriversRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "nin" field.
  String? _nin;
  String get nin => _nin ?? '';
  bool hasNin() => _nin != null;

  // "vehicle_model" field.
  String? _vehicleModel;
  String get vehicleModel => _vehicleModel ?? '';
  bool hasVehicleModel() => _vehicleModel != null;

  // "license_plate" field.
  String? _licensePlate;
  String get licensePlate => _licensePlate ?? '';
  bool hasLicensePlate() => _licensePlate != null;

  // "vehicle_type" field.
  String? _vehicleType;
  String get vehicleType => _vehicleType ?? '';
  bool hasVehicleType() => _vehicleType != null;

  // "vehicle_image" field.
  String? _vehicleImage;
  String get vehicleImage => _vehicleImage ?? '';
  bool hasVehicleImage() => _vehicleImage != null;

  // "driving_license" field.
  String? _drivingLicense;
  String get drivingLicense => _drivingLicense ?? '';
  bool hasDrivingLicense() => _drivingLicense != null;

  // "profile_photo" field.
  String? _profilePhoto;
  String get profilePhoto => _profilePhoto ?? '';
  bool hasProfilePhoto() => _profilePhoto != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  bool hasPassword() => _password != null;

  // "comfirm_password" field.
  String? _comfirmPassword;
  String get comfirmPassword => _comfirmPassword ?? '';
  bool hasComfirmPassword() => _comfirmPassword != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  bool hasRole() => _role != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _nin = snapshotData['nin'] as String?;
    _vehicleModel = snapshotData['vehicle_model'] as String?;
    _licensePlate = snapshotData['license_plate'] as String?;
    _vehicleType = snapshotData['vehicle_type'] as String?;
    _vehicleImage = snapshotData['vehicle_image'] as String?;
    _drivingLicense = snapshotData['driving_license'] as String?;
    _profilePhoto = snapshotData['profile_photo'] as String?;
    _password = snapshotData['password'] as String?;
    _comfirmPassword = snapshotData['comfirm_password'] as String?;
    _role = snapshotData['role'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('drivers');

  static Stream<DriversRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DriversRecord.fromSnapshot(s));

  static Future<DriversRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DriversRecord.fromSnapshot(s));

  static DriversRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DriversRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DriversRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DriversRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DriversRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DriversRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDriversRecordData({
  String? email,
  String? displayName,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? editedTime,
  String? nin,
  String? vehicleModel,
  String? licensePlate,
  String? vehicleType,
  String? vehicleImage,
  String? drivingLicense,
  String? profilePhoto,
  String? password,
  String? comfirmPassword,
  String? role,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'edited_time': editedTime,
      'nin': nin,
      'vehicle_model': vehicleModel,
      'license_plate': licensePlate,
      'vehicle_type': vehicleType,
      'vehicle_image': vehicleImage,
      'driving_license': drivingLicense,
      'profile_photo': profilePhoto,
      'password': password,
      'comfirm_password': comfirmPassword,
      'role': role,
    }.withoutNulls,
  );

  return firestoreData;
}

class DriversRecordDocumentEquality implements Equality<DriversRecord> {
  const DriversRecordDocumentEquality();

  @override
  bool equals(DriversRecord? e1, DriversRecord? e2) {
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.editedTime == e2?.editedTime &&
        e1?.nin == e2?.nin &&
        e1?.vehicleModel == e2?.vehicleModel &&
        e1?.licensePlate == e2?.licensePlate &&
        e1?.vehicleType == e2?.vehicleType &&
        e1?.vehicleImage == e2?.vehicleImage &&
        e1?.drivingLicense == e2?.drivingLicense &&
        e1?.profilePhoto == e2?.profilePhoto &&
        e1?.password == e2?.password &&
        e1?.comfirmPassword == e2?.comfirmPassword &&
        e1?.role == e2?.role;
  }

  @override
  int hash(DriversRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.editedTime,
        e?.nin,
        e?.vehicleModel,
        e?.licensePlate,
        e?.vehicleType,
        e?.vehicleImage,
        e?.drivingLicense,
        e?.profilePhoto,
        e?.password,
        e?.comfirmPassword,
        e?.role
      ]);

  @override
  bool isValidKey(Object? o) => o is DriversRecord;
}
