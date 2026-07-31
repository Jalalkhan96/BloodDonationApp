// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
  return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {
  String get chatId => throw _privateConstructorUsedError;
  List<String> get participantIds => throw _privateConstructorUsedError;
  String? get requestId => throw _privateConstructorUsedError;
  String? get lastMessage => throw _privateConstructorUsedError;
  String? get lastMessageSenderId => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get lastMessageAt => throw _privateConstructorUsedError;
  bool get lastMessageRead => throw _privateConstructorUsedError;
  int get unreadCount => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ChatModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatModelCopyWith<ChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatModelCopyWith<$Res> {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) =
      _$ChatModelCopyWithImpl<$Res, ChatModel>;
  @useResult
  $Res call({
    String chatId,
    List<String> participantIds,
    String? requestId,
    String? lastMessage,
    String? lastMessageSenderId,
    @TimestampConverter() Timestamp? lastMessageAt,
    bool lastMessageRead,
    int unreadCount,
    bool isActive,
    @TimestampConverter() Timestamp? createdAt,
  });
}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res, $Val extends ChatModel>
    implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? participantIds = null,
    Object? requestId = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageSenderId = freezed,
    Object? lastMessageAt = freezed,
    Object? lastMessageRead = null,
    Object? unreadCount = null,
    Object? isActive = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            chatId: null == chatId
                ? _value.chatId
                : chatId // ignore: cast_nullable_to_non_nullable
                      as String,
            participantIds: null == participantIds
                ? _value.participantIds
                : participantIds // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            requestId: freezed == requestId
                ? _value.requestId
                : requestId // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastMessage: freezed == lastMessage
                ? _value.lastMessage
                : lastMessage // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastMessageSenderId: freezed == lastMessageSenderId
                ? _value.lastMessageSenderId
                : lastMessageSenderId // ignore: cast_nullable_to_non_nullable
                      as String?,
            lastMessageAt: freezed == lastMessageAt
                ? _value.lastMessageAt
                : lastMessageAt // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
            lastMessageRead: null == lastMessageRead
                ? _value.lastMessageRead
                : lastMessageRead // ignore: cast_nullable_to_non_nullable
                      as bool,
            unreadCount: null == unreadCount
                ? _value.unreadCount
                : unreadCount // ignore: cast_nullable_to_non_nullable
                      as int,
            isActive: null == isActive
                ? _value.isActive
                : isActive // ignore: cast_nullable_to_non_nullable
                      as bool,
            createdAt: freezed == createdAt
                ? _value.createdAt
                : createdAt // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ChatModelImplCopyWith<$Res>
    implements $ChatModelCopyWith<$Res> {
  factory _$$ChatModelImplCopyWith(
    _$ChatModelImpl value,
    $Res Function(_$ChatModelImpl) then,
  ) = __$$ChatModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String chatId,
    List<String> participantIds,
    String? requestId,
    String? lastMessage,
    String? lastMessageSenderId,
    @TimestampConverter() Timestamp? lastMessageAt,
    bool lastMessageRead,
    int unreadCount,
    bool isActive,
    @TimestampConverter() Timestamp? createdAt,
  });
}

/// @nodoc
class __$$ChatModelImplCopyWithImpl<$Res>
    extends _$ChatModelCopyWithImpl<$Res, _$ChatModelImpl>
    implements _$$ChatModelImplCopyWith<$Res> {
  __$$ChatModelImplCopyWithImpl(
    _$ChatModelImpl _value,
    $Res Function(_$ChatModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatId = null,
    Object? participantIds = null,
    Object? requestId = freezed,
    Object? lastMessage = freezed,
    Object? lastMessageSenderId = freezed,
    Object? lastMessageAt = freezed,
    Object? lastMessageRead = null,
    Object? unreadCount = null,
    Object? isActive = null,
    Object? createdAt = freezed,
  }) {
    return _then(
      _$ChatModelImpl(
        chatId: null == chatId
            ? _value.chatId
            : chatId // ignore: cast_nullable_to_non_nullable
                  as String,
        participantIds: null == participantIds
            ? _value._participantIds
            : participantIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        requestId: freezed == requestId
            ? _value.requestId
            : requestId // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastMessage: freezed == lastMessage
            ? _value.lastMessage
            : lastMessage // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastMessageSenderId: freezed == lastMessageSenderId
            ? _value.lastMessageSenderId
            : lastMessageSenderId // ignore: cast_nullable_to_non_nullable
                  as String?,
        lastMessageAt: freezed == lastMessageAt
            ? _value.lastMessageAt
            : lastMessageAt // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
        lastMessageRead: null == lastMessageRead
            ? _value.lastMessageRead
            : lastMessageRead // ignore: cast_nullable_to_non_nullable
                  as bool,
        unreadCount: null == unreadCount
            ? _value.unreadCount
            : unreadCount // ignore: cast_nullable_to_non_nullable
                  as int,
        isActive: null == isActive
            ? _value.isActive
            : isActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        createdAt: freezed == createdAt
            ? _value.createdAt
            : createdAt // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatModelImpl implements _ChatModel {
  const _$ChatModelImpl({
    required this.chatId,
    required final List<String> participantIds,
    this.requestId,
    this.lastMessage,
    this.lastMessageSenderId,
    @TimestampConverter() this.lastMessageAt,
    this.lastMessageRead = false,
    this.unreadCount = 0,
    this.isActive = true,
    @TimestampConverter() this.createdAt,
  }) : _participantIds = participantIds;

  factory _$ChatModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatModelImplFromJson(json);

  @override
  final String chatId;
  final List<String> _participantIds;
  @override
  List<String> get participantIds {
    if (_participantIds is EqualUnmodifiableListView) return _participantIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_participantIds);
  }

  @override
  final String? requestId;
  @override
  final String? lastMessage;
  @override
  final String? lastMessageSenderId;
  @override
  @TimestampConverter()
  final Timestamp? lastMessageAt;
  @override
  @JsonKey()
  final bool lastMessageRead;
  @override
  @JsonKey()
  final int unreadCount;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @TimestampConverter()
  final Timestamp? createdAt;

  @override
  String toString() {
    return 'ChatModel(chatId: $chatId, participantIds: $participantIds, requestId: $requestId, lastMessage: $lastMessage, lastMessageSenderId: $lastMessageSenderId, lastMessageAt: $lastMessageAt, lastMessageRead: $lastMessageRead, unreadCount: $unreadCount, isActive: $isActive, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatModelImpl &&
            (identical(other.chatId, chatId) || other.chatId == chatId) &&
            const DeepCollectionEquality().equals(
              other._participantIds,
              _participantIds,
            ) &&
            (identical(other.requestId, requestId) ||
                other.requestId == requestId) &&
            (identical(other.lastMessage, lastMessage) ||
                other.lastMessage == lastMessage) &&
            (identical(other.lastMessageSenderId, lastMessageSenderId) ||
                other.lastMessageSenderId == lastMessageSenderId) &&
            (identical(other.lastMessageAt, lastMessageAt) ||
                other.lastMessageAt == lastMessageAt) &&
            (identical(other.lastMessageRead, lastMessageRead) ||
                other.lastMessageRead == lastMessageRead) &&
            (identical(other.unreadCount, unreadCount) ||
                other.unreadCount == unreadCount) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    chatId,
    const DeepCollectionEquality().hash(_participantIds),
    requestId,
    lastMessage,
    lastMessageSenderId,
    lastMessageAt,
    lastMessageRead,
    unreadCount,
    isActive,
    createdAt,
  );

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      __$$ChatModelImplCopyWithImpl<_$ChatModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatModelImplToJson(this);
  }
}

abstract class _ChatModel implements ChatModel {
  const factory _ChatModel({
    required final String chatId,
    required final List<String> participantIds,
    final String? requestId,
    final String? lastMessage,
    final String? lastMessageSenderId,
    @TimestampConverter() final Timestamp? lastMessageAt,
    final bool lastMessageRead,
    final int unreadCount,
    final bool isActive,
    @TimestampConverter() final Timestamp? createdAt,
  }) = _$ChatModelImpl;

  factory _ChatModel.fromJson(Map<String, dynamic> json) =
      _$ChatModelImpl.fromJson;

  @override
  String get chatId;
  @override
  List<String> get participantIds;
  @override
  String? get requestId;
  @override
  String? get lastMessage;
  @override
  String? get lastMessageSenderId;
  @override
  @TimestampConverter()
  Timestamp? get lastMessageAt;
  @override
  bool get lastMessageRead;
  @override
  int get unreadCount;
  @override
  bool get isActive;
  @override
  @TimestampConverter()
  Timestamp? get createdAt;

  /// Create a copy of ChatModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  String get messageId => throw _privateConstructorUsedError;
  String get senderId => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint? get location => throw _privateConstructorUsedError;
  List<String> get readBy => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp? get sentAt => throw _privateConstructorUsedError;

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
    MessageModel value,
    $Res Function(MessageModel) then,
  ) = _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call({
    String messageId,
    String senderId,
    String? text,
    String? imageUrl,
    @GeoPointConverter() GeoPoint? location,
    List<String> readBy,
    @TimestampConverter() Timestamp? sentAt,
  });
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? senderId = null,
    Object? text = freezed,
    Object? imageUrl = freezed,
    Object? location = freezed,
    Object? readBy = null,
    Object? sentAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            messageId: null == messageId
                ? _value.messageId
                : messageId // ignore: cast_nullable_to_non_nullable
                      as String,
            senderId: null == senderId
                ? _value.senderId
                : senderId // ignore: cast_nullable_to_non_nullable
                      as String,
            text: freezed == text
                ? _value.text
                : text // ignore: cast_nullable_to_non_nullable
                      as String?,
            imageUrl: freezed == imageUrl
                ? _value.imageUrl
                : imageUrl // ignore: cast_nullable_to_non_nullable
                      as String?,
            location: freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                      as GeoPoint?,
            readBy: null == readBy
                ? _value.readBy
                : readBy // ignore: cast_nullable_to_non_nullable
                      as List<String>,
            sentAt: freezed == sentAt
                ? _value.sentAt
                : sentAt // ignore: cast_nullable_to_non_nullable
                      as Timestamp?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MessageModelImplCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$MessageModelImplCopyWith(
    _$MessageModelImpl value,
    $Res Function(_$MessageModelImpl) then,
  ) = __$$MessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String messageId,
    String senderId,
    String? text,
    String? imageUrl,
    @GeoPointConverter() GeoPoint? location,
    List<String> readBy,
    @TimestampConverter() Timestamp? sentAt,
  });
}

/// @nodoc
class __$$MessageModelImplCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$MessageModelImpl>
    implements _$$MessageModelImplCopyWith<$Res> {
  __$$MessageModelImplCopyWithImpl(
    _$MessageModelImpl _value,
    $Res Function(_$MessageModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? messageId = null,
    Object? senderId = null,
    Object? text = freezed,
    Object? imageUrl = freezed,
    Object? location = freezed,
    Object? readBy = null,
    Object? sentAt = freezed,
  }) {
    return _then(
      _$MessageModelImpl(
        messageId: null == messageId
            ? _value.messageId
            : messageId // ignore: cast_nullable_to_non_nullable
                  as String,
        senderId: null == senderId
            ? _value.senderId
            : senderId // ignore: cast_nullable_to_non_nullable
                  as String,
        text: freezed == text
            ? _value.text
            : text // ignore: cast_nullable_to_non_nullable
                  as String?,
        imageUrl: freezed == imageUrl
            ? _value.imageUrl
            : imageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        location: freezed == location
            ? _value.location
            : location // ignore: cast_nullable_to_non_nullable
                  as GeoPoint?,
        readBy: null == readBy
            ? _value._readBy
            : readBy // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        sentAt: freezed == sentAt
            ? _value.sentAt
            : sentAt // ignore: cast_nullable_to_non_nullable
                  as Timestamp?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageModelImpl implements _MessageModel {
  const _$MessageModelImpl({
    required this.messageId,
    required this.senderId,
    this.text,
    this.imageUrl,
    @GeoPointConverter() this.location,
    final List<String> readBy = const [],
    @TimestampConverter() this.sentAt,
  }) : _readBy = readBy;

  factory _$MessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageModelImplFromJson(json);

  @override
  final String messageId;
  @override
  final String senderId;
  @override
  final String? text;
  @override
  final String? imageUrl;
  @override
  @GeoPointConverter()
  final GeoPoint? location;
  final List<String> _readBy;
  @override
  @JsonKey()
  List<String> get readBy {
    if (_readBy is EqualUnmodifiableListView) return _readBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_readBy);
  }

  @override
  @TimestampConverter()
  final Timestamp? sentAt;

  @override
  String toString() {
    return 'MessageModel(messageId: $messageId, senderId: $senderId, text: $text, imageUrl: $imageUrl, location: $location, readBy: $readBy, sentAt: $sentAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageModelImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.location, location) ||
                other.location == location) &&
            const DeepCollectionEquality().equals(other._readBy, _readBy) &&
            (identical(other.sentAt, sentAt) || other.sentAt == sentAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    messageId,
    senderId,
    text,
    imageUrl,
    location,
    const DeepCollectionEquality().hash(_readBy),
    sentAt,
  );

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      __$$MessageModelImplCopyWithImpl<_$MessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageModelImplToJson(this);
  }
}

abstract class _MessageModel implements MessageModel {
  const factory _MessageModel({
    required final String messageId,
    required final String senderId,
    final String? text,
    final String? imageUrl,
    @GeoPointConverter() final GeoPoint? location,
    final List<String> readBy,
    @TimestampConverter() final Timestamp? sentAt,
  }) = _$MessageModelImpl;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$MessageModelImpl.fromJson;

  @override
  String get messageId;
  @override
  String get senderId;
  @override
  String? get text;
  @override
  String? get imageUrl;
  @override
  @GeoPointConverter()
  GeoPoint? get location;
  @override
  List<String> get readBy;
  @override
  @TimestampConverter()
  Timestamp? get sentAt;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
