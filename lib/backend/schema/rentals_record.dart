import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RentalsRecord extends FirestoreRecord {
  RentalsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "rental_id" field.
  String? _rentalId;
  String get rentalId => _rentalId ?? '';
  bool hasRentalId() => _rentalId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "status" field.
  List<String>? _status;
  List<String> get status => _status ?? const [];
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "pickup_location_address" field.
  String? _pickupLocationAddress;
  String get pickupLocationAddress => _pickupLocationAddress ?? '';
  bool hasPickupLocationAddress() => _pickupLocationAddress != null;

  // "pickoff_location_address" field.
  String? _pickoffLocationAddress;
  String get pickoffLocationAddress => _pickoffLocationAddress ?? '';
  bool hasPickoffLocationAddress() => _pickoffLocationAddress != null;

  // "same_as_pickup" field.
  List<bool>? _sameAsPickup;
  List<bool> get sameAsPickup => _sameAsPickup ?? const [];
  bool hasSameAsPickup() => _sameAsPickup != null;

  // "pickup_datetime" field.
  DateTime? _pickupDatetime;
  DateTime? get pickupDatetime => _pickupDatetime;
  bool hasPickupDatetime() => _pickupDatetime != null;

  // "return_datetime" field.
  DateTime? _returnDatetime;
  DateTime? get returnDatetime => _returnDatetime;
  bool hasReturnDatetime() => _returnDatetime != null;

  // "rental_duration_hours" field.
  double? _rentalDurationHours;
  double get rentalDurationHours => _rentalDurationHours ?? 0.0;
  bool hasRentalDurationHours() => _rentalDurationHours != null;

  // "driver_age_range" field.
  List<String>? _driverAgeRange;
  List<String> get driverAgeRange => _driverAgeRange ?? const [];
  bool hasDriverAgeRange() => _driverAgeRange != null;

  // "final_rental_price" field.
  List<double>? _finalRentalPrice;
  List<double> get finalRentalPrice => _finalRentalPrice ?? const [];
  bool hasFinalRentalPrice() => _finalRentalPrice != null;

  void _initializeFields() {
    _rentalId = snapshotData['rental_id'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _status = getDataList(snapshotData['status']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _pickupLocationAddress = snapshotData['pickup_location_address'] as String?;
    _pickoffLocationAddress =
        snapshotData['pickoff_location_address'] as String?;
    _sameAsPickup = getDataList(snapshotData['same_as_pickup']);
    _pickupDatetime = snapshotData['pickup_datetime'] as DateTime?;
    _returnDatetime = snapshotData['return_datetime'] as DateTime?;
    _rentalDurationHours =
        castToType<double>(snapshotData['rental_duration_hours']);
    _driverAgeRange = getDataList(snapshotData['driver_age_range']);
    _finalRentalPrice = getDataList(snapshotData['final_rental_price']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('rentals');

  static Stream<RentalsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RentalsRecord.fromSnapshot(s));

  static Future<RentalsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RentalsRecord.fromSnapshot(s));

  static RentalsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RentalsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RentalsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RentalsRecord._(reference, mapFromFirestore(data));

  static RentalsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RentalsRecord.getDocumentFromData(
        {
          'rental_id': snapshot.data['rental_id'],
          'user_id': convertAlgoliaParam(
            snapshot.data['user_id'],
            ParamType.DocumentReference,
            false,
          ),
          'status': safeGet(
            () => snapshot.data['status'].toList(),
          ),
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'pickup_location_address': snapshot.data['pickup_location_address'],
          'pickoff_location_address': snapshot.data['pickoff_location_address'],
          'same_as_pickup': safeGet(
            () => snapshot.data['same_as_pickup'].toList(),
          ),
          'pickup_datetime': convertAlgoliaParam(
            snapshot.data['pickup_datetime'],
            ParamType.DateTime,
            false,
          ),
          'return_datetime': convertAlgoliaParam(
            snapshot.data['return_datetime'],
            ParamType.DateTime,
            false,
          ),
          'rental_duration_hours': convertAlgoliaParam(
            snapshot.data['rental_duration_hours'],
            ParamType.double,
            false,
          ),
          'driver_age_range': safeGet(
            () => snapshot.data['driver_age_range'].toList(),
          ),
          'final_rental_price': safeGet(
            () => convertAlgoliaParam<double>(
              snapshot.data['final_rental_price'],
              ParamType.double,
              true,
            ).toList(),
          ),
        },
        RentalsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RentalsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'rentals',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'RentalsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RentalsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRentalsRecordData({
  String? rentalId,
  DocumentReference? userId,
  DateTime? createdAt,
  String? pickupLocationAddress,
  String? pickoffLocationAddress,
  DateTime? pickupDatetime,
  DateTime? returnDatetime,
  double? rentalDurationHours,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'rental_id': rentalId,
      'user_id': userId,
      'created_at': createdAt,
      'pickup_location_address': pickupLocationAddress,
      'pickoff_location_address': pickoffLocationAddress,
      'pickup_datetime': pickupDatetime,
      'return_datetime': returnDatetime,
      'rental_duration_hours': rentalDurationHours,
    }.withoutNulls,
  );

  return firestoreData;
}

class RentalsRecordDocumentEquality implements Equality<RentalsRecord> {
  const RentalsRecordDocumentEquality();

  @override
  bool equals(RentalsRecord? e1, RentalsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.rentalId == e2?.rentalId &&
        e1?.userId == e2?.userId &&
        listEquality.equals(e1?.status, e2?.status) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.pickupLocationAddress == e2?.pickupLocationAddress &&
        e1?.pickoffLocationAddress == e2?.pickoffLocationAddress &&
        listEquality.equals(e1?.sameAsPickup, e2?.sameAsPickup) &&
        e1?.pickupDatetime == e2?.pickupDatetime &&
        e1?.returnDatetime == e2?.returnDatetime &&
        e1?.rentalDurationHours == e2?.rentalDurationHours &&
        listEquality.equals(e1?.driverAgeRange, e2?.driverAgeRange) &&
        listEquality.equals(e1?.finalRentalPrice, e2?.finalRentalPrice);
  }

  @override
  int hash(RentalsRecord? e) => const ListEquality().hash([
        e?.rentalId,
        e?.userId,
        e?.status,
        e?.createdAt,
        e?.pickupLocationAddress,
        e?.pickoffLocationAddress,
        e?.sameAsPickup,
        e?.pickupDatetime,
        e?.returnDatetime,
        e?.rentalDurationHours,
        e?.driverAgeRange,
        e?.finalRentalPrice
      ]);

  @override
  bool isValidKey(Object? o) => o is RentalsRecord;
}
