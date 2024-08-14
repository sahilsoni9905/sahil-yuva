import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Sticky Center Columns')),
        body: Center(
          child: MyTable(),
        ),
      ),
    );
  }
}

class MyTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              _buildColumn(['Header 1', 'Row 1', 'Row 2', 'Row 3']),
              _buildColumn(['Header 2', 'Data 1', 'Data 2', 'Data 3']),
              SizedBox(width: 200), // Placeholder for fixed columns
              _buildColumn(['Header 5', 'Data 4', 'Data 5', 'Data 6']),
              _buildColumn(['Header 6', 'Data 7', 'Data 8', 'Data 9']),
            ],
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 -
              100, // Adjust to center fixed columns
          child: Container(
            width: 200, // Width of fixed columns
            color:
                Colors.white, // Background color to cover the scrolling columns
            child: Row(
              children: [
                _buildColumn(['Header 3', 'Data 2', 'Data 2', 'Data 2']),
                _buildColumn(['Header 4', 'Data 3', 'Data 3', 'Data 3']),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildColumn(List<String> cells) {
    return Column(
      children: cells.map((cell) {
        return Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          width: 100,
          child: Text(cell),
        );
      }).toList(),
    );
  }
}
