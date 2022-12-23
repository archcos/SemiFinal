import 'package:flutter/material.dart';
import 'database.dart';

class DetailsPage extends StatelessWidget {

  final DataModel data;

  const DetailsPage({
    required this.data,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo Details"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              const Text('ID'),
              const Padding(padding: EdgeInsets.only(left: 65)),
              Text(': ${data.id}'),
            ],
          ), Row(
            children: [
              const Text('User ID'),
              const Padding(padding: EdgeInsets.only(left: 33)),
              Text(': ${data.userId}'),
            ],
          ),
          Row(
            children: [
              const Text('Title'),
              const Padding(padding: EdgeInsets.only(left: 50)),
              Text(': ${data.title}'),
            ],
          ),
          Row(
            children: [
              const Text('Completed'),
              const Padding(padding: EdgeInsets.only(left: 10)),
              Text(': ${data.completed}'),
            ],
          ),
        ],
      ),
    );
  }
}
