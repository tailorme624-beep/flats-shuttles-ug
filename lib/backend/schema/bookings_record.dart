import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BookingsRecord extends FirestoreRecord {
  BookingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "booking_id" field.
  String? _bookingId;
  String get bookingId => _bookingId ?? '';
  bool hasBookingId() => _bookingId != null;

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "flight_reference" field.
  DocumentReference? _flightReference;
  DocumentReference? get flightReference => _flightReference;
  bool hasFlightReference() => _flightReference != null;

  // "booking_status" field.
  List<String>? _bookingStatus;
  List<String> get bookingStatus => _bookingStatus ?? const [];
  bool hasBookingStatus() => _bookingStatus != null;

  // "total_cost" field.
  double? _totalCost;
  double get totalCost => _totalCost ?? 0.0;
  bool hasTotalCost() => _totalCost != null;

  // "passengers" field.
  List<String>? _passengers;
  List<String> get passengers => _passengers ?? const [];
  bool hasPassengers() => _passengers != null;

  void _initializeFields() {
    _bookingId = snapshotData['booking_id'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _flightReference = snapshotData['flight_reference'] as DocumentReference?;
    _bookingStatus = getDataList(snapshotData['booking_status']);
    _totalCost = castToType<double>(snapshotData['total_cost']);
    _passengers = getDataList(snapshotData['passengers']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bookings');

  static Stream<BookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BookingsRecord.fromSnapshot(s));

  static Future<BookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BookingsRecord.fromSnapshot(s));

  static BookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BookingsRecord._(reference, mapFromFirestore(data));

  static BookingsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      BookingsRecord.getDocumentFromData(
        {
          'booking_id': snapshot.data['booking_id'],
          'user_id': convertAlgoliaParam(
            snapshot.data['user_id'],
            ParamType.DocumentReference,
            false,
          ),
          'flight_reference': convertAlgoliaParam(
            snapshot.data['flight_reference'],
            ParamType.DocumentReference,
            false,
          ),
          'booking_status': safeGet(
            () => snapshot.data['booking_status'].toList(),
          ),
          'total_cost': convertAlgoliaParam(
            snapshot.data['total_cost'],
            ParamType.double,
            false,
          ),
          'passengers': safeGet(
            () => snapshot.data['passengers'].toList(),
          ),
        },
        BookingsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<BookingsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'bookings',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'BookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBookingsRecordData({
  String? bookingId,
  DocumentReference? userId,
  DocumentReference? flightReference,
  double? totalCost,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'booking_id': bookingId,
      'user_id': userId,
      'flight_reference': flightReference,
      'total_cost': totalCost,
    }.withoutNulls,
  );

  return firestoreData;
}

class BookingsRecordDocumentEquality implements Equality<BookingsRecord> {
  const BookingsRecordDocumentEquality();

  @override
  bool equals(BookingsRecord? e1, BookingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bookingId == e2?.bookingId &&
        e1?.userId == e2?.userId &&
        e1?.flightReference == e2?.flightReference &&
        listEquality.equals(e1?.bookingStatus, e2?.bookingStatus) &&
        e1?.totalCost == e2?.totalCost &&
        listEquality.equals(e1?.passengers, e2?.passengers);
  }

  @override
  int hash(BookingsRecord? e) => const ListEquality().hash([
        e?.bookingId,
        e?.userId,
        e?.flightReference,
        e?.bookingStatus,
        e?.totalCost,
        e?.passengers
      ]);

  @override
  bool isValidKey(Object? o) => o is BookingsRecord;
}
