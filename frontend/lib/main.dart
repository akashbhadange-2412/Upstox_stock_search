import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StockSearchScreen(),
    );
  }
}

class StockSearchScreen extends StatefulWidget {
  @override
  _StockSearchScreenState createState() => _StockSearchScreenState();
}

class _StockSearchScreenState extends State<StockSearchScreen> {
  TextEditingController _controller = TextEditingController();
  List<dynamic> _results = [];

  void _searchStocks(String query) async {
    final response = await http.get(Uri.parse('http://localhost:3000/search?q=$query'));
    if (response.statusCode == 200) {
      setState(() {
        _results = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load stocks');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Stock Search')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Search Stocks'),
              onSubmitted: _searchStocks,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _results.length,
                itemBuilder: (context, index) {
                  final stock = _results[index];
                  return ListTile(
                    title: Text(stock['name']),
                    subtitle: Text('Price: ${stock['price']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
