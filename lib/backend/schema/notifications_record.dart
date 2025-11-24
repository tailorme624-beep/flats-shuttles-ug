import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificationsRecord extends FirestoreRecord {
  NotificationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "notification_id" field.
  String? _notificationId;
  String get notificationId => _notificationId ?? '';
  bool hasNotificationId() => _notificationId != null;

  // "recipient_ref" field.
  DocumentReference? _recipientRef;
  DocumentReference? get recipientRef => _recipientRef;
  bool hasRecipientRef() => _recipientRef != null;

  // "sender_ref" field.
  DocumentReference? _senderRef;
  DocumentReference? get senderRef => _senderRef;
  bool hasSenderRef() => _senderRef != null;

  // "sent_time" field.
  DateTime? _sentTime;
  DateTime? get sentTime => _sentTime;
  bool hasSentTime() => _sentTime != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "body" field.
  String? _body;
  String get body => _body ?? '';
  bool hasBody() => _body != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "is_read" field.
  bool? _isRead;
  bool get isRead => _isRead ?? false;
  bool hasIsRead() => _isRead != null;

  // "action_page" field.
  String? _actionPage;
  String get actionPage => _actionPage ?? '';
  bool hasActionPage() => _actionPage != null;

  void _initializeFields() {
    _notificationId = snapshotData['notification_id'] as String?;
    _recipientRef = snapshotData['recipient_ref'] as DocumentReference?;
    _senderRef = snapshotData['sender_ref'] as DocumentReference?;
    _sentTime = snapshotData['sent_time'] as DateTime?;
    _title = snapshotData['title'] as String?;
    _body = snapshotData['body'] as String?;
    _type = snapshotData['type'] as String?;
    _isRead = snapshotData['is_read'] as bool?;
    _actionPage = snapshotData['action_page'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notifications');

  static Stream<NotificationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificationsRecord.fromSnapshot(s));

  static Future<NotificationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificationsRecord.fromSnapshot(s));

  static NotificationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificationsRecordData({
  String? notificationId,
  DocumentReference? recipientRef,
  DocumentReference? senderRef,
  DateTime? sentTime,
  String? title,
  String? body,
  String? type,
  bool? isRead,
  String? actionPage,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'notification_id': notificationId,
      'recipient_ref': recipientRef,
      'sender_ref': senderRef,
      'sent_time': sentTime,
      'title': title,
      'body': body,
      'type': type,
      'is_read': isRead,
      'action_page': actionPage,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificationsRecordDocumentEquality
    implements Equality<NotificationsRecord> {
  const NotificationsRecordDocumentEquality();

  @override
  bool equals(NotificationsRecord? e1, NotificationsRecord? e2) {
    return e1?.notificationId == e2?.notificationId &&
        e1?.recipientRef == e2?.recipientRef &&
        e1?.senderRef == e2?.senderRef &&
        e1?.sentTime == e2?.sentTime &&
        e1?.title == e2?.title &&
        e1?.body == e2?.body &&
        e1?.type == e2?.type &&
        e1?.isRead == e2?.isRead &&
        e1?.actionPage == e2?.actionPage;
  }

  @override
  int hash(NotificationsRecord? e) => const ListEquality().hash([
        e?.notificationId,
        e?.recipientRef,
        e?.senderRef,
        e?.sentTime,
        e?.title,
        e?.body,
        e?.type,
        e?.isRead,
        e?.actionPage
      ]);

  @override
  bool isValidKey(Object? o) => o is NotificationsRecord;
}
