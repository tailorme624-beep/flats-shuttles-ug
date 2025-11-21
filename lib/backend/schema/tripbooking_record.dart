import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TripbookingRecord extends FirestoreRecord {
  TripbookingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "request_id" field.
  String? _requestId;
  String get requestId => _requestId ?? '';
  bool hasRequestId() => _requestId != null;

  // "requester_user_id" field.
  DocumentReference? _requesterUserId;
  DocumentReference? get requesterUserId => _requesterUserId;
  bool hasRequesterUserId() => _requesterUserId != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "trip_type" field.
  List<String>? _tripType;
  List<String> get tripType => _tripType ?? const [];
  bool hasTripType() => _tripType != null;

  // "organization_name" field.
  String? _organizationName;
  String get organizationName => _organizationName ?? '';
  bool hasOrganizationName() => _organizationName != null;

  // "preferred_location" field.
  String? _preferredLocation;
  String get preferredLocation => _preferredLocation ?? '';
  bool hasPreferredLocation() => _preferredLocation != null;

  // "trip_date_time" field.
  DateTime? _tripDateTime;
  DateTime? get tripDateTime => _tripDateTime;
  bool hasTripDateTime() => _tripDateTime != null;

  // "estimated_participants" field.
  int? _estimatedParticipants;
  int get estimatedParticipants => _estimatedParticipants ?? 0;
  bool hasEstimatedParticipants() => _estimatedParticipants != null;

  // "wheelchair_accessibility" field.
  List<bool>? _wheelchairAccessibility;
  List<bool> get wheelchairAccessibility =>
      _wheelchairAccessibility ?? const [];
  bool hasWheelchairAccessibility() => _wheelchairAccessibility != null;

  // "special_dietary_reqs" field.
  List<bool>? _specialDietaryReqs;
  List<bool> get specialDietaryReqs => _specialDietaryReqs ?? const [];
  bool hasSpecialDietaryReqs() => _specialDietaryReqs != null;

  // "first_aid_needed" field.
  List<String>? _firstAidNeeded;
  List<String> get firstAidNeeded => _firstAidNeeded ?? const [];
  bool hasFirstAidNeeded() => _firstAidNeeded != null;

  // "additional_notes" field.
  String? _additionalNotes;
  String get additionalNotes => _additionalNotes ?? '';
  bool hasAdditionalNotes() => _additionalNotes != null;

  // "quote_price" field.
  double? _quotePrice;
  double get quotePrice => _quotePrice ?? 0.0;
  bool hasQuotePrice() => _quotePrice != null;

  // "is_quote_accepted" field.
  List<bool>? _isQuoteAccepted;
  List<bool> get isQuoteAccepted => _isQuoteAccepted ?? const [];
  bool hasIsQuoteAccepted() => _isQuoteAccepted != null;

  // "payment_status" field.
  List<String>? _paymentStatus;
  List<String> get paymentStatus => _paymentStatus ?? const [];
  bool hasPaymentStatus() => _paymentStatus != null;

  void _initializeFields() {
    _requestId = snapshotData['request_id'] as String?;
    _requesterUserId = snapshotData['requester_user_id'] as DocumentReference?;
    _status = snapshotData['status'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _tripType = getDataList(snapshotData['trip_type']);
    _organizationName = snapshotData['organization_name'] as String?;
    _preferredLocation = snapshotData['preferred_location'] as String?;
    _tripDateTime = snapshotData['trip_date_time'] as DateTime?;
    _estimatedParticipants =
        castToType<int>(snapshotData['estimated_participants']);
    _wheelchairAccessibility =
        getDataList(snapshotData['wheelchair_accessibility']);
    _specialDietaryReqs = getDataList(snapshotData['special_dietary_reqs']);
    _firstAidNeeded = getDataList(snapshotData['first_aid_needed']);
    _additionalNotes = snapshotData['additional_notes'] as String?;
    _quotePrice = castToType<double>(snapshotData['quote_price']);
    _isQuoteAccepted = getDataList(snapshotData['is_quote_accepted']);
    _paymentStatus = getDataList(snapshotData['payment_status']);
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'flatsshuttles-gr3bc7')
      .collection('tripbooking');

  static Stream<TripbookingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TripbookingRecord.fromSnapshot(s));

  static Future<TripbookingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TripbookingRecord.fromSnapshot(s));

  static TripbookingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TripbookingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TripbookingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TripbookingRecord._(reference, mapFromFirestore(data));

  static TripbookingRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TripbookingRecord.getDocumentFromData(
        {
          'request_id': snapshot.data['request_id'],
          'requester_user_id': convertAlgoliaParam(
            snapshot.data['requester_user_id'],
            ParamType.DocumentReference,
            false,
          ),
          'status': snapshot.data['status'],
          'created_at': convertAlgoliaParam(
            snapshot.data['created_at'],
            ParamType.DateTime,
            false,
          ),
          'trip_type': safeGet(
            () => snapshot.data['trip_type'].toList(),
          ),
          'organization_name': snapshot.data['organization_name'],
          'preferred_location': snapshot.data['preferred_location'],
          'trip_date_time': convertAlgoliaParam(
            snapshot.data['trip_date_time'],
            ParamType.DateTime,
            false,
          ),
          'estimated_participants': convertAlgoliaParam(
            snapshot.data['estimated_participants'],
            ParamType.int,
            false,
          ),
          'wheelchair_accessibility': safeGet(
            () => snapshot.data['wheelchair_accessibility'].toList(),
          ),
          'special_dietary_reqs': safeGet(
            () => snapshot.data['special_dietary_reqs'].toList(),
          ),
          'first_aid_needed': safeGet(
            () => snapshot.data['first_aid_needed'].toList(),
          ),
          'additional_notes': snapshot.data['additional_notes'],
          'quote_price': convertAlgoliaParam(
            snapshot.data['quote_price'],
            ParamType.double,
            false,
          ),
          'is_quote_accepted': safeGet(
            () => snapshot.data['is_quote_accepted'].toList(),
          ),
          'payment_status': safeGet(
            () => snapshot.data['payment_status'].toList(),
          ),
        },
        TripbookingRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TripbookingRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'tripbooking',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TripbookingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TripbookingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTripbookingRecordData({
  String? requestId,
  DocumentReference? requesterUserId,
  String? status,
  DateTime? createdAt,
  String? organizationName,
  String? preferredLocation,
  DateTime? tripDateTime,
  int? estimatedParticipants,
  String? additionalNotes,
  double? quotePrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'request_id': requestId,
      'requester_user_id': requesterUserId,
      'status': status,
      'created_at': createdAt,
      'organization_name': organizationName,
      'preferred_location': preferredLocation,
      'trip_date_time': tripDateTime,
      'estimated_participants': estimatedParticipants,
      'additional_notes': additionalNotes,
      'quote_price': quotePrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class TripbookingRecordDocumentEquality implements Equality<TripbookingRecord> {
  const TripbookingRecordDocumentEquality();

  @override
  bool equals(TripbookingRecord? e1, TripbookingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.requestId == e2?.requestId &&
        e1?.requesterUserId == e2?.requesterUserId &&
        e1?.status == e2?.status &&
        e1?.createdAt == e2?.createdAt &&
        listEquality.equals(e1?.tripType, e2?.tripType) &&
        e1?.organizationName == e2?.organizationName &&
        e1?.preferredLocation == e2?.preferredLocation &&
        e1?.tripDateTime == e2?.tripDateTime &&
        e1?.estimatedParticipants == e2?.estimatedParticipants &&
        listEquality.equals(
            e1?.wheelchairAccessibility, e2?.wheelchairAccessibility) &&
        listEquality.equals(e1?.specialDietaryReqs, e2?.specialDietaryReqs) &&
        listEquality.equals(e1?.firstAidNeeded, e2?.firstAidNeeded) &&
        e1?.additionalNotes == e2?.additionalNotes &&
        e1?.quotePrice == e2?.quotePrice &&
        listEquality.equals(e1?.isQuoteAccepted, e2?.isQuoteAccepted) &&
        listEquality.equals(e1?.paymentStatus, e2?.paymentStatus);
  }

  @override
  int hash(TripbookingRecord? e) => const ListEquality().hash([
        e?.requestId,
        e?.requesterUserId,
        e?.status,
        e?.createdAt,
        e?.tripType,
        e?.organizationName,
        e?.preferredLocation,
        e?.tripDateTime,
        e?.estimatedParticipants,
        e?.wheelchairAccessibility,
        e?.specialDietaryReqs,
        e?.firstAidNeeded,
        e?.additionalNotes,
        e?.quotePrice,
        e?.isQuoteAccepted,
        e?.paymentStatus
      ]);

  @override
  bool isValidKey(Object? o) => o is TripbookingRecord;
}
