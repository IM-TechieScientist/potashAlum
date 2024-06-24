import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewPage extends StatefulWidget {
  final String colgname;
  NewPage(this.colgname);

  @override
  State<NewPage> createState() => _NewPageState(this.colgname);
}

class _NewPageState extends State<NewPage> {
  String colgname;
  List<dynamic> namelist = [];
  List<dynamic> emaillist = [];
  List<dynamic> linkedinlist = [];
  List<dynamic> yearlist = [];
  List<dynamic> collegelist = [];
  _NewPageState(this.colgname);
  @override
  void initState() {
    fetchdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          colgname,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: namelist.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.fromLTRB(500, 10, 500, 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20))),
                tileColor: Colors.purple,
                titleAlignment: ListTileTitleAlignment.center,
                title: Text(
                  namelist[index],
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                subtitle: Text(
                    emaillist[index] +
                        '\n' +
                        linkedinlist[index] +
                        '\n' +
                        collegelist[index],
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                trailing: Text(yearlist[index].toString(),
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
            );
          }),
    );
  }

  void fetchdata() async {
    final uri = Uri.parse(
        'https://script.google.com/macros/s/AKfycbyapoLwVQB-qG8-57L72z3zE6Hl8RS6Sx8vSef3Ua_cGf0hOb4OKu7j9y8T86VKesiwrw/exec');
    final response = await http.get(uri);
    final json = convert.jsonDecode(response.body);
    var names = [];
    var emails = [];
    var linkedin = [];
    var year = [];
    var college = [];
    print(json);
    for (var i = 0; i < json.length - 1; i++) {
      names += [json[i]['name']];
      emails += [json[i]['email']];
      linkedin += [json[i]['linked_in']];
      year += [json[i]['year']];
      college += [json[i]['college']];
    }
    setState(() {
      namelist = names;
      emaillist = emails;
      linkedinlist = linkedin;
      yearlist = year;
      collegelist = college;
    });
  }
}
