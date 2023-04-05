import 'package:flutter/material.dart';

class HistoryScreen extends StatefulWidget {
  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  final List<String> _searchHistory = [
    'Pasta',
    'Pizza',
    'Salad',
    'Soup',
    'Steak',
    'Tacos',
  ];

  void _removeItem(int index) {
    setState(() {
      _searchHistory.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.brown[50],
        child: ListView.builder(
          itemCount: _searchHistory.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(8.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.search,
                    color: Colors.green[900],
                    size: 24.0,
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Text(
                      _searchHistory[index],
                      style: TextStyle(
                        color: Colors.green[900],
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      _removeItem(index);
                    },
                    child: Icon(
                      Icons.clear,
                      color: Colors.green[900],
                      size: 24.0,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
