import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HotelsRecord extends FirestoreRecord {
  HotelsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "hotel_id" field.
  String? _hotelId;
  String get hotelId => _hotelId ?? '';
  bool hasHotelId() => _hotelId != null;

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

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "hotel_name" field.
  String? _hotelName;
  String get hotelName => _hotelName ?? '';
  bool hasHotelName() => _hotelName != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "star_rating" field.
  int? _starRating;
  int get starRating => _starRating ?? 0;
  bool hasStarRating() => _starRating != null;

  // "price_per_night_min" field.
  double? _pricePerNightMin;
  double get pricePerNightMin => _pricePerNightMin ?? 0.0;
  bool hasPricePerNightMin() => _pricePerNightMin != null;

  // "total_rooms" field.
  int? _totalRooms;
  int get totalRooms => _totalRooms ?? 0;
  bool hasTotalRooms() => _totalRooms != null;

  // "available_rooms" field.
  int? _availableRooms;
  int get availableRooms => _availableRooms ?? 0;
  bool hasAvailableRooms() => _availableRooms != null;

  // "amenities" field.
  List<String>? _amenities;
  List<String> get amenities => _amenities ?? const [];
  bool hasAmenities() => _amenities != null;

  // "contact_phone" field.
  String? _contactPhone;
  String get contactPhone => _contactPhone ?? '';
  bool hasContactPhone() => _contactPhone != null;

  // "contact_email" field.
  String? _contactEmail;
  String get contactEmail => _contactEmail ?? '';
  bool hasContactEmail() => _contactEmail != null;

  // "website_url" field.
  String? _websiteUrl;
  String get websiteUrl => _websiteUrl ?? '';
  bool hasWebsiteUrl() => _websiteUrl != null;

  void _initializeFields() {
    _hotelId = snapshotData['hotel_id'] as String?;
    _addedByAdminId = snapshotData['added_by_admin_id'] as DocumentReference?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _isActive = snapshotData['is_active'] as bool?;
    _photo = snapshotData['photo'] as String?;
    _hotelName = snapshotData['hotel_name'] as String?;
    _description = snapshotData['description'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _starRating = castToType<int>(snapshotData['star_rating']);
    _pricePerNightMin = castToType<double>(snapshotData['price_per_night_min']);
    _totalRooms = castToType<int>(snapshotData['total_rooms']);
    _availableRooms = castToType<int>(snapshotData['available_rooms']);
    _amenities = getDataList(snapshotData['amenities']);
    _contactPhone = snapshotData['contact_phone'] as String?;
    _contactEmail = snapshotData['contact_email'] as String?;
    _websiteUrl = snapshotData['website_url'] as String?;
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'flatsshuttles-gr3bc7')
      .collection('hotels');

  static Stream<HotelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HotelsRecord.fromSnapshot(s));

  static Future<HotelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HotelsRecord.fromSnapshot(s));

  static HotelsRecord fromSnapshot(DocumentSnapshot snapshot) => HotelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HotelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HotelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HotelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HotelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHotelsRecordData({
  String? hotelId,
  DocumentReference? addedByAdminId,
  DateTime? createdAt,
  bool? isActive,
  String? photo,
  String? hotelName,
  String? description,
  LatLng? location,
  int? starRating,
  double? pricePerNightMin,
  int? totalRooms,
  int? availableRooms,
  String? contactPhone,
  String? contactEmail,
  String? websiteUrl,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'hotel_id': hotelId,
      'added_by_admin_id': addedByAdminId,
      'created_at': createdAt,
      'is_active': isActive,
      'photo': photo,
      'hotel_name': hotelName,
      'description': description,
      'location': location,
      'star_rating': starRating,
      'price_per_night_min': pricePerNightMin,
      'total_rooms': totalRooms,
      'available_rooms': availableRooms,
      'contact_phone': contactPhone,
      'contact_email': contactEmail,
      'website_url': websiteUrl,
    }.withoutNulls,
  );

  return firestoreData;
}

class HotelsRecordDocumentEquality implements Equality<HotelsRecord> {
  const HotelsRecordDocumentEquality();

  @override
  bool equals(HotelsRecord? e1, HotelsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.hotelId == e2?.hotelId &&
        e1?.addedByAdminId == e2?.addedByAdminId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.isActive == e2?.isActive &&
        e1?.photo == e2?.photo &&
        e1?.hotelName == e2?.hotelName &&
        e1?.description == e2?.description &&
        e1?.location == e2?.location &&
        e1?.starRating == e2?.starRating &&
        e1?.pricePerNightMin == e2?.pricePerNightMin &&
        e1?.totalRooms == e2?.totalRooms &&
        e1?.availableRooms == e2?.availableRooms &&
        listEquality.equals(e1?.amenities, e2?.amenities) &&
        e1?.contactPhone == e2?.contactPhone &&
        e1?.contactEmail == e2?.contactEmail &&
        e1?.websiteUrl == e2?.websiteUrl;
  }

  @override
  int hash(HotelsRecord? e) => const ListEquality().hash([
        e?.hotelId,
        e?.addedByAdminId,
        e?.createdAt,
        e?.isActive,
        e?.photo,
        e?.hotelName,
        e?.description,
        e?.location,
        e?.starRating,
        e?.pricePerNightMin,
        e?.totalRooms,
        e?.availableRooms,
        e?.amenities,
        e?.contactPhone,
        e?.contactEmail,
        e?.websiteUrl
      ]);

  @override
  bool isValidKey(Object? o) => o is HotelsRecord;
}
