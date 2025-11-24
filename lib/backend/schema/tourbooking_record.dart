import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TourbookingRecord extends FirestoreRecord {
  TourbookingRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bookings_id" field.
  String? _bookingsId;
  String get bookingsId => _bookingsId ?? '';
  bool hasBookingsId() => _bookingsId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "tour_name" field.
  String? _tourName;
  String get tourName => _tourName ?? '';
  bool hasTourName() => _tourName != null;

  // "booking_status" field.
  List<String>? _bookingStatus;
  List<String> get bookingStatus => _bookingStatus ?? const [];
  bool hasBookingStatus() => _bookingStatus != null;

  // "requested_at" field.
  DateTime? _requestedAt;
  DateTime? get requestedAt => _requestedAt;
  bool hasRequestedAt() => _requestedAt != null;

  // "tour_date_time" field.
  DateTime? _tourDateTime;
  DateTime? get tourDateTime => _tourDateTime;
  bool hasTourDateTime() => _tourDateTime != null;

  // "participants_adults" field.
  int? _participantsAdults;
  int get participantsAdults => _participantsAdults ?? 0;
  bool hasParticipantsAdults() => _participantsAdults != null;

  // "participants_children" field.
  int? _participantsChildren;
  int get participantsChildren => _participantsChildren ?? 0;
  bool hasParticipantsChildren() => _participantsChildren != null;

  // "total_participants" field.
  int? _totalParticipants;
  int get totalParticipants => _totalParticipants ?? 0;
  bool hasTotalParticipants() => _totalParticipants != null;

  // "language_preference" field.
  List<String>? _languagePreference;
  List<String> get languagePreference => _languagePreference ?? const [];
  bool hasLanguagePreference() => _languagePreference != null;

  // "special_requirements" field.
  List<String>? _specialRequirements;
  List<String> get specialRequirements => _specialRequirements ?? const [];
  bool hasSpecialRequirements() => _specialRequirements != null;

  // "estimated_price" field.
  double? _estimatedPrice;
  double get estimatedPrice => _estimatedPrice ?? 0.0;
  bool hasEstimatedPrice() => _estimatedPrice != null;

  // "payment_method" field.
  List<String>? _paymentMethod;
  List<String> get paymentMethod => _paymentMethod ?? const [];
  bool hasPaymentMethod() => _paymentMethod != null;

  void _initializeFields() {
    _bookingsId = snapshotData['bookings_id'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _tourName = snapshotData['tour_name'] as String?;
    _bookingStatus = getDataList(snapshotData['booking_status']);
    _requestedAt = snapshotData['requested_at'] as DateTime?;
    _tourDateTime = snapshotData['tour_date_time'] as DateTime?;
    _participantsAdults = castToType<int>(snapshotData['participants_adults']);
    _participantsChildren =
        castToType<int>(snapshotData['participants_children']);
    _totalParticipants = castToType<int>(snapshotData['total_participants']);
    _languagePreference = getDataList(snapshotData['language_preference']);
    _specialRequirements = getDataList(snapshotData['special_requirements']);
    _estimatedPrice = castToType<double>(snapshotData['estimated_price']);
    _paymentMethod = getDataList(snapshotData['payment_method']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tourbooking');

  static Stream<TourbookingRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TourbookingRecord.fromSnapshot(s));

  static Future<TourbookingRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TourbookingRecord.fromSnapshot(s));

  static TourbookingRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TourbookingRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TourbookingRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TourbookingRecord._(reference, mapFromFirestore(data));

  static TourbookingRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TourbookingRecord.getDocumentFromData(
        {
          'bookings_id': snapshot.data['bookings_id'],
          'user_id': convertAlgoliaParam(
            snapshot.data['user_id'],
            ParamType.DocumentReference,
            false,
          ),
          'tour_name': snapshot.data['tour_name'],
          'booking_status': safeGet(
            () => snapshot.data['booking_status'].toList(),
          ),
          'requested_at': convertAlgoliaParam(
            snapshot.data['requested_at'],
            ParamType.DateTime,
            false,
          ),
          'tour_date_time': convertAlgoliaParam(
            snapshot.data['tour_date_time'],
            ParamType.DateTime,
            false,
          ),
          'participants_adults': convertAlgoliaParam(
            snapshot.data['participants_adults'],
            ParamType.int,
            false,
          ),
          'participants_children': convertAlgoliaParam(
            snapshot.data['participants_children'],
            ParamType.int,
            false,
          ),
          'total_participants': convertAlgoliaParam(
            snapshot.data['total_participants'],
            ParamType.int,
            false,
          ),
          'language_preference': safeGet(
            () => snapshot.data['language_preference'].toList(),
          ),
          'special_requirements': safeGet(
            () => snapshot.data['special_requirements'].toList(),
          ),
          'estimated_price': convertAlgoliaParam(
            snapshot.data['estimated_price'],
            ParamType.double,
            false,
          ),
          'payment_method': safeGet(
            () => snapshot.data['payment_method'].toList(),
          ),
        },
        TourbookingRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TourbookingRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'tourbooking',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TourbookingRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TourbookingRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTourbookingRecordData({
  String? bookingsId,
  DocumentReference? userId,
  String? tourName,
  DateTime? requestedAt,
  DateTime? tourDateTime,
  int? participantsAdults,
  int? participantsChildren,
  int? totalParticipants,
  double? estimatedPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bookings_id': bookingsId,
      'user_id': userId,
      'tour_name': tourName,
      'requested_at': requestedAt,
      'tour_date_time': tourDateTime,
      'participants_adults': participantsAdults,
      'participants_children': participantsChildren,
      'total_participants': totalParticipants,
      'estimated_price': estimatedPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class TourbookingRecordDocumentEquality implements Equality<TourbookingRecord> {
  const TourbookingRecordDocumentEquality();

  @override
  bool equals(TourbookingRecord? e1, TourbookingRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bookingsId == e2?.bookingsId &&
        e1?.userId == e2?.userId &&
        e1?.tourName == e2?.tourName &&
        listEquality.equals(e1?.bookingStatus, e2?.bookingStatus) &&
        e1?.requestedAt == e2?.requestedAt &&
        e1?.tourDateTime == e2?.tourDateTime &&
        e1?.participantsAdults == e2?.participantsAdults &&
        e1?.participantsChildren == e2?.participantsChildren &&
        e1?.totalParticipants == e2?.totalParticipants &&
        listEquality.equals(e1?.languagePreference, e2?.languagePreference) &&
        listEquality.equals(e1?.specialRequirements, e2?.specialRequirements) &&
        e1?.estimatedPrice == e2?.estimatedPrice &&
        listEquality.equals(e1?.paymentMethod, e2?.paymentMethod);
  }

  @override
  int hash(TourbookingRecord? e) => const ListEquality().hash([
        e?.bookingsId,
        e?.userId,
        e?.tourName,
        e?.bookingStatus,
        e?.requestedAt,
        e?.tourDateTime,
        e?.participantsAdults,
        e?.participantsChildren,
        e?.totalParticipants,
        e?.languagePreference,
        e?.specialRequirements,
        e?.estimatedPrice,
        e?.paymentMethod
      ]);

  @override
  bool isValidKey(Object? o) => o is TourbookingRecord;
}
