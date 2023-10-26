import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

class SelectLanguageScreen extends StatefulWidget {
  const SelectLanguageScreen({Key? key}) : super(key: key);

  @override
  State<SelectLanguageScreen> createState() => _SelectLanguageScreenState();
}

class _SelectLanguageScreenState extends State<SelectLanguageScreen> {
  List<Widget> columnChildren = [];
  int index=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Widget newChild = Text('New Child');
          Widget listile = ListTile(
            title: Text("English"),
          );
          Widget listile1 = ListTile(
            title: Text("Urdu"),
          );

          setState(() {
            columnChildren.add(newChild);
          });
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const LocaleText("Language"),
      ),
      body: Column(
        children: columnChildren,
      ),
    );
  }
}
