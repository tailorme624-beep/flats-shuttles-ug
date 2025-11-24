import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ToursRecord extends FirestoreRecord {
  ToursRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tour_id" field.
  String? _tourId;
  String get tourId => _tourId ?? '';
  bool hasTourId() => _tourId != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  // "is_active" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "photos" field.
  String? _photos;
  String get photos => _photos ?? '';
  bool hasPhotos() => _photos != null;

  // "place_name" field.
  String? _placeName;
  String get placeName => _placeName ?? '';
  bool hasPlaceName() => _placeName != null;

  // "location_address" field.
  String? _locationAddress;
  String get locationAddress => _locationAddress ?? '';
  bool hasLocationAddress() => _locationAddress != null;

  // "location_geopoint" field.
  LatLng? _locationGeopoint;
  LatLng? get locationGeopoint => _locationGeopoint;
  bool hasLocationGeopoint() => _locationGeopoint != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  bool hasCategory() => _category != null;

  // "cost_per_person" field.
  double? _costPerPerson;
  double get costPerPerson => _costPerPerson ?? 0.0;
  bool hasCostPerPerson() => _costPerPerson != null;

  // "duration_days" field.
  int? _durationDays;
  int get durationDays => _durationDays ?? 0;
  bool hasDurationDays() => _durationDays != null;

  // "included_services" field.
  List<String>? _includedServices;
  List<String> get includedServices => _includedServices ?? const [];
  bool hasIncludedServices() => _includedServices != null;

  // "special_notes" field.
  String? _specialNotes;
  String get specialNotes => _specialNotes ?? '';
  bool hasSpecialNotes() => _specialNotes != null;

  void _initializeFields() {
    _tourId = snapshotData['tour_id'] as String?;
    _createdAt = snapshotData['created_at'] as DateTime?;
    _isActive = snapshotData['is_active'] as bool?;
    _photos = snapshotData['photos'] as String?;
    _placeName = snapshotData['place_name'] as String?;
    _locationAddress = snapshotData['location_address'] as String?;
    _locationGeopoint = snapshotData['location_geopoint'] as LatLng?;
    _description = snapshotData['description'] as String?;
    _category = snapshotData['category'] as String?;
    _costPerPerson = castToType<double>(snapshotData['cost_per_person']);
    _durationDays = castToType<int>(snapshotData['duration_days']);
    _includedServices = getDataList(snapshotData['included_services']);
    _specialNotes = snapshotData['special_notes'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tours');

  static Stream<ToursRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ToursRecord.fromSnapshot(s));

  static Future<ToursRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ToursRecord.fromSnapshot(s));

  static ToursRecord fromSnapshot(DocumentSnapshot snapshot) => ToursRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ToursRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ToursRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ToursRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ToursRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createToursRecordData({
  String? tourId,
  DateTime? createdAt,
  bool? isActive,
  String? photos,
  String? placeName,
  String? locationAddress,
  LatLng? locationGeopoint,
  String? description,
  String? category,
  double? costPerPerson,
  int? durationDays,
  String? specialNotes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'tour_id': tourId,
      'created_at': createdAt,
      'is_active': isActive,
      'photos': photos,
      'place_name': placeName,
      'location_address': locationAddress,
      'location_geopoint': locationGeopoint,
      'description': description,
      'category': category,
      'cost_per_person': costPerPerson,
      'duration_days': durationDays,
      'special_notes': specialNotes,
    }.withoutNulls,
  );

  return firestoreData;
}

class ToursRecordDocumentEquality implements Equality<ToursRecord> {
  const ToursRecordDocumentEquality();

  @override
  bool equals(ToursRecord? e1, ToursRecord? e2) {
    const listEquality = ListEquality();
    return e1?.tourId == e2?.tourId &&
        e1?.createdAt == e2?.createdAt &&
        e1?.isActive == e2?.isActive &&
        e1?.photos == e2?.photos &&
        e1?.placeName == e2?.placeName &&
        e1?.locationAddress == e2?.locationAddress &&
        e1?.locationGeopoint == e2?.locationGeopoint &&
        e1?.description == e2?.description &&
        e1?.category == e2?.category &&
        e1?.costPerPerson == e2?.costPerPerson &&
        e1?.durationDays == e2?.durationDays &&
        listEquality.equals(e1?.includedServices, e2?.includedServices) &&
        e1?.specialNotes == e2?.specialNotes;
  }

  @override
  int hash(ToursRecord? e) => const ListEquality().hash([
        e?.tourId,
        e?.createdAt,
        e?.isActive,
        e?.photos,
        e?.placeName,
        e?.locationAddress,
        e?.locationGeopoint,
        e?.description,
        e?.category,
        e?.costPerPerson,
        e?.durationDays,
        e?.includedServices,
        e?.specialNotes
      ]);

  @override
  bool isValidKey(Object? o) => o is ToursRecord;
}
