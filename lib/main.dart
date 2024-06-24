// main.dart
// ignore_for_file: library_private_types_in_public_api
import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'pg2.dart';

void main() {
  // ignore: prefer_const_constructors

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

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
          backgroundColor: Colors
              .blue, //sep color scheme for appbar cuz it likes to disappear in dark mode
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
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomePage({
    super.key,

    // initialize variables for daRk mode
    required this.isDarkMode,
    required this.onThemeChanged,
  });

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? selectedCollege;
  List<dynamic> collegename = [];
  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // foregroundColor: Theme.of(context).colorScheme.onPrimary,
        // backgroundColor: Theme.of(context).primaryColor,
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
              items: <String>[
                'College A',
                'College B',
                'College C'
              ] //placeholder values
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(
              height: 20,
            ), //empty box for spacing betw dropdown and button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          NewPage('$selectedCollege')), //routing to new page
                );
              },
              child: const Text('Go to New Page'),
            ),
          ],
        ),
      ),
    );
  }

  void fetchdata() async {
    final uri = Uri.parse(
        'https://script.google.com/macros/s/AKfycbyapoLwVQB-qG8-57L72z3zE6Hl8RS6Sx8vSef3Ua_cGf0hOb4OKu7j9y8T86VKesiwrw/exec');
    final response = await http.get(uri);
    final json = convert.jsonDecode(response.body);

    var tempcollegelist = [];
    for (var i = 0; i < json.length - 1; i++) {
      if (tempcollegelist.contains(json[i]['college']) == false) {
        tempcollegelist += [json[i]['college']];
      }
    }
    print(tempcollegelist);
    setState(() {
      collegename = tempcollegelist;
    });
  }
}
