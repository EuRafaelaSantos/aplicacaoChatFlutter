import 'package:chat/components/message_bubble.dart';
import 'package:chat/core/models/chat_message.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/chat/chat_service.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = AuthService().currentUser;
    return StreamBuilder<List<ChatMessage>>(
      stream: ChatService().messagesStream(),
      builder: (cxt, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: RefreshProgressIndicator(),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text('Sem mensagens ainda!'),
          );
        } else {
          final msg = snapshot.data!;
          return ListView.builder(
            reverse: true,
            itemCount: msg.length,
            itemBuilder: (cxt, i) => MessageBubble(
                key: ValueKey(msg[i].id),
                message: msg[i],
                belongsToMe: currentUser?.id == msg[i].userId),
          );
        }
      },
    );
  }
}
