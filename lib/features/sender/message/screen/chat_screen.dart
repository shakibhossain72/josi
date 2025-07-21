import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/style/global_text_style.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/features/sender/message/controller/message_controller.dart';
import 'package:josi/features/sender/message/model/message_model.dart';
import 'package:josi/features/sender/message/screen/call_screen.dart';

class ChatScreen extends StatelessWidget {
  final User user;
  final ChatController controller = Get.put(ChatController());
  final TextEditingController textController = TextEditingController();

  ChatScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    controller.initChat(user);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Image.network(
                  user.avatarUrl,
                  fit: BoxFit.cover,
                  width: 50,
                  height: 50,
                ),
              ),
            ),

            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: globalTextStyle(
                    color: AppColors.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (user.isOnline)
                  Text(
                    'Online',
                    style: globalTextStyle(color: Colors.green, fontSize: 12),
                  ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.call, color: AppColors.primary),
            onPressed: () {
              Get.to(() => CallScreen(user: user));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: Obx(() {
              if (controller.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }

              return ListView.builder(
                padding: EdgeInsets.all(16),
                itemCount: controller.messages.length,
                itemBuilder: (context, index) {
                  final message = controller.messages[index];
                  return MessageBubble(message: message);
                },
              );
            }),
          ),

          // Message Input
          Container(
            padding: EdgeInsets.all(18),
            // color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.image, color: Colors.grey[600]),
                  onPressed: () {},
                ),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        hintText: 'Write your message...',
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle: globalTextStyle(
                          color: AppColors.textSecondary,
                          fontSize: 14,
                        ),
                      ),
                      onChanged: (value) {
                        controller.messageText.value = value;
                      },
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    icon: Icon(Icons.send, color: Colors.white),
                    onPressed: () {
                      controller.sendMessage(textController.text);
                      textController.clear();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Message Bubble Widget
class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: message.isMe
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        children: [
          if (!message.isMe)
            Container(
              width: 30,
              height: 30,
              margin: EdgeInsets.only(right: 8, bottom: 20),
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Center(
                child: ClipOval(
                  child: Image.network(
                    controller.currentUser.avatarUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          Flexible(
            child: Column(
              crossAxisAlignment: message.isMe
                  ? CrossAxisAlignment.end
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: message.isMe ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    message.content,
                    style: globalTextStyle(
                      color: message.isMe
                          ? Colors.white
                          : AppColors.textPrimary,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      controller.formatMessageTime(message.timestamp),
                      style: globalTextStyle(
                        fontSize: 12,
                        color: AppColors.textSecondary,
                      ),
                    ),
                    if (message.isMe) ...[
                      SizedBox(width: 4),
                      Text(
                        message.isRead ? 'Read' : '',
                        style: globalTextStyle(
                          fontSize: 12,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
