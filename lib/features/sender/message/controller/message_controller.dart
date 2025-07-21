import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:josi/features/sender/message/model/message_model.dart';

class MessageController extends GetxController {
  var conversations = <Conversation>[].obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadConversations();
  }

  void loadConversations() {
    isLoading.value = true;

    // Mock data
    final mockUsers = [
      User(
        id: '1',
        name: 'Wade Warren',
        avatarUrl: 'https://randomuser.me/api/portraits/men/75.jpg',
      ),
      User(
        id: '2',
        name: 'Luca Romano',
        avatarUrl: 'https://randomuser.me/api/portraits/men/76.jpg',
      ),
      User(
        id: '3',
        name: 'David Smith',
        avatarUrl: 'https://randomuser.me/api/portraits/men/77.jpg',
      ),
      User(
        id: '4',
        name: 'Carlos Gomez',
        avatarUrl: 'https://randomuser.me/api/portraits/men/78.jpg',
      ),
      User(
        id: '5',
        name: 'Jahid Hossain',
        avatarUrl: 'https://randomuser.me/api/portraits/men/78.jpg',
      ),
      User(
        id: '6',
        name: 'Rashidul Islam',
        avatarUrl: 'https://randomuser.me/api/portraits/men/78.jpg',
      ),
    ];

    final mockConversations = [
      Conversation(
        id: '1',
        user: mockUsers[0],
        lastMessage: Message(
          id: '1',
          senderId: '1',
          content: 'It is a long established fact that...',
          timestamp: DateTime.now().subtract(Duration(hours: 2, minutes: 30)),
        ),
        unreadCount: 0,
      ),
      Conversation(
        id: '2',
        user: mockUsers[1],
        lastMessage: Message(
          id: '2',
          senderId: '2',
          content: 'It is a long established fact',
          timestamp: DateTime.now().subtract(Duration(hours: 16)),
        ),
        unreadCount: 3,
      ),
      Conversation(
        id: '3',
        user: mockUsers[2],
        lastMessage: Message(
          id: '3',
          senderId: '3',
          content: 'It is a long established fact that...',
          timestamp: DateTime.now().subtract(Duration(hours: 13, minutes: 30)),
        ),
        unreadCount: 0,
      ),
      Conversation(
        id: '4',
        user: mockUsers[3],
        lastMessage: Message(
          id: '4',
          senderId: '4',
          content: 'It is a long established fact',
          timestamp: DateTime.now().subtract(Duration(hours: 7)),
        ),
        unreadCount: 4,
      ),
    ];

    conversations.value = mockConversations;
    isLoading.value = false;
  }

  String formatTime(DateTime dateTime) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inDays > 0) {
      return DateFormat('MMM dd').format(dateTime);
    } else if (difference.inHours > 0) {
      return DateFormat('h:mm a').format(dateTime);
    } else {
      return DateFormat('h:mm a').format(dateTime);
    }
  }
}

class ChatController extends GetxController {
  var messages = <Message>[].obs;
  var isLoading = false.obs;
  var messageText = ''.obs;
  late User currentUser;

  void initChat(User user) {
    currentUser = user;
    loadMessages();
  }

  void loadMessages() {
    isLoading.value = true;

    // Mock chat messages for Wade Warren
    final mockMessages = [
      Message(
        id: '1',
        senderId: currentUser.id,
        content:
            'Hi Emily! I saw your request for a guide in Peru between May 12-14. I\'m available those dates 😊',
        timestamp: DateTime.now().subtract(Duration(hours: 2)),
        isMe: false,
      ),
      Message(
        id: '2',
        senderId: 'me',
        content:
            'Hi Carlos! That\'s perfect. I\'ve heard great things about you. Can you help with transport from Cusco?',
        timestamp: DateTime.now().subtract(Duration(hours: 1, minutes: 50)),
        isMe: true,
        isRead: true,
      ),
      Message(
        id: '3',
        senderId: currentUser.id,
        content:
            'Absolutely! I\'ll arrange pickup from your hotel in Cusco and take you to the hike base camp.',
        timestamp: DateTime.now().subtract(Duration(hours: 1, minutes: 50)),
        isMe: false,
      ),
      Message(
        id: '4',
        senderId: 'me',
        content:
            'Hi Fatima! A full-day tour sounds great. Can we include the souk and a sunset camel ride?',
        timestamp: DateTime.now().subtract(Duration(hours: 1, minutes: 50)),
        isMe: true,
        isRead: true,
      ),
      Message(
        id: '5',
        senderId: currentUser.id,
        content: 'Of course!',
        timestamp: DateTime.now().subtract(Duration(hours: 1, minutes: 49)),
        isMe: false,
      ),
    ];

    messages.value = mockMessages;
    isLoading.value = false;
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    final message = Message(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'me',
      content: text,
      timestamp: DateTime.now(),
      isMe: true,
    );

    messages.add(message);
    messageText.value = '';
  }

  String formatMessageTime(DateTime dateTime) {
    return DateFormat('HH:mm').format(dateTime);
  }
}
