import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TaskScreen(),
  ));
}

class TaskScreen extends StatelessWidget {
  final List<Map<String, dynamic>> taskList = [
    {'title': 'Complete Flutter App', 'completed': false},
    {'title': 'Buy Groceries', 'completed': true},
    {'title': 'Call the Electrician', 'completed': false},
    {'title': 'Exercise', 'completed': false},
  ];

  TaskScreen({super.key}); // Removed 'const' to avoid error

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Task List")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          return TaskTile(
            taskTitle: taskList[index]['title'],
            completed: taskList[index]['completed'],
          );
        },
      ),
    );
  }
}

class TaskTile extends StatefulWidget {
  final String taskTitle;
  final bool completed;

  const TaskTile({required this.taskTitle, required this.completed, super.key});

  @override
  State<TaskTile> createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  late bool completed;

  @override
  void initState() {
    super.initState();
    completed = widget.completed;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withAlpha((0.3 * 255).toInt()), // Updated Fix
            blurRadius: 4,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          widget.taskTitle,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            decoration: completed ? TextDecoration.lineThrough : null,
            color: completed ? Colors.grey : Colors.black,
          ),
        ),
        trailing: Switch(
          value: completed,
          onChanged: (value) {
            setState(() {
              completed = value;
            });
          },
        ),
      ),
    );
  }
}
