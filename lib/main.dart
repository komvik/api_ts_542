import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppScreen(),
    );
  }
}

class AppScreen extends StatelessWidget {
  const AppScreen({
    super.key,
  });

  final String dataStr = " Ts 542";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ts 542"),
        titleTextStyle: const TextStyle(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.bold),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 320,
              child: Text(
                dataStr,
                style: const TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(onPressed: () {}, child: const Text(" ABFRAGE ")),
          ],
        ),
      ),
    );
  }
}
