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

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

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

  // "license_number" field.
  String? _licenseNumber;
  String get licenseNumber => _licenseNumber ?? '';
  bool hasLicenseNumber() => _licenseNumber != null;

  // "vehicle_registration" field.
  String? _vehicleRegistration;
  String get vehicleRegistration => _vehicleRegistration ?? '';
  bool hasVehicleRegistration() => _vehicleRegistration != null;

  // "date_of_birth" field.
  DateTime? _dateOfBirth;
  DateTime? get dateOfBirth => _dateOfBirth;
  bool hasDateOfBirth() => _dateOfBirth != null;

  void _initializeFields() {
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _nin = snapshotData['nin'] as String?;
    _vehicleModel = snapshotData['vehicle_model'] as String?;
    _vehicleType = snapshotData['vehicle_type'] as String?;
    _vehicleImage = snapshotData['vehicle_image'] as String?;
    _drivingLicense = snapshotData['driving_license'] as String?;
    _licenseNumber = snapshotData['license_number'] as String?;
    _vehicleRegistration = snapshotData['vehicle_registration'] as String?;
    _dateOfBirth = snapshotData['date_of_birth'] as DateTime?;
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
  String? uid,
  DateTime? createdTime,
  DateTime? editedTime,
  String? nin,
  String? vehicleModel,
  String? vehicleType,
  String? vehicleImage,
  String? drivingLicense,
  String? licenseNumber,
  String? vehicleRegistration,
  DateTime? dateOfBirth,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid': uid,
      'created_time': createdTime,
      'edited_time': editedTime,
      'nin': nin,
      'vehicle_model': vehicleModel,
      'vehicle_type': vehicleType,
      'vehicle_image': vehicleImage,
      'driving_license': drivingLicense,
      'license_number': licenseNumber,
      'vehicle_registration': vehicleRegistration,
      'date_of_birth': dateOfBirth,
    }.withoutNulls,
  );

  return firestoreData;
}

class DriversRecordDocumentEquality implements Equality<DriversRecord> {
  const DriversRecordDocumentEquality();

  @override
  bool equals(DriversRecord? e1, DriversRecord? e2) {
    return e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.editedTime == e2?.editedTime &&
        e1?.nin == e2?.nin &&
        e1?.vehicleModel == e2?.vehicleModel &&
        e1?.vehicleType == e2?.vehicleType &&
        e1?.vehicleImage == e2?.vehicleImage &&
        e1?.drivingLicense == e2?.drivingLicense &&
        e1?.licenseNumber == e2?.licenseNumber &&
        e1?.vehicleRegistration == e2?.vehicleRegistration &&
        e1?.dateOfBirth == e2?.dateOfBirth;
  }

  @override
  int hash(DriversRecord? e) => const ListEquality().hash([
        e?.uid,
        e?.createdTime,
        e?.editedTime,
        e?.nin,
        e?.vehicleModel,
        e?.vehicleType,
        e?.vehicleImage,
        e?.drivingLicense,
        e?.licenseNumber,
        e?.vehicleRegistration,
        e?.dateOfBirth
      ]);

  @override
  bool isValidKey(Object? o) => o is DriversRecord;
}
