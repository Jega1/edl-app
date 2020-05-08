import 'package:flutter/material.dart';

class DescriptionScreen extends StatefulWidget {
  @override
  _DescriptionScreenState createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  List<String> descriptions = ['Nature', 'Etat','Fonctinnement', 'dégradation', 'note','Photo'];


  @override

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Text('which part of description dynamic variable')
      ),
      body: ListView.builder(
          itemCount: descriptions.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {},
                title: Text(descriptions[index]),
              ),

            );
          }
          ),
    );

  }
}
