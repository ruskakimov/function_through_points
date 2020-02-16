import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Graphing playground',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Function of points'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(child: PointsTable()),
            FunctionField(),
          ],
        ),
      ),
    );
  }
}

class PointsTable extends StatelessWidget {
  const PointsTable({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: [
          DataColumn(label: Text('x')),
          DataColumn(label: Text('y')),
          DataColumn(label: Text('Your y')),
        ],
        rows: List.generate(
          20,
          (i) => DataRow(cells: [
            DataCell(Text('$i')),
            DataCell(Text('${i * i}')),
            DataCell(Text('-')),
          ]),
        ),
      ),
    );
  }
}

class FunctionField extends StatelessWidget {
  const FunctionField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Text('y = '),
          Expanded(
            child: TextField(
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
