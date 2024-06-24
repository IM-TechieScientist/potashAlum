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
      body: LayoutBuilder(
        builder: (context, constraints) {
          double padding = constraints.maxWidth > 600 ? 500 : 16;
          double titleFontSize = constraints.maxWidth > 600 ? 20 : 16;
          double subtitleFontSize = constraints.maxWidth > 600 ? 15 : 12;
          double trailingFontSize = constraints.maxWidth > 600 ? 15 : 12;

          return Center(
            child: ListView.builder(
              itemCount: namelist.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: padding, vertical: 10),
                  child: Center(
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      tileColor: Colors.purple,
                      title: Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            namelist[index],
                            style: TextStyle(color: Colors.white, fontSize: titleFontSize),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      subtitle: Flexible(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            colgname,
                            style: TextStyle(color: Colors.white, fontSize: subtitleFontSize),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      trailing: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '2020-24',
                          style: TextStyle(color: Colors.white, fontSize: trailingFontSize),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
