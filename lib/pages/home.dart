import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';

import '../models/timetable.dart';

class TimetableScreen extends StatefulWidget {
  @override
  _TimetableScreenState createState() => _TimetableScreenState();
}

class _TimetableScreenState extends State<TimetableScreen> {
  List<TimetableItem> timetableItems = [];

  @override
  void initState() {
    super.initState();
    fetchTimetableData();
  }

  Future<void> fetchTimetableData() async {
    final url = Uri.parse(
        'https://centralattendance.fly.dev/api/collections/timetable/records');

    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        final items = jsonData['items'];
        setState(() {
          timetableItems = items
              .map<TimetableItem>((item) => TimetableItem.fromJson(item))
              .toList();
        });
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
      ),
      body: ListView.builder(
        itemCount: timetableItems.length,
        itemBuilder: (context, index) {
          final TimetableItem item = timetableItems[index];
          return ListTile(
            title: Text(item.course),
            subtitle: Text('${item.startTime} - ${item.endTime}'),
            // You can customize the ListTile with more information if needed
            // For example, you can use `item.day`, `item.semester`, etc.
          );
        },
      ),
    );
  }
}
