import 'dart:math';
import 'package:math_expressions/math_expressions.dart';

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

class Level extends StatefulWidget {
  final int level;
  final List<Point> points;

  Level({
    Key key,
    this.level,
    this.points,
  }) : super(key: key);

  @override
  _LevelState createState() => _LevelState();
}

class _LevelState extends State<Level> {
  final _controller = TextEditingController();
  final _p = Parser();
  List<String> _calcY;

  @override
  void initState() {
    _controller.addListener(() {
      try {
        final exp = _p.parse(_controller.text);
        print(exp.simplify());
        setState(() {
          _calcY = widget.points.map((p) {
            final cm = ContextModel();
            cm.bindVariable(Variable('x'), Number(p.x));
            return exp.evaluate(EvaluationType.REAL, cm).toString();
          }).toList();
        });
      } catch (e) {
        print(e);
        setState(() {
          _calcY = null;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level ${widget.level}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: PointsTable(
              points: this.widget.points,
              calculated: _calcY,
            ),
          ),
          FunctionField(
            controller: _controller,
          ),
        ],
      ),
    );
  }
}

class PointsTable extends StatelessWidget {
  final List<Point> points;
  final List<String> calculated;

  const PointsTable({
    Key key,
    this.points,
    this.calculated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: [
          DataColumn(label: Text('x')),
          DataColumn(label: Text('y')),
          DataColumn(label: Text('Calculated')),
        ],
        rows: List.generate(
          points.length,
          (i) => DataRow(cells: [
            DataCell(Text('${points[i].x}')),
            DataCell(Text('${points[i].y}')),
            DataCell(Text(calculated != null ? '${calculated[i]}' : 'Error')),
          ]),
        ),
      ),
    );
  }
}

class FunctionField extends StatelessWidget {
  final TextEditingController controller;

  const FunctionField({
    Key key,
    this.controller,
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
              controller: controller,
              autocorrect: false,
              decoration: InputDecoration(border: OutlineInputBorder()),
            ),
          ),
        ],
      ),
    );
  }
}
