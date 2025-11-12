import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AvaflightsRecord extends FirestoreRecord {
  AvaflightsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "flight_id" field.
  String? _flightId;
  String get flightId => _flightId ?? '';
  bool hasFlightId() => _flightId != null;

  // "added_by_admin_id" field.
  DocumentReference? _addedByAdminId;
  DocumentReference? get addedByAdminId => _addedByAdminId;
  bool hasAddedByAdminId() => _addedByAdminId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "flight_number" field.
  String? _flightNumber;
  String get flightNumber => _flightNumber ?? '';
  bool hasFlightNumber() => _flightNumber != null;

  // "airline" field.
  String? _airline;
  String get airline => _airline ?? '';
  bool hasAirline() => _airline != null;

  // "aircraft_type" field.
  String? _aircraftType;
  String get aircraftType => _aircraftType ?? '';
  bool hasAircraftType() => _aircraftType != null;

  // "origin_city" field.
  String? _originCity;
  String get originCity => _originCity ?? '';
  bool hasOriginCity() => _originCity != null;

  // "Destination_city" field.
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

  // "flight_duration" field.
  String? _flightDuration;
  String get flightDuration => _flightDuration ?? '';
  bool hasFlightDuration() => _flightDuration != null;

  // "price_economy" field.
  double? _priceEconomy;
  double get priceEconomy => _priceEconomy ?? 0.0;
  bool hasPriceEconomy() => _priceEconomy != null;

  // "price_business" field.
  double? _priceBusiness;
  double get priceBusiness => _priceBusiness ?? 0.0;
  bool hasPriceBusiness() => _priceBusiness != null;

  // "seats_economy_total" field.
  int? _seatsEconomyTotal;
  int get seatsEconomyTotal => _seatsEconomyTotal ?? 0;
  bool hasSeatsEconomyTotal() => _seatsEconomyTotal != null;

  // "seats_business_total" field.
  int? _seatsBusinessTotal;
  int get seatsBusinessTotal => _seatsBusinessTotal ?? 0;
  bool hasSeatsBusinessTotal() => _seatsBusinessTotal != null;

  // "seats_available" field.
  int? _seatsAvailable;
  int get seatsAvailable => _seatsAvailable ?? 0;
  bool hasSeatsAvailable() => _seatsAvailable != null;

  void _initializeFields() {
    _flightId = snapshotData['flight_id'] as String?;
    _addedByAdminId = snapshotData['added_by_admin_id'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _isActive = snapshotData['is_active'] as bool?;
    _flightNumber = snapshotData['flight_number'] as String?;
    _airline = snapshotData['airline'] as String?;
    _aircraftType = snapshotData['aircraft_type'] as String?;
    _originCity = snapshotData['origin_city'] as String?;
    _destinationCity = snapshotData['Destination_city'] as String?;
    _departureTime = snapshotData['departure_time'] as DateTime?;
    _arrivalTime = snapshotData['arrival_time'] as DateTime?;
    _flightDuration = snapshotData['flight_duration'] as String?;
    _priceEconomy = castToType<double>(snapshotData['price_economy']);
    _priceBusiness = castToType<double>(snapshotData['price_business']);
    _seatsEconomyTotal = castToType<int>(snapshotData['seats_economy_total']);
    _seatsBusinessTotal = castToType<int>(snapshotData['seats_business_total']);
    _seatsAvailable = castToType<int>(snapshotData['seats_available']);
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'flatsshuttles-gr3bc7')
      .collection('avaflights');

  static Stream<AvaflightsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AvaflightsRecord.fromSnapshot(s));

  static Future<AvaflightsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AvaflightsRecord.fromSnapshot(s));

  static AvaflightsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AvaflightsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AvaflightsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AvaflightsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AvaflightsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AvaflightsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAvaflightsRecordData({
  String? flightId,
  DocumentReference? addedByAdminId,
  DateTime? createdAt,
  bool? isActive,
  String? flightNumber,
  String? airline,
  String? aircraftType,
  String? originCity,
  String? destinationCity,
  DateTime? departureTime,
  DateTime? arrivalTime,
  String? flightDuration,
  double? priceEconomy,
  double? priceBusiness,
  int? seatsEconomyTotal,
  int? seatsBusinessTotal,
  int? seatsAvailable,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'flight_id': flightId,
      'added_by_admin_id': addedByAdminId,
      'created_at': createdAt,
      'is_active': isActive,
      'flight_number': flightNumber,
      'airline': airline,
      'aircraft_type': aircraftType,
      'origin_city': originCity,
      'Destination_city': destinationCity,
      'departure_time': departureTime,
      'arrival_time': arrivalTime,
      'flight_duration': flightDuration,
      'price_economy': priceEconomy,
      'price_business': priceBusiness,
      'seats_economy_total': seatsEconomyTotal,
      'seats_business_total': seatsBusinessTotal,
      'seats_available': seatsAvailable,
    }.withoutNulls,
  );

  return firestoreData;
}

class AvaflightsRecordDocumentEquality implements Equality<AvaflightsRecord> {
  const AvaflightsRecordDocumentEquality();

  @override
  bool equals(AvaflightsRecord? e1, AvaflightsRecord? e2) {
    return e1?.flightId == e2?.flightId &&
        e1?.addedByAdminId == e2?.addedByAdminId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.isActive == e2?.isActive &&
        e1?.flightNumber == e2?.flightNumber &&
        e1?.airline == e2?.airline &&
        e1?.aircraftType == e2?.aircraftType &&
        e1?.originCity == e2?.originCity &&
        e1?.destinationCity == e2?.destinationCity &&
        e1?.departureTime == e2?.departureTime &&
        e1?.arrivalTime == e2?.arrivalTime &&
        e1?.flightDuration == e2?.flightDuration &&
        e1?.priceEconomy == e2?.priceEconomy &&
        e1?.priceBusiness == e2?.priceBusiness &&
        e1?.seatsEconomyTotal == e2?.seatsEconomyTotal &&
        e1?.seatsBusinessTotal == e2?.seatsBusinessTotal &&
        e1?.seatsAvailable == e2?.seatsAvailable;
  }

  @override
  int hash(AvaflightsRecord? e) => const ListEquality().hash([
        e?.flightId,
        e?.addedByAdminId,
        e?.createdAt,
        e?.isActive,
        e?.flightNumber,
        e?.airline,
        e?.aircraftType,
        e?.originCity,
        e?.destinationCity,
        e?.departureTime,
        e?.arrivalTime,
        e?.flightDuration,
        e?.priceEconomy,
        e?.priceBusiness,
        e?.seatsEconomyTotal,
        e?.seatsBusinessTotal,
        e?.seatsAvailable
      ]);

  @override
  bool isValidKey(Object? o) => o is AvaflightsRecord;
}
