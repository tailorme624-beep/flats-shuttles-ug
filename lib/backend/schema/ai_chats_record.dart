import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AiChatsRecord extends FirestoreRecord {
  AiChatsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chat_id" field.
  String? _chatId;
  String get chatId => _chatId ?? '';
  bool hasChatId() => _chatId != null;

  // "user_ref" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "last_active" field.
  DateTime? _lastActive;
  DateTime? get lastActive => _lastActive;
  bool hasLastActive() => _lastActive != null;

  // "summary" field.
  String? _summary;
  String get summary => _summary ?? '';
  bool hasSummary() => _summary != null;

  // "assistant_persona" field.
  String? _assistantPersona;
  String get assistantPersona => _assistantPersona ?? '';
  bool hasAssistantPersona() => _assistantPersona != null;

  // "messages" field.
  MessagesStruct? _messages;
  MessagesStruct get messages => _messages ?? MessagesStruct();
  bool hasMessages() => _messages != null;

  void _initializeFields() {
    _chatId = snapshotData['chat_id'] as String?;
    _userRef = snapshotData['user_ref'] as DocumentReference?;
    _lastActive = snapshotData['last_active'] as DateTime?;
    _summary = snapshotData['summary'] as String?;
    _assistantPersona = snapshotData['assistant_persona'] as String?;
    _messages = snapshotData['messages'] is MessagesStruct
        ? snapshotData['messages']
        : MessagesStruct.maybeFromMap(snapshotData['messages']);
  }

  static CollectionReference get collection => FirebaseFirestore.instanceFor(
          app: Firebase.app(), databaseId: 'flatsshuttles-gr3bc7')
      .collection('ai_chats');

  static Stream<AiChatsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AiChatsRecord.fromSnapshot(s));

  static Future<AiChatsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AiChatsRecord.fromSnapshot(s));

  static AiChatsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AiChatsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AiChatsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AiChatsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AiChatsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AiChatsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAiChatsRecordData({
  String? chatId,
  DocumentReference? userRef,
  DateTime? lastActive,
  String? summary,
  String? assistantPersona,
  MessagesStruct? messages,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chat_id': chatId,
      'user_ref': userRef,
      'last_active': lastActive,
      'summary': summary,
      'assistant_persona': assistantPersona,
      'messages': MessagesStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "messages" field.
  addMessagesStructData(firestoreData, messages, 'messages');

  return firestoreData;
}

class AiChatsRecordDocumentEquality implements Equality<AiChatsRecord> {
  const AiChatsRecordDocumentEquality();

  @override
  bool equals(AiChatsRecord? e1, AiChatsRecord? e2) {
    return e1?.chatId == e2?.chatId &&
        e1?.userRef == e2?.userRef &&
        e1?.lastActive == e2?.lastActive &&
        e1?.summary == e2?.summary &&
        e1?.assistantPersona == e2?.assistantPersona &&
        e1?.messages == e2?.messages;
  }

  @override
  int hash(AiChatsRecord? e) => const ListEquality().hash([
        e?.chatId,
        e?.userRef,
        e?.lastActive,
        e?.summary,
        e?.assistantPersona,
        e?.messages
      ]);

  @override
  bool isValidKey(Object? o) => o is AiChatsRecord;
}
