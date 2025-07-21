// Models
class User {
  final String id;
  final String name;
  final String avatarUrl;
  final bool isOnline;

  User({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.isOnline = false,
  });
}

class Message {
  final String id;
  final String senderId;
  final String content;
  final DateTime timestamp;
  final bool isRead;
  final bool isMe;

  Message({
    required this.id,
    required this.senderId,
    required this.content,
    required this.timestamp,
    this.isRead = false,
    this.isMe = false,
  });
}

class Conversation {
  final String id;
  final User user;
  final Message lastMessage;
  final int unreadCount;

  Conversation({
    required this.id,
    required this.user,
    required this.lastMessage,
    this.unreadCount = 0,
  });
}
