import 'package:flutter/material.dart';

class NewPage extends StatefulWidget {
  final String colgname;
  NewPage(this.colgname);

  @override
  State<NewPage> createState() => _NewPageState(this.colgname);
}

class _NewPageState extends State<NewPage> {
  String colgname;
  _NewPageState(this.colgname);
  @override
  Widget build(BuildContext context) {
    var deftextstyle = TextStyle(fontSize: 30);
    var namelist = ['kaqwla', 'amala', 'kalaa'];
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'maala',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromARGB(255, 234, 85, 209), fontSize: 30),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          centerTitle: true,
        ),
        body: Container(
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black, style: BorderStyle.solid, width: 1.0),
          ),
          child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.fromLTRB(500, 10, 500, 10),
                  child: ListTile(
                    hoverColor: Colors.amber,
                    titleAlignment: ListTileTitleAlignment.center,
                    title: Text(namelist[index]),
                    subtitle: Text(colgname),
                    trailing: Text('2020-24'),
                  ),
                );
              }),
        ));
  }
}
