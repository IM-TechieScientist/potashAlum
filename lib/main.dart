// main.dart
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'pg2.dart';
import 'package:gsheets/gsheets.dart';

const _credentials = r'''

''';

const _spreadSheetId = "1SWKS3kx5Ap3HHncPh2mTtYmbVoks2yp08YcKXeLrXl4";

void main() async {
  final gsheets = GSheets(_credentials);
  final ss = await gsheets.spreadsheet(_spreadSheetId);
  var sheet = ss.worksheetByTitle("Sheet1");
  var listColg = await sheet!.values.column(2);
  runApp(MyApp(listColg: listColg));
}

class MyApp extends StatefulWidget {
  final List<String> listColg;

  const MyApp({Key? key, required this.listColg}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Potash Alum',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.blue,
        ),
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown,
        ),
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        isDarkMode: isDarkMode,
        onThemeChanged: (value) {
          setState(() {
            isDarkMode = value;
          });
        },
        listColg: widget.listColg,
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;
  final List<String> listColg;

  const HomePage({
    Key? key,
    required this.isDarkMode,
    required this.onThemeChanged,
    required this.listColg,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCollege;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Potash Alum Home'),
        actions: [
          Switch(
            value: widget.isDarkMode,
            onChanged: widget.onThemeChanged,
            activeColor: Colors.white,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton<String>(
              hint: const Text('Select a College'),
              value: selectedCollege,
              onChanged: (String? newValue) {
                setState(() {
                  selectedCollege = newValue;
                });
              },
              items: widget.listColg.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewPage('$selectedCollege')),
                );
              },
              child: const Text('Go to New Page'),
            ),
          ],
        ),
      ),
    );
  }
}
