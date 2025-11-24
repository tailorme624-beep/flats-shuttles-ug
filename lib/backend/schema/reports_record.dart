import 'dart:async';

import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ReportsRecord extends FirestoreRecord {
  ReportsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "report_id" field.
  String? _reportId;
  String get reportId => _reportId ?? '';
  bool hasReportId() => _reportId != null;

  // "reporter_id" field.
  DocumentReference? _reporterId;
  DocumentReference? get reporterId => _reporterId;
  bool hasReporterId() => _reporterId != null;

  // "report_type" field.
  String? _reportType;
  String get reportType => _reportType ?? '';
  bool hasReportType() => _reportType != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "ride_id" field.
  DocumentReference? _rideId;
  DocumentReference? get rideId => _rideId;
  bool hasRideId() => _rideId != null;

  // "subject_user_id" field.
  DocumentReference? _subjectUserId;
  DocumentReference? get subjectUserId => _subjectUserId;
  bool hasSubjectUserId() => _subjectUserId != null;

  // "admin_notes" field.
  String? _adminNotes;
  String get adminNotes => _adminNotes ?? '';
  bool hasAdminNotes() => _adminNotes != null;

  void _initializeFields() {
    _reportId = snapshotData['report_id'] as String?;
    _reporterId = snapshotData['reporter_id'] as DocumentReference?;
    _reportType = snapshotData['report_type'] as String?;
    _description = snapshotData['description'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
    _status = snapshotData['status'] as String?;
    _rideId = snapshotData['ride_id'] as DocumentReference?;
    _subjectUserId = snapshotData['subject_user_id'] as DocumentReference?;
    _adminNotes = snapshotData['admin_notes'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('reports');

  static Stream<ReportsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ReportsRecord.fromSnapshot(s));

  static Future<ReportsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ReportsRecord.fromSnapshot(s));

  static ReportsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ReportsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ReportsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ReportsRecord._(reference, mapFromFirestore(data));

  static ReportsRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      ReportsRecord.getDocumentFromData(
        {
          'report_id': snapshot.data['report_id'],
          'reporter_id': convertAlgoliaParam(
            snapshot.data['reporter_id'],
            ParamType.DocumentReference,
            false,
          ),
          'report_type': snapshot.data['report_type'],
          'description': snapshot.data['description'],
          'timestamp': convertAlgoliaParam(
            snapshot.data['timestamp'],
            ParamType.DateTime,
            false,
          ),
          'status': snapshot.data['status'],
          'ride_id': convertAlgoliaParam(
            snapshot.data['ride_id'],
            ParamType.DocumentReference,
            false,
          ),
          'subject_user_id': convertAlgoliaParam(
            snapshot.data['subject_user_id'],
            ParamType.DocumentReference,
            false,
          ),
          'admin_notes': snapshot.data['admin_notes'],
        },
        ReportsRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<ReportsRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'reports',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'ReportsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ReportsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createReportsRecordData({
  String? reportId,
  DocumentReference? reporterId,
  String? reportType,
  String? description,
  DateTime? timestamp,
  String? status,
  DocumentReference? rideId,
  DocumentReference? subjectUserId,
  String? adminNotes,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'report_id': reportId,
      'reporter_id': reporterId,
      'report_type': reportType,
      'description': description,
      'timestamp': timestamp,
      'status': status,
      'ride_id': rideId,
      'subject_user_id': subjectUserId,
      'admin_notes': adminNotes,
    }.withoutNulls,
  );

  return firestoreData;
}

class ReportsRecordDocumentEquality implements Equality<ReportsRecord> {
  const ReportsRecordDocumentEquality();

  @override
  bool equals(ReportsRecord? e1, ReportsRecord? e2) {
    return e1?.reportId == e2?.reportId &&
        e1?.reporterId == e2?.reporterId &&
        e1?.reportType == e2?.reportType &&
        e1?.description == e2?.description &&
        e1?.timestamp == e2?.timestamp &&
        e1?.status == e2?.status &&
        e1?.rideId == e2?.rideId &&
        e1?.subjectUserId == e2?.subjectUserId &&
        e1?.adminNotes == e2?.adminNotes;
  }

  @override
  int hash(ReportsRecord? e) => const ListEquality().hash([
        e?.reportId,
        e?.reporterId,
        e?.reportType,
        e?.description,
        e?.timestamp,
        e?.status,
        e?.rideId,
        e?.subjectUserId,
        e?.adminNotes
      ]);

  @override
  bool isValidKey(Object? o) => o is ReportsRecord;
}
