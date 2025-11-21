import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CarsRecord extends FirestoreRecord {
  CarsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "car_id" field.
  String? _carId;
  String get carId => _carId ?? '';
  bool hasCarId() => _carId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "photos" field.
  String? _photos;
  String get photos => _photos ?? '';
  bool hasPhotos() => _photos != null;

  // "car_make" field.
  String? _carMake;
  String get carMake => _carMake ?? '';
  bool hasCarMake() => _carMake != null;

  // "car_model" field.
  String? _carModel;
  String get carModel => _carModel ?? '';
  bool hasCarModel() => _carModel != null;

  // "car_year" field.
  int? _carYear;
  int get carYear => _carYear ?? 0;
  bool hasCarYear() => _carYear != null;

  // "car_color" field.
  String? _carColor;
  String get carColor => _carColor ?? '';
  bool hasCarColor() => _carColor != null;

  // "license_plate_number" field.
  String? _licensePlateNumber;
  String get licensePlateNumber => _licensePlateNumber ?? '';
  bool hasLicensePlateNumber() => _licensePlateNumber != null;

  // "transmition" field.
  String? _transmition;
  String get transmition => _transmition ?? '';
  bool hasTransmition() => _transmition != null;

  // "number_of_seats" field.
  int? _numberOfSeats;
  int get numberOfSeats => _numberOfSeats ?? 0;
  bool hasNumberOfSeats() => _numberOfSeats != null;

  // "description_features" field.
  String? _descriptionFeatures;
  String get descriptionFeatures => _descriptionFeatures ?? '';
  bool hasDescriptionFeatures() => _descriptionFeatures != null;

  // "rate_daily" field.
  double? _rateDaily;
  double get rateDaily => _rateDaily ?? 0.0;
  bool hasRateDaily() => _rateDaily != null;

  // "rate_weekly" field.
  double? _rateWeekly;
  double get rateWeekly => _rateWeekly ?? 0.0;
  bool hasRateWeekly() => _rateWeekly != null;

  // "rate_monthly" field.
  double? _rateMonthly;
  double get rateMonthly => _rateMonthly ?? 0.0;
  bool hasRateMonthly() => _rateMonthly != null;

  // "is_available_for_hire" field.
  bool? _isAvailableForHire;
  bool get isAvailableForHire => _isAvailableForHire ?? false;
  bool hasIsAvailableForHire() => _isAvailableForHire != null;

  // "current_location" field.
  LatLng? _currentLocation;
  LatLng? get currentLocation => _currentLocation;
  bool hasCurrentLocation() => _currentLocation != null;

  void _initializeFields() {
    _carId = snapshotData['car_id'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _photos = snapshotData['photos'] as String?;
    _carMake = snapshotData['car_make'] as String?;
    _carModel = snapshotData['car_model'] as String?;
    _carYear = castToType<int>(snapshotData['car_year']);
    _carColor = snapshotData['car_color'] as String?;
    _licensePlateNumber = snapshotData['license_plate_number'] as String?;
    _transmition = snapshotData['transmition'] as String?;
    _numberOfSeats = castToType<int>(snapshotData['number_of_seats']);
    _descriptionFeatures = snapshotData['description_features'] as String?;
    _rateDaily = castToType<double>(snapshotData['rate_daily']);
    _rateWeekly = castToType<double>(snapshotData['rate_weekly']);
    _rateMonthly = castToType<double>(snapshotData['rate_monthly']);
    _isAvailableForHire = snapshotData['is_available_for_hire'] as bool?;
    _currentLocation = snapshotData['current_location'] as LatLng?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'flatsshuttles-gr3bc7')
      .collection('cars');

  static Stream<CarsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CarsRecord.fromSnapshot(s));

  static Future<CarsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CarsRecord.fromSnapshot(s));

  static CarsRecord fromSnapshot(DocumentSnapshot snapshot) => CarsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CarsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CarsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CarsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CarsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCarsRecordData({
  String? carId,
  DateTime? createdAt,
  DateTime? updatedAt,
  String? photos,
  String? carMake,
  String? carModel,
  int? carYear,
  String? carColor,
  String? licensePlateNumber,
  String? transmition,
  int? numberOfSeats,
  String? descriptionFeatures,
  double? rateDaily,
  double? rateWeekly,
  double? rateMonthly,
  bool? isAvailableForHire,
  LatLng? currentLocation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'car_id': carId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'photos': photos,
      'car_make': carMake,
      'car_model': carModel,
      'car_year': carYear,
      'car_color': carColor,
      'license_plate_number': licensePlateNumber,
      'transmition': transmition,
      'number_of_seats': numberOfSeats,
      'description_features': descriptionFeatures,
      'rate_daily': rateDaily,
      'rate_weekly': rateWeekly,
      'rate_monthly': rateMonthly,
      'is_available_for_hire': isAvailableForHire,
      'current_location': currentLocation,
    }.withoutNulls,
  );

  return firestoreData;
}

class CarsRecordDocumentEquality implements Equality<CarsRecord> {
  const CarsRecordDocumentEquality();

  @override
  bool equals(CarsRecord? e1, CarsRecord? e2) {
    return e1?.carId == e2?.carId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.photos == e2?.photos &&
        e1?.carMake == e2?.carMake &&
        e1?.carModel == e2?.carModel &&
        e1?.carYear == e2?.carYear &&
        e1?.carColor == e2?.carColor &&
        e1?.licensePlateNumber == e2?.licensePlateNumber &&
        e1?.transmition == e2?.transmition &&
        e1?.numberOfSeats == e2?.numberOfSeats &&
        e1?.descriptionFeatures == e2?.descriptionFeatures &&
        e1?.rateDaily == e2?.rateDaily &&
        e1?.rateWeekly == e2?.rateWeekly &&
        e1?.rateMonthly == e2?.rateMonthly &&
        e1?.isAvailableForHire == e2?.isAvailableForHire &&
        e1?.currentLocation == e2?.currentLocation;
  }

  @override
  int hash(CarsRecord? e) => const ListEquality().hash([
        e?.carId,
        e?.createdAt,
        e?.updatedAt,
        e?.photos,
        e?.carMake,
        e?.carModel,
        e?.carYear,
        e?.carColor,
        e?.licensePlateNumber,
        e?.transmition,
        e?.numberOfSeats,
        e?.descriptionFeatures,
        e?.rateDaily,
        e?.rateWeekly,
        e?.rateMonthly,
        e?.isAvailableForHire,
        e?.currentLocation
      ]);

  @override
  bool isValidKey(Object? o) => o is CarsRecord;
}
