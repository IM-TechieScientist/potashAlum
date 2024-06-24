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
    var namelist = ['kaqwla', 'amala', 'kalaa'];
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
          itemCount: 3,
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
                subtitle: Text(colgname,
                    style: TextStyle(color: Colors.white, fontSize: 15)),
                trailing: Text('2020-24',
                    style: TextStyle(color: Colors.white, fontSize:15)),
              ),
            );
          }),
    );
  }
}
