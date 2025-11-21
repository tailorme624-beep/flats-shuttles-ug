import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourrierrequestsRecord extends FirestoreRecord {
  CourrierrequestsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "request_id" field.
  String? _requestId;
  String get requestId => _requestId ?? '';
  bool hasRequestId() => _requestId != null;

  // "client_id" field.
  DocumentReference? _clientId;
  DocumentReference? get clientId => _clientId;
  bool hasClientId() => _clientId != null;

  // "driver_id" field.
  DocumentReference? _driverId;
  DocumentReference? get driverId => _driverId;
  bool hasDriverId() => _driverId != null;

  // "status" field.
  List<String>? _status;
  List<String> get status => _status ?? const [];
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "pickup_address" field.
  String? _pickupAddress;
  String get pickupAddress => _pickupAddress ?? '';
  bool hasPickupAddress() => _pickupAddress != null;

  // "dropoff_address" field.
  String? _dropoffAddress;
  String get dropoffAddress => _dropoffAddress ?? '';
  bool hasDropoffAddress() => _dropoffAddress != null;

  // "pickup_location" field.
  LatLng? _pickupLocation;
  LatLng? get pickupLocation => _pickupLocation;
  bool hasPickupLocation() => _pickupLocation != null;

  // "dropoff_location" field.
  LatLng? _dropoffLocation;
  LatLng? get dropoffLocation => _dropoffLocation;
  bool hasDropoffLocation() => _dropoffLocation != null;

  // "package_weght_kg" field.
  double? _packageWeghtKg;
  double get packageWeghtKg => _packageWeghtKg ?? 0.0;
  bool hasPackageWeghtKg() => _packageWeghtKg != null;

  // "package_length_cm" field.
  double? _packageLengthCm;
  double get packageLengthCm => _packageLengthCm ?? 0.0;
  bool hasPackageLengthCm() => _packageLengthCm != null;

  // "package_width_cm" field.
  double? _packageWidthCm;
  double get packageWidthCm => _packageWidthCm ?? 0.0;
  bool hasPackageWidthCm() => _packageWidthCm != null;

  // "package_height_cm" field.
  double? _packageHeightCm;
  double get packageHeightCm => _packageHeightCm ?? 0.0;
  bool hasPackageHeightCm() => _packageHeightCm != null;

  // "package_type" field.
  List<String>? _packageType;
  List<String> get packageType => _packageType ?? const [];
  bool hasPackageType() => _packageType != null;

  // "recipient_name" field.
  String? _recipientName;
  String get recipientName => _recipientName ?? '';
  bool hasRecipientName() => _recipientName != null;

  // "recipient_phone" field.
  String? _recipientPhone;
  String get recipientPhone => _recipientPhone ?? '';
  bool hasRecipientPhone() => _recipientPhone != null;

  // "delivery_speed" field.
  List<String>? _deliverySpeed;
  List<String> get deliverySpeed => _deliverySpeed ?? const [];
  bool hasDeliverySpeed() => _deliverySpeed != null;

  // "estimated_price" field.
  double? _estimatedPrice;
  double get estimatedPrice => _estimatedPrice ?? 0.0;
  bool hasEstimatedPrice() => _estimatedPrice != null;

  // "payment_method" field.
  List<String>? _paymentMethod;
  List<String> get paymentMethod => _paymentMethod ?? const [];
  bool hasPaymentMethod() => _paymentMethod != null;

  // "payment_status" field.
  List<String>? _paymentStatus;
  List<String> get paymentStatus => _paymentStatus ?? const [];
  bool hasPaymentStatus() => _paymentStatus != null;

  void _initializeFields() {
    _requestId = snapshotData['request_id'] as String?;
    _clientId = snapshotData['client_id'] as DocumentReference?;
    _driverId = snapshotData['driver_id'] as DocumentReference?;
    _status = getDataList(snapshotData['status']);
    _createdAt = snapshotData['created_at'] as DateTime?;
    _pickupAddress = snapshotData['pickup_address'] as String?;
    _dropoffAddress = snapshotData['dropoff_address'] as String?;
    _pickupLocation = snapshotData['pickup_location'] as LatLng?;
    _dropoffLocation = snapshotData['dropoff_location'] as LatLng?;
    _packageWeghtKg = castToType<double>(snapshotData['package_weght_kg']);
    _packageLengthCm = castToType<double>(snapshotData['package_length_cm']);
    _packageWidthCm = castToType<double>(snapshotData['package_width_cm']);
    _packageHeightCm = castToType<double>(snapshotData['package_height_cm']);
    _packageType = getDataList(snapshotData['package_type']);
    _recipientName = snapshotData['recipient_name'] as String?;
    _recipientPhone = snapshotData['recipient_phone'] as String?;
    _deliverySpeed = getDataList(snapshotData['delivery_speed']);
    _estimatedPrice = castToType<double>(snapshotData['estimated_price']);
    _paymentMethod = getDataList(snapshotData['payment_method']);
    _paymentStatus = getDataList(snapshotData['payment_status']);
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'flatsshuttles-gr3bc7')
      .collection('courrierrequests');

  static Stream<CourrierrequestsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CourrierrequestsRecord.fromSnapshot(s));

  static Future<CourrierrequestsRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CourrierrequestsRecord.fromSnapshot(s));

  static CourrierrequestsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CourrierrequestsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CourrierrequestsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CourrierrequestsRecord._(reference, mapFromFirestore(data));

  static CourrierrequestsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CourrierrequestsRecord.getDocumentFromData(
        {
          'request_id': snapshot.data['request_id'],
          'client_id': convertAlgoliaParam(
            snapshot.data['client_id'],
            ParamType.DocumentReference,
            false,
          ),
          'driver_id': convertAlgoliaParam(
            snapshot.data['driver_id'],
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
          'pickup_address': snapshot.data['pickup_address'],
          'dropoff_address': snapshot.data['dropoff_address'],
          'pickup_location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'dropoff_location': convertAlgoliaParam(
            snapshot.data,
            ParamType.LatLng,
            false,
          ),
          'package_weght_kg': convertAlgoliaParam(
            snapshot.data['package_weght_kg'],
            ParamType.double,
            false,
          ),
          'package_length_cm': convertAlgoliaParam(
            snapshot.data['package_length_cm'],
            ParamType.double,
            false,
          ),
          'package_width_cm': convertAlgoliaParam(
            snapshot.data['package_width_cm'],
            ParamType.double,
            false,
          ),
          'package_height_cm': convertAlgoliaParam(
            snapshot.data['package_height_cm'],
            ParamType.double,
            false,
          ),
          'package_type': safeGet(
            () => snapshot.data['package_type'].toList(),
          ),
          'recipient_name': snapshot.data['recipient_name'],
          'recipient_phone': snapshot.data['recipient_phone'],
          'delivery_speed': safeGet(
            () => snapshot.data['delivery_speed'].toList(),
          ),
          'estimated_price': convertAlgoliaParam(
            snapshot.data['estimated_price'],
            ParamType.double,
            false,
          ),
          'payment_method': safeGet(
            () => snapshot.data['payment_method'].toList(),
          ),
          'payment_status': safeGet(
            () => snapshot.data['payment_status'].toList(),
          ),
        },
        CourrierrequestsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CourrierrequestsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'courrierrequests',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CourrierrequestsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CourrierrequestsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCourrierrequestsRecordData({
  String? requestId,
  DocumentReference? clientId,
  DocumentReference? driverId,
  DateTime? createdAt,
  String? pickupAddress,
  String? dropoffAddress,
  LatLng? pickupLocation,
  LatLng? dropoffLocation,
  double? packageWeghtKg,
  double? packageLengthCm,
  double? packageWidthCm,
  double? packageHeightCm,
  String? recipientName,
  String? recipientPhone,
  double? estimatedPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'request_id': requestId,
      'client_id': clientId,
      'driver_id': driverId,
      'created_at': createdAt,
      'pickup_address': pickupAddress,
      'dropoff_address': dropoffAddress,
      'pickup_location': pickupLocation,
      'dropoff_location': dropoffLocation,
      'package_weght_kg': packageWeghtKg,
      'package_length_cm': packageLengthCm,
      'package_width_cm': packageWidthCm,
      'package_height_cm': packageHeightCm,
      'recipient_name': recipientName,
      'recipient_phone': recipientPhone,
      'estimated_price': estimatedPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class CourrierrequestsRecordDocumentEquality
    implements Equality<CourrierrequestsRecord> {
  const CourrierrequestsRecordDocumentEquality();

  @override
  bool equals(CourrierrequestsRecord? e1, CourrierrequestsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.requestId == e2?.requestId &&
        e1?.clientId == e2?.clientId &&
        e1?.driverId == e2?.driverId &&
        listEquality.equals(e1?.status, e2?.status) &&
        e1?.createdAt == e2?.createdAt &&
        e1?.pickupAddress == e2?.pickupAddress &&
        e1?.dropoffAddress == e2?.dropoffAddress &&
        e1?.pickupLocation == e2?.pickupLocation &&
        e1?.dropoffLocation == e2?.dropoffLocation &&
        e1?.packageWeghtKg == e2?.packageWeghtKg &&
        e1?.packageLengthCm == e2?.packageLengthCm &&
        e1?.packageWidthCm == e2?.packageWidthCm &&
        e1?.packageHeightCm == e2?.packageHeightCm &&
        listEquality.equals(e1?.packageType, e2?.packageType) &&
        e1?.recipientName == e2?.recipientName &&
        e1?.recipientPhone == e2?.recipientPhone &&
        listEquality.equals(e1?.deliverySpeed, e2?.deliverySpeed) &&
        e1?.estimatedPrice == e2?.estimatedPrice &&
        listEquality.equals(e1?.paymentMethod, e2?.paymentMethod) &&
        listEquality.equals(e1?.paymentStatus, e2?.paymentStatus);
  }

  @override
  int hash(CourrierrequestsRecord? e) => const ListEquality().hash([
        e?.requestId,
        e?.clientId,
        e?.driverId,
        e?.status,
        e?.createdAt,
        e?.pickupAddress,
        e?.dropoffAddress,
        e?.pickupLocation,
        e?.dropoffLocation,
        e?.packageWeghtKg,
        e?.packageLengthCm,
        e?.packageWidthCm,
        e?.packageHeightCm,
        e?.packageType,
        e?.recipientName,
        e?.recipientPhone,
        e?.deliverySpeed,
        e?.estimatedPrice,
        e?.paymentMethod,
        e?.paymentStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is CourrierrequestsRecord;
}
