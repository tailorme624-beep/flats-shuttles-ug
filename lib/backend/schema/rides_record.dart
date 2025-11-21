import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// this will collect users ride requests
class RidesRecord extends FirestoreRecord {
  RidesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "ride_id" field.
  String? _rideId;
  String get rideId => _rideId ?? '';
  bool hasRideId() => _rideId != null;

  // "client_id" field.
  DocumentReference? _clientId;
  DocumentReference? get clientId => _clientId;
  bool hasClientId() => _clientId != null;

  // "status" field.
  List<String>? _status;
  List<String> get status => _status ?? const [];
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "updated_at" field.
  DateTime? _updatedAt;
  DateTime? get updatedAt => _updatedAt;
  bool hasUpdatedAt() => _updatedAt != null;

  // "pickup_location" field.
  LatLng? _pickupLocation;
  LatLng? get pickupLocation => _pickupLocation;
  bool hasPickupLocation() => _pickupLocation != null;

  // "dropoff_address" field.
  String? _dropoffAddress;
  String get dropoffAddress => _dropoffAddress ?? '';
  bool hasDropoffAddress() => _dropoffAddress != null;

  // "estimated_fare" field.
  double? _estimatedFare;
  double get estimatedFare => _estimatedFare ?? 0.0;
  bool hasEstimatedFare() => _estimatedFare != null;

  // "final_fare" field.
  double? _finalFare;
  double get finalFare => _finalFare ?? 0.0;
  bool hasFinalFare() => _finalFare != null;

  // "distance_km" field.
  double? _distanceKm;
  double get distanceKm => _distanceKm ?? 0.0;
  bool hasDistanceKm() => _distanceKm != null;

  // "duration_seconds" field.
  int? _durationSeconds;
  int get durationSeconds => _durationSeconds ?? 0;
  bool hasDurationSeconds() => _durationSeconds != null;

  // "driver_eta_seconds" field.
  int? _driverEtaSeconds;
  int get driverEtaSeconds => _driverEtaSeconds ?? 0;
  bool hasDriverEtaSeconds() => _driverEtaSeconds != null;

  // "payment_method" field.
  List<String>? _paymentMethod;
  List<String> get paymentMethod => _paymentMethod ?? const [];
  bool hasPaymentMethod() => _paymentMethod != null;

  // "payment_status" field.
  List<String>? _paymentStatus;
  List<String> get paymentStatus => _paymentStatus ?? const [];
  bool hasPaymentStatus() => _paymentStatus != null;

  // "vehicle_type" field.
  String? _vehicleType;
  String get vehicleType => _vehicleType ?? '';
  bool hasVehicleType() => _vehicleType != null;

  // "driver_id" field.
  DocumentReference? _driverId;
  DocumentReference? get driverId => _driverId;
  bool hasDriverId() => _driverId != null;

  void _initializeFields() {
    _rideId = snapshotData['ride_id'] as String?;
    _clientId = snapshotData['client_id'] as DocumentReference?;
    _status = getDataList(snapshotData['status']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _updatedAt = snapshotData['updated_at'] as DateTime?;
    _pickupLocation = snapshotData['pickup_location'] as LatLng?;
    _dropoffAddress = snapshotData['dropoff_address'] as String?;
    _estimatedFare = castToType<double>(snapshotData['estimated_fare']);
    _finalFare = castToType<double>(snapshotData['final_fare']);
    _distanceKm = castToType<double>(snapshotData['distance_km']);
    _durationSeconds = castToType<int>(snapshotData['duration_seconds']);
    _driverEtaSeconds = castToType<int>(snapshotData['driver_eta_seconds']);
    _paymentMethod = getDataList(snapshotData['payment_method']);
    _paymentStatus = getDataList(snapshotData['payment_status']);
    _vehicleType = snapshotData['vehicle_type'] as String?;
    _driverId = snapshotData['driver_id'] as DocumentReference?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'flatsshuttles-gr3bc7')
      .collection('rides');

  static Stream<RidesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RidesRecord.fromSnapshot(s));

  static Future<RidesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RidesRecord.fromSnapshot(s));

  static RidesRecord fromSnapshot(DocumentSnapshot snapshot) => RidesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RidesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RidesRecord._(reference, mapFromFirestore(data));

  static RidesRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      RidesRecord.getDocumentFromData(
        {
          'ride_id': snapshot.data['ride_id'],
          'client_id': convertAlgoliaParam(
            snapshot.data['client_id'],
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
          'updated_at': convertAlgoliaParam(
            snapshot.data['updated_at'],
            ParamType.DateTime,
            false,
          ),
          'pickup_location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'dropoff_address': snapshot.data['dropoff_address'],
          'estimated_fare': convertAlgoliaParam(
            snapshot.data['estimated_fare'],
            ParamType.double,
            false,
          ),
          'final_fare': convertAlgoliaParam(
            snapshot.data['final_fare'],
            ParamType.double,
            false,
          ),
          'distance_km': convertAlgoliaParam(
            snapshot.data['distance_km'],
            ParamType.double,
            false,
          ),
          'duration_seconds': convertAlgoliaParam(
            snapshot.data['duration_seconds'],
            ParamType.int,
            false,
          ),
          'driver_eta_seconds': convertAlgoliaParam(
            snapshot.data['driver_eta_seconds'],
            ParamType.int,
            false,
          ),
          'payment_method': safeGet(
            () => snapshot.data['payment_method'].toList(),
          ),
          'payment_status': safeGet(
            () => snapshot.data['payment_status'].toList(),
          ),
          'vehicle_type': snapshot.data['vehicle_type'],
          'driver_id': convertAlgoliaParam(
            snapshot.data['driver_id'],
            ParamType.DocumentReference,
            false,
          ),
        },
        RidesRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<RidesRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'rides',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'RidesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is RidesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createRidesRecordData({
  String? rideId,
  DocumentReference? clientId,
  DateTime? createdAt,
  DateTime? updatedAt,
  LatLng? pickupLocation,
  String? dropoffAddress,
  double? estimatedFare,
  double? finalFare,
  double? distanceKm,
  int? durationSeconds,
  int? driverEtaSeconds,
  String? vehicleType,
  DocumentReference? driverId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'ride_id': rideId,
      'client_id': clientId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'pickup_location': pickupLocation,
      'dropoff_address': dropoffAddress,
      'estimated_fare': estimatedFare,
      'final_fare': finalFare,
      'distance_km': distanceKm,
      'duration_seconds': durationSeconds,
      'driver_eta_seconds': driverEtaSeconds,
      'vehicle_type': vehicleType,
      'driver_id': driverId,
    }.withoutNulls,
  );

  return firestoreData;
}

class RidesRecordDocumentEquality implements Equality<RidesRecord> {
  const RidesRecordDocumentEquality();

  @override
  bool equals(RidesRecord? e1, RidesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.rideId == e2?.rideId &&
        e1?.clientId == e2?.clientId &&
        listEquality.equals(e1?.status, e2?.status) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.updatedAt == e2?.updatedAt &&
        e1?.pickupLocation == e2?.pickupLocation &&
        e1?.dropoffAddress == e2?.dropoffAddress &&
        e1?.estimatedFare == e2?.estimatedFare &&
        e1?.finalFare == e2?.finalFare &&
        e1?.distanceKm == e2?.distanceKm &&
        e1?.durationSeconds == e2?.durationSeconds &&
        e1?.driverEtaSeconds == e2?.driverEtaSeconds &&
        listEquality.equals(e1?.paymentMethod, e2?.paymentMethod) &&
        listEquality.equals(e1?.paymentStatus, e2?.paymentStatus) &&
        e1?.vehicleType == e2?.vehicleType &&
        e1?.driverId == e2?.driverId;
  }

  @override
  int hash(RidesRecord? e) => const ListEquality().hash([
        e?.rideId,
        e?.clientId,
        e?.status,
        e?.createdAt,
        e?.updatedAt,
        e?.pickupLocation,
        e?.dropoffAddress,
        e?.estimatedFare,
        e?.finalFare,
        e?.distanceKm,
        e?.durationSeconds,
        e?.driverEtaSeconds,
        e?.paymentMethod,
        e?.paymentStatus,
        e?.vehicleType,
        e?.driverId
      ]);

  @override
  bool isValidKey(Object? o) => o is RidesRecord;
}
