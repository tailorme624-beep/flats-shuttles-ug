import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HotelbookingsRecord extends FirestoreRecord {
  HotelbookingsRecord._(
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

  // "booking_status" field.
  List<String>? _bookingStatus;
  List<String> get bookingStatus => _bookingStatus ?? const [];
  bool hasBookingStatus() => _bookingStatus != null;

  // "booked_at" field.
  DateTime? _bookedAt;
  DateTime? get bookedAt => _bookedAt;
  bool hasBookedAt() => _bookedAt != null;

  // "hotel_name" field.
  List<String>? _hotelName;
  List<String> get hotelName => _hotelName ?? const [];
  bool hasHotelName() => _hotelName != null;

  // "room_type" field.
  List<String>? _roomType;
  List<String> get roomType => _roomType ?? const [];
  bool hasRoomType() => _roomType != null;

  // "check_in_date" field.
  DateTime? _checkInDate;
  DateTime? get checkInDate => _checkInDate;
  bool hasCheckInDate() => _checkInDate != null;

  // "check_out_date" field.
  DateTime? _checkOutDate;
  DateTime? get checkOutDate => _checkOutDate;
  bool hasCheckOutDate() => _checkOutDate != null;

  // "nights" field.
  int? _nights;
  int get nights => _nights ?? 0;
  bool hasNights() => _nights != null;

  // "guest_full_name" field.
  String? _guestFullName;
  String get guestFullName => _guestFullName ?? '';
  bool hasGuestFullName() => _guestFullName != null;

  // "guest_email" field.
  String? _guestEmail;
  String get guestEmail => _guestEmail ?? '';
  bool hasGuestEmail() => _guestEmail != null;

  // "guest_phone" field.
  String? _guestPhone;
  String get guestPhone => _guestPhone ?? '';
  bool hasGuestPhone() => _guestPhone != null;

  // "bed_type" field.
  List<String>? _bedType;
  List<String> get bedType => _bedType ?? const [];
  bool hasBedType() => _bedType != null;

  // "smoking_room" field.
  List<bool>? _smokingRoom;
  List<bool> get smokingRoom => _smokingRoom ?? const [];
  bool hasSmokingRoom() => _smokingRoom != null;

  // "special_requests" field.
  String? _specialRequests;
  String get specialRequests => _specialRequests ?? '';
  bool hasSpecialRequests() => _specialRequests != null;

  // "price_room_rate" field.
  List<double>? _priceRoomRate;
  List<double> get priceRoomRate => _priceRoomRate ?? const [];
  bool hasPriceRoomRate() => _priceRoomRate != null;

  // "price_taxes_fees" field.
  double? _priceTaxesFees;
  double get priceTaxesFees => _priceTaxesFees ?? 0.0;
  bool hasPriceTaxesFees() => _priceTaxesFees != null;

  // "price_total" field.
  double? _priceTotal;
  double get priceTotal => _priceTotal ?? 0.0;
  bool hasPriceTotal() => _priceTotal != null;

  // "payment_method" field.
  List<String>? _paymentMethod;
  List<String> get paymentMethod => _paymentMethod ?? const [];
  bool hasPaymentMethod() => _paymentMethod != null;

  // "payment_cardholder_name" field.
  String? _paymentCardholderName;
  String get paymentCardholderName => _paymentCardholderName ?? '';
  bool hasPaymentCardholderName() => _paymentCardholderName != null;

  // "payment_zip_code" field.
  String? _paymentZipCode;
  String get paymentZipCode => _paymentZipCode ?? '';
  bool hasPaymentZipCode() => _paymentZipCode != null;

  void _initializeFields() {
    _bookingId = snapshotData['booking_id'] as String?;
    _userId = snapshotData['user_id'] as DocumentReference?;
    _bookingStatus = getDataList(snapshotData['booking_status']);
    _bookedAt = snapshotData['booked_at'] as DateTime?;
    _hotelName = getDataList(snapshotData['hotel_name']);
    _roomType = getDataList(snapshotData['room_type']);
    _checkInDate = snapshotData['check_in_date'] as DateTime?;
    _checkOutDate = snapshotData['check_out_date'] as DateTime?;
    _nights = castToType<int>(snapshotData['nights']);
    _guestFullName = snapshotData['guest_full_name'] as String?;
    _guestEmail = snapshotData['guest_email'] as String?;
    _guestPhone = snapshotData['guest_phone'] as String?;
    _bedType = getDataList(snapshotData['bed_type']);
    _smokingRoom = getDataList(snapshotData['smoking_room']);
    _specialRequests = snapshotData['special_requests'] as String?;
    _priceRoomRate = getDataList(snapshotData['price_room_rate']);
    _priceTaxesFees = castToType<double>(snapshotData['price_taxes_fees']);
    _priceTotal = castToType<double>(snapshotData['price_total']);
    _paymentMethod = getDataList(snapshotData['payment_method']);
    _paymentCardholderName = snapshotData['payment_cardholder_name'] as String?;
    _paymentZipCode = snapshotData['payment_zip_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hotelbookings');

  static Stream<HotelbookingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HotelbookingsRecord.fromSnapshot(s));

  static Future<HotelbookingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HotelbookingsRecord.fromSnapshot(s));

  static HotelbookingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      HotelbookingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HotelbookingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HotelbookingsRecord._(reference, mapFromFirestore(data));

  static HotelbookingsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      HotelbookingsRecord.getDocumentFromData(
        {
          'booking_id': snapshot.data['booking_id'],
          'user_id': convertAlgoliaParam(
            snapshot.data['user_id'],
            ParamType.DocumentReference,
            false,
          ),
          'booking_status': safeGet(
            () => snapshot.data['booking_status'].toList(),
          ),
          'booked_at': convertAlgoliaParam(
            snapshot.data['booked_at'],
            ParamType.DateTime,
            false,
          ),
          'hotel_name': safeGet(
            () => snapshot.data['hotel_name'].toList(),
          ),
          'room_type': safeGet(
            () => snapshot.data['room_type'].toList(),
          ),
          'check_in_date': convertAlgoliaParam(
            snapshot.data['check_in_date'],
            ParamType.DateTime,
            false,
          ),
          'check_out_date': convertAlgoliaParam(
            snapshot.data['check_out_date'],
            ParamType.DateTime,
            false,
          ),
          'nights': convertAlgoliaParam(
            snapshot.data['nights'],
            ParamType.int,
            false,
          ),
          'guest_full_name': snapshot.data['guest_full_name'],
          'guest_email': snapshot.data['guest_email'],
          'guest_phone': snapshot.data['guest_phone'],
          'bed_type': safeGet(
            () => snapshot.data['bed_type'].toList(),
          ),
          'smoking_room': safeGet(
            () => snapshot.data['smoking_room'].toList(),
          ),
          'special_requests': snapshot.data['special_requests'],
          'price_room_rate': safeGet(
            () => convertAlgoliaParam<double>(
              snapshot.data['price_room_rate'],
              ParamType.double,
              true,
            ).toList(),
          ),
          'price_taxes_fees': convertAlgoliaParam(
            snapshot.data['price_taxes_fees'],
            ParamType.double,
            false,
          ),
          'price_total': convertAlgoliaParam(
            snapshot.data['price_total'],
            ParamType.double,
            false,
          ),
          'payment_method': safeGet(
            () => snapshot.data['payment_method'].toList(),
          ),
          'payment_cardholder_name': snapshot.data['payment_cardholder_name'],
          'payment_zip_code': snapshot.data['payment_zip_code'],
        },
        HotelbookingsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<HotelbookingsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'hotelbookings',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'HotelbookingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HotelbookingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHotelbookingsRecordData({
  String? bookingId,
  DocumentReference? userId,
  DateTime? bookedAt,
  DateTime? checkInDate,
  DateTime? checkOutDate,
  int? nights,
  String? guestFullName,
  String? guestEmail,
  String? guestPhone,
  String? specialRequests,
  double? priceTaxesFees,
  double? priceTotal,
  String? paymentCardholderName,
  String? paymentZipCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'booking_id': bookingId,
      'user_id': userId,
      'booked_at': bookedAt,
      'check_in_date': checkInDate,
      'check_out_date': checkOutDate,
      'nights': nights,
      'guest_full_name': guestFullName,
      'guest_email': guestEmail,
      'guest_phone': guestPhone,
      'special_requests': specialRequests,
      'price_taxes_fees': priceTaxesFees,
      'price_total': priceTotal,
      'payment_cardholder_name': paymentCardholderName,
      'payment_zip_code': paymentZipCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class HotelbookingsRecordDocumentEquality
    implements Equality<HotelbookingsRecord> {
  const HotelbookingsRecordDocumentEquality();

  @override
  bool equals(HotelbookingsRecord? e1, HotelbookingsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bookingId == e2?.bookingId &&
        e1?.userId == e2?.userId &&
        listEquality.equals(e1?.bookingStatus, e2?.bookingStatus) &&
        e1?.bookedAt == e2?.bookedAt &&
        listEquality.equals(e1?.hotelName, e2?.hotelName) &&
        listEquality.equals(e1?.roomType, e2?.roomType) &&
        e1?.checkInDate == e2?.checkInDate &&
        e1?.checkOutDate == e2?.checkOutDate &&
        e1?.nights == e2?.nights &&
        e1?.guestFullName == e2?.guestFullName &&
        e1?.guestEmail == e2?.guestEmail &&
        e1?.guestPhone == e2?.guestPhone &&
        listEquality.equals(e1?.bedType, e2?.bedType) &&
        listEquality.equals(e1?.smokingRoom, e2?.smokingRoom) &&
        e1?.specialRequests == e2?.specialRequests &&
        listEquality.equals(e1?.priceRoomRate, e2?.priceRoomRate) &&
        e1?.priceTaxesFees == e2?.priceTaxesFees &&
        e1?.priceTotal == e2?.priceTotal &&
        listEquality.equals(e1?.paymentMethod, e2?.paymentMethod) &&
        e1?.paymentCardholderName == e2?.paymentCardholderName &&
        e1?.paymentZipCode == e2?.paymentZipCode;
  }

  @override
  int hash(HotelbookingsRecord? e) => const ListEquality().hash([
        e?.bookingId,
        e?.userId,
        e?.bookingStatus,
        e?.bookedAt,
        e?.hotelName,
        e?.roomType,
        e?.checkInDate,
        e?.checkOutDate,
        e?.nights,
        e?.guestFullName,
        e?.guestEmail,
        e?.guestPhone,
        e?.bedType,
        e?.smokingRoom,
        e?.specialRequests,
        e?.priceRoomRate,
        e?.priceTaxesFees,
        e?.priceTotal,
        e?.paymentMethod,
        e?.paymentCardholderName,
        e?.paymentZipCode
      ]);

  @override
  bool isValidKey(Object? o) => o is HotelbookingsRecord;
}
