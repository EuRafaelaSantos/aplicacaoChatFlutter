import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RefreshProgressIndicator(),
            SizedBox(height: 10),
            Text(
              'Carregando...',
              style: TextStyle(
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}