import 'package:chat/components/messages.dart';
import 'package:chat/components/new_message.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:chat/core/services/notification/chat_notification_service.dart';
import 'package:chat/pages/notification_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Text('Chat Flutter'),
        actions: [
          DropdownButtonHideUnderline(
            child: DropdownButton(
              items: [
                DropdownMenuItem(
                  value: 'logout',
                  child: Container(
                    child: Row(
                      children: [
                        Icon(Icons.exit_to_app),
                        SizedBox(
                          width: 10,
                        ),
                        Text('Sair')
                      ],
                    ),
                  ),
                )
              ],
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              onChanged: (String? value) {
                if (value == 'logout') {
                  AuthService().logout();
                }
              },
            ),
          ),
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return NotificationPage();
                  }));
                },
                icon: Icon(Icons.notifications),
              ),
              Positioned(
                  top: 5,
                  right: 5,
                  child: CircleAvatar(
                    maxRadius: 8,
                    backgroundColor: Colors.red.shade800,
                    child: Text(
                      '${Provider.of<ChatNotificationService>(context).itemsCount}',
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  )),
            ],
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
