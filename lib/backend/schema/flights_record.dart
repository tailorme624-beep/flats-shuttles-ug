import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FlightsRecord extends FirestoreRecord {
  FlightsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "flight_id" field.
  String? _flightId;
  String get flightId => _flightId ?? '';
  bool hasFlightId() => _flightId != null;

  // "airline" field.
  List<String>? _airline;
  List<String> get airline => _airline ?? const [];
  bool hasAirline() => _airline != null;

  // "flight_number" field.
  String? _flightNumber;
  String get flightNumber => _flightNumber ?? '';
  bool hasFlightNumber() => _flightNumber != null;

  // "origin_airport_code" field.
  String? _originAirportCode;
  String get originAirportCode => _originAirportCode ?? '';
  bool hasOriginAirportCode() => _originAirportCode != null;

  // "origin_city" field.
  String? _originCity;
  String get originCity => _originCity ?? '';
  bool hasOriginCity() => _originCity != null;

  // "destination_airport_code" field.
  String? _destinationAirportCode;
  String get destinationAirportCode => _destinationAirportCode ?? '';
  bool hasDestinationAirportCode() => _destinationAirportCode != null;

  // "destination_city" field.
  String? _destinationCity;
  String get destinationCity => _destinationCity ?? '';
  bool hasDestinationCity() => _destinationCity != null;

  // "departure_time" field.
  DateTime? _departureTime;
  DateTime? get departureTime => _departureTime;
  bool hasDepartureTime() => _departureTime != null;

  // "arrival_time" field.
  DateTime? _arrivalTime;
  DateTime? get arrivalTime => _arrivalTime;
  bool hasArrivalTime() => _arrivalTime != null;

  // "duration_minutes" field.
  int? _durationMinutes;
  int get durationMinutes => _durationMinutes ?? 0;
  bool hasDurationMinutes() => _durationMinutes != null;

  // "base_price_economy" field.
  double? _basePriceEconomy;
  double get basePriceEconomy => _basePriceEconomy ?? 0.0;
  bool hasBasePriceEconomy() => _basePriceEconomy != null;

  // "base_price_business" field.
  double? _basePriceBusiness;
  double get basePriceBusiness => _basePriceBusiness ?? 0.0;
  bool hasBasePriceBusiness() => _basePriceBusiness != null;

  // "available_seats" field.
  int? _availableSeats;
  int get availableSeats => _availableSeats ?? 0;
  bool hasAvailableSeats() => _availableSeats != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "class_availability" field.
  List<String>? _classAvailability;
  List<String> get classAvailability => _classAvailability ?? const [];
  bool hasClassAvailability() => _classAvailability != null;

  void _initializeFields() {
    _flightId = snapshotData['flight_id'] as String?;
    _airline = getDataList(snapshotData['airline']);
    _flightNumber = snapshotData['flight_number'] as String?;
    _originAirportCode = snapshotData['origin_airport_code'] as String?;
    _originCity = snapshotData['origin_city'] as String?;
    _destinationAirportCode =
        snapshotData['destination_airport_code'] as String?;
    _destinationCity = snapshotData['destination_city'] as String?;
    _departureTime = snapshotData['departure_time'] as DateTime?;
    _arrivalTime = snapshotData['arrival_time'] as DateTime?;
    _durationMinutes = castToType<int>(snapshotData['duration_minutes']);
    _basePriceEconomy = castToType<double>(snapshotData['base_price_economy']);
    _basePriceBusiness =
        castToType<double>(snapshotData['base_price_business']);
    _availableSeats = castToType<int>(snapshotData['available_seats']);
    _isActive = snapshotData['is_active'] as bool?;
    _classAvailability = getDataList(snapshotData['class_availability']);
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'flatsshuttles-gr3bc7')
      .collection('flights');

  static Stream<FlightsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FlightsRecord.fromSnapshot(s));

  static Future<FlightsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FlightsRecord.fromSnapshot(s));

  static FlightsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FlightsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FlightsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FlightsRecord._(reference, mapFromFirestore(data));

  static FlightsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      FlightsRecord.getDocumentFromData(
        {
          'flight_id': snapshot.data['flight_id'],
          'airline': safeGet(
            () => snapshot.data['airline'].toList(),
          ),
          'flight_number': snapshot.data['flight_number'],
          'origin_airport_code': snapshot.data['origin_airport_code'],
          'origin_city': snapshot.data['origin_city'],
          'destination_airport_code': snapshot.data['destination_airport_code'],
          'destination_city': snapshot.data['destination_city'],
          'departure_time': convertAlgoliaParam(
            snapshot.data['departure_time'],
            ParamType.DateTime,
            false,
          ),
          'arrival_time': convertAlgoliaParam(
            snapshot.data['arrival_time'],
            ParamType.DateTime,
            false,
          ),
          'duration_minutes': convertAlgoliaParam(
            snapshot.data['duration_minutes'],
            ParamType.int,
            false,
          ),
          'base_price_economy': convertAlgoliaParam(
            snapshot.data['base_price_economy'],
            ParamType.double,
            false,
          ),
          'base_price_business': convertAlgoliaParam(
            snapshot.data['base_price_business'],
            ParamType.double,
            false,
          ),
          'available_seats': convertAlgoliaParam(
            snapshot.data['available_seats'],
            ParamType.int,
            false,
          ),
          'is_active': snapshot.data['is_active'],
          'class_availability': safeGet(
            () => snapshot.data['class_availability'].toList(),
          ),
        },
        FlightsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<FlightsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'flights',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'FlightsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FlightsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFlightsRecordData({
  String? flightId,
  String? flightNumber,
  String? originAirportCode,
  String? originCity,
  String? destinationAirportCode,
  String? destinationCity,
  DateTime? departureTime,
  DateTime? arrivalTime,
  int? durationMinutes,
  double? basePriceEconomy,
  double? basePriceBusiness,
  int? availableSeats,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'flight_id': flightId,
      'flight_number': flightNumber,
      'origin_airport_code': originAirportCode,
      'origin_city': originCity,
      'destination_airport_code': destinationAirportCode,
      'destination_city': destinationCity,
      'departure_time': departureTime,
      'arrival_time': arrivalTime,
      'duration_minutes': durationMinutes,
      'base_price_economy': basePriceEconomy,
      'base_price_business': basePriceBusiness,
      'available_seats': availableSeats,
      'is_active': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class FlightsRecordDocumentEquality implements Equality<FlightsRecord> {
  const FlightsRecordDocumentEquality();

  @override
  bool equals(FlightsRecord? e1, FlightsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.flightId == e2?.flightId &&
        listEquality.equals(e1?.airline, e2?.airline) &&
        e1?.flightNumber == e2?.flightNumber &&
        e1?.originAirportCode == e2?.originAirportCode &&
        e1?.originCity == e2?.originCity &&
        e1?.destinationAirportCode == e2?.destinationAirportCode &&
        e1?.destinationCity == e2?.destinationCity &&
        e1?.departureTime == e2?.departureTime &&
        e1?.arrivalTime == e2?.arrivalTime &&
        e1?.durationMinutes == e2?.durationMinutes &&
        e1?.basePriceEconomy == e2?.basePriceEconomy &&
        e1?.basePriceBusiness == e2?.basePriceBusiness &&
        e1?.availableSeats == e2?.availableSeats &&
        e1?.isActive == e2?.isActive &&
        listEquality.equals(e1?.classAvailability, e2?.classAvailability);
  }

  @override
  int hash(FlightsRecord? e) => const ListEquality().hash([
        e?.flightId,
        e?.airline,
        e?.flightNumber,
        e?.originAirportCode,
        e?.originCity,
        e?.destinationAirportCode,
        e?.destinationCity,
        e?.departureTime,
        e?.arrivalTime,
        e?.durationMinutes,
        e?.basePriceEconomy,
        e?.basePriceBusiness,
        e?.availableSeats,
        e?.isActive,
        e?.classAvailability
      ]);

  @override
  bool isValidKey(Object? o) => o is FlightsRecord;
}
