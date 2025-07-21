import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:josi/core/style/global_text_style.dart';
import 'package:josi/core/utils/constants/app_colors.dart';
import 'package:josi/features/sender/message/controller/call_controller.dart';
import 'package:josi/features/sender/message/model/message_model.dart';

class CallScreen extends StatelessWidget {
  final User user;
  final CallController controller = Get.put(CallController());

  CallScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    controller.initCall(user);

    return Scaffold(
      backgroundColor: Color(0xFF2C2C2E),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => controller.endCall(),
                  ),
                  Expanded(
                    child: Text(
                      'Calling ...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(width: 40), // Balance the back button
                ],
              ),
            ),

            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // User Avatar
                  Container(
                    width: 180,
                    height: 180,
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                      child: ClipOval(
                        child: Image.network(
                          user.avatarUrl,
                          fit: BoxFit.cover,
                          width: 180,
                          height: 180,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 40),

                  // User Name
                  Text(
                    user.name,
                    style: globalTextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 8),

                  // Phone Number
                  Text(
                    '(+44) 50 9285 3022',
                    style: TextStyle(
                      color: Colors.white.withValues(alpha: 0.7),
                      fontSize: 16,
                    ),
                  ),

                  SizedBox(height: 40),

                  // Call Duration (shown after call starts)
                  Obx(
                    () => controller.callDuration.value > 0
                        ? Text(
                            controller.formatCallDuration(
                              controller.callDuration.value,
                            ),
                            style: TextStyle(
                              color: Colors.white.withValues(alpha: 0.8),
                              fontSize: 16,
                            ),
                          )
                        : SizedBox(),
                  ),
                ],
              ),
            ),

            // Call Controls
            Padding(
              padding: EdgeInsets.all(40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // End Call Button
                  GestureDetector(
                    onTap: () => controller.endCall(),
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.call_end,
                        color: Colors.white,
                        size: 35,
                      ),
                    ),
                  ),

                  // Answer Call Button (for incoming calls)
                  GestureDetector(
                    onTap: () {
                      // Handle answer call
                      controller.isCallActive.value = true;
                    },
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.call, color: Colors.white, size: 35),
                    ),
                  ),
                ],
              ),
            ),

            // Additional Controls (Mute, Speaker, etc.)
            Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Mute Button
                  Obx(
                    () => GestureDetector(
                      onTap: () => controller.toggleMute(),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: controller.isMuted.value
                              ? Colors.red.withValues(alpha: 0.8)
                              : Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          controller.isMuted.value ? Icons.mic_off : Icons.mic,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),

                  // Speaker Button
                  Obx(
                    () => GestureDetector(
                      onTap: () => controller.toggleSpeaker(),
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: controller.isSpeakerOn.value
                              ? AppColors.primary.withValues(alpha: 0.8)
                              : Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          controller.isSpeakerOn.value
                              ? Icons.volume_up
                              : Icons.volume_down,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    ),
                  ),

                  // Add Contact Button
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person_add,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
