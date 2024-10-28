import 'package:chat/components/messages.dart';
import 'package:chat/components/new_message.dart';
import 'package:chat/core/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          title: Text('Chat Flutter'),
          actions: [
            DropdownButton(
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
            )
          ],
        ),
        body: SafeArea(
            child: Column(
          children: [
            Expanded(child: Messages()),
            NewMessage(),
          ],
        )));
  }
}
