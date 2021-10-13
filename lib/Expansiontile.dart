import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansionTileDemo extends StatelessWidget {
  const ExpansionTileDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Expansion TileDemo'),
        centerTitle: true,
        elevation: 20.0,
        backgroundColor: Color(0xff334257),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) =>
            EntryItem(data[index]),
      ),
    );
  }
}

class ExpansionData {
  final String title;
  final List<ExpansionData> dataList;

  ExpansionData(this.title, [this.dataList = const <ExpansionData>[]]);
}

final List<ExpansionData> data = <ExpansionData>[
  ExpansionData(
    'Chapter A',
    <ExpansionData>[
      ExpansionData(
        'Section A0',
        <ExpansionData>[
          ExpansionData('Item A0.1'),
          ExpansionData('Item A0.2'),
          ExpansionData('Item A0.3'),
        ],
      ),
      ExpansionData('Section A1'),
      ExpansionData('Section A2'),
    ],
  ),
  ExpansionData(
    'Section B',
    <ExpansionData>[
      ExpansionData(
        'Section B0',
        <ExpansionData>[
          ExpansionData("Section B0.1"),
          ExpansionData("Section B0.2"),
          ExpansionData("Section B0.3"),
        ],
      ),
      ExpansionData('Section B1'),
      ExpansionData('Section B2'),
    ],
  ),
  ExpansionData(
    'Section C',
    <ExpansionData>[
      ExpansionData(
        'Section C1',
        <ExpansionData>[
          ExpansionData("Section C0.1"),
          ExpansionData("Section C0.2"),
          ExpansionData("Section C0.3"),
          ExpansionData("Section C0.4"),
        ],
      ),
      ExpansionData('Section C1'),
      ExpansionData('Section C2'),
      ExpansionData('Section C3'),
    ],
  ),
];

class EntryItem extends StatelessWidget {
  final ExpansionData entry;
  const EntryItem(this.entry);

  Widget _buildTiles(ExpansionData Entry) {
    if (Entry.dataList.isEmpty) {
      return ListTile(

        tileColor: Color(0xff343A40),
        title: Text(
          Entry.title,
          style: TextStyle(color: Color(0xffFAEBE0)),
        ),
      );
    }
    return ExpansionTile(
      collapsedIconColor: Color(0xffFAEBE0),
      iconColor: Color(0xffFAEBE0),
      key: PageStorageKey<ExpansionData>(Entry),
      title: Text(
        Entry.title,
        style: TextStyle(color: Color(0xffFAEBE0)),
      ),
      children: Entry.dataList.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
