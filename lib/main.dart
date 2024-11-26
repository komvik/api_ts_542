import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MainApp());
}

// ignore: must_be_immutable
class MainApp extends StatelessWidget {
  MainApp({super.key});
  String quoteData = "";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppScreen(),
    );
  }
}

Future<String> getQuote() async {
  final Uri uri = Uri.https('api.api-ninjas.com', '/v1/quotes');

  final http.Response response = await http.get(uri,
      headers: {'x-api-key': 'N3GBHnowDETYID/byVicqQ==Pzz67MSAYJwayc9Z'});

  if (response.statusCode == 200) {
    return response.body;
  }
  return "Fehler";
}

class AppScreen extends StatefulWidget {
  const AppScreen({
    super.key,
  });

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  String dataStr = " Ts 542";

  @override
  void initState() {
    super.initState();
    getFirstQuote();
  }

  void getFirstQuote() async {
    final String qData = await getQuote();
    final Map<String, dynamic> allData = jsonDecode(qData)[0];
    final String firstQuote = allData["quote"];
    log(firstQuote);

    setState(() {
      dataStr = firstQuote;
    });
  }

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
            ElevatedButton(
                onPressed: () {
                  getFirstQuote();
                },
                child: const Text(" ABFRAGE ")),
          ],
        ),
      ),
    );
  }
}
