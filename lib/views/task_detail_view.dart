import 'package:flutter/material.dart';
import 'package:task_management/models/task_model.dart';

class TaskDetailView extends StatefulWidget {
  final TaskModel task;
  const TaskDetailView({
    super.key,
    required this.task,
  });

  @override
  State<TaskDetailView> createState() => _TaskDetailViewState();
}

class _TaskDetailViewState extends State<TaskDetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(widget.task.title),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 0.5),
              spreadRadius: 2.0,
              blurRadius: 14.0,
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            top: 10.0,
            bottom: 10.0,
            right: 5.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 20.0,
              ),
              const Text(
                'Title:',
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 14.0,
                ),
              ),
              Text(widget.task.title,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                    color: Colors.black,
                  )),
              Container(
                height: 20.0,
              ),
              const Text(
                'Description:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              Text(widget.task.description,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                    color: Colors.black,
                  )),
              Container(
                height: 20.0,
              ),
              const Text(
                'Assignee:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              Text(widget.task.assignee,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                    color: Colors.black,
                  )),
              Container(
                height: 20.0,
              ),
              const Text(
                'Status:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
              ),
              Text(widget.task.status,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16.0,
                    color: Colors.black,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
