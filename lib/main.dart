import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Line through points game',
      home: Level(
        level: 1,
        points: [
          Point(1, 2),
          Point(2, 3),
          Point(3, 4),
        ],
      ),
    );
  }
}

class Level extends StatelessWidget {
  final int level;
  final List<Point> points;

  const Level({
    Key key,
    this.level,
    this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level ${level}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PointsTable(
              points: this.points,
            ),
          ),
          FunctionField(),
        ],
      ),
    );
  }
}

class PointsTable extends StatelessWidget {
  final List<Point> points;

  const PointsTable({
    Key key,
    this.points,
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
        rows: points
            .map(
              (p) => DataRow(cells: [
                DataCell(Text('${p.x}')),
                DataCell(Text('${p.y}')),
                DataCell(Text('-')),
              ]),
            )
            .toList(),
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
