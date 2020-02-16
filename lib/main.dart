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
            DataTable(
              columns: [
                DataColumn(label: Text('x')),
                DataColumn(label: Text('y')),
                DataColumn(label: Text('Your y')),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('1')),
                  DataCell(Text('1')),
                  DataCell(Text('-')),
                ]),
                DataRow(cells: [
                  DataCell(Text('2')),
                  DataCell(Text('4')),
                  DataCell(Text('-')),
                ]),
                DataRow(cells: [
                  DataCell(Text('3')),
                  DataCell(Text('8')),
                  DataCell(Text('-')),
                ]),
              ],
            )
          ],
        ),
      ),
    );
  }
}
