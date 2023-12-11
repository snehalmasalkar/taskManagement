import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:task_management/views/task_detail_view.dart';

import '../models/task_model.dart';
import '../services/constants.dart';

const double _popoverWidth = 180;
const double _popoverHeight = 150;
const double _popoverArrowHeight = 15;
const double _popoverArrowWidth = 20;
const double _popoverRadius = 5;

class TaskListView extends StatefulWidget {
  const TaskListView({super.key});

  @override
  State<TaskListView> createState() => _TaskListViewState();
}

class _TaskListViewState extends State<TaskListView> {
  String seletedStatus = StatusType.allTasks;

  bool get _isFilterApplied => seletedStatus != StatusType.allTasks;

  late List<dynamic> selectedTask;

  @override
  initState() {
    super.initState();
    getSelectedTaskList();
    print('selected: $seletedStatus');
    print('selected task: $getSelectedTaskList()');
  }

  List<TaskModel> taskList = [
    TaskModel(
      id: '1',
      title: 'Design',
      status: 'Incomplete',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      assignee: 'Rosy',
    ),
    TaskModel(
        id: '2',
        title: 'Code implementation',
        status: 'In-Progress',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
        assignee: 'Jenny'),
    TaskModel(
        id: '3',
        title: 'API integration',
        status: 'Completed',
        description:
            'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
        assignee: 'Raj'),
    TaskModel(
      id: '4',
      title: 'Unit Testing',
      status: 'Incomplete',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      assignee: 'Ravi',
    ),
    TaskModel(
      id: '5',
      title: 'Integration Testing',
      status: 'In-Progress',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      assignee: 'Jenny',
    ),
    TaskModel(
      id: '6',
      title: 'Communication',
      status: 'Completed',
      description:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.',
      assignee: 'John',
    ),
  ];

  List<dynamic> getSelectedTaskList() {
    selectedTask =
        taskList.where((task) => task.status == seletedStatus).toList();
    print('Selected task count: ${selectedTask.length}');
    return selectedTask;
  }

  Widget filterListWidget(
      {required String title, required bool isSelected, onTap}) {
    return Container(
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
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title),
              ],
            ),
          ),
        ));
  }

  _setFilter(
    String status,
  ) async {
    Navigator.pop(context);
    setState(() {
      seletedStatus = status;
      print('status: $seletedStatus');
    });
  }

  refreshState(VoidCallback fn) {
    if (mounted) setState(fn);
  }

  _showFilterView(BuildContext _context) {
    showPopover(
      context: _context,
      bodyBuilder: (_) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: StatusType.statuces
            .map(
              (status) => filterListWidget(
                title: status,
                isSelected: status == seletedStatus,
                onTap: () => _setFilter(status),
              ),
            )
            .toList(),
      ),
      onPop: () => refreshState(() {
        print('Filter closed');
      }),
      direction: PopoverDirection.bottom,
      width: _popoverWidth,
      height: _popoverHeight,
      arrowHeight: _popoverArrowHeight,
      arrowWidth: _popoverArrowWidth,
      radius: _popoverRadius,
    );
  }

  Widget _buidTaskFilterWidget(BuildContext context) {
    return Builder(
      builder: (context) {
        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.filter_alt_rounded, size: 50.0),
              onPressed: () => _showFilterView(context),
            ),
            if (_isFilterApplied)
              AnimatedPositioned(
                duration: const Duration(milliseconds: 700),
                bottom: _isFilterApplied ? 10.0 : -50.0,
                left: _isFilterApplied ? 25.0 : -50.0,
                child: const Icon(
                  Icons.check_box,
                  color: Colors.white,
                  size: 20.0,
                ),
              ),
          ],
        );
      },
    );
  }

  Widget taskWidget(TaskModel task) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      padding: const EdgeInsets.only(
        left: 20.0,
        top: 10.0,
        bottom: 10.0,
        right: 5.0,
      ),
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
          Text(task.title,
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
          Text(task.description,
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
          Text(task.assignee,
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
          Text(task.status,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16.0,
                color: Colors.black,
              )),
        ],
      ),
    );
  }

  Widget getAllTasksWidget() {
    return ListView.builder(
      itemCount: taskList.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => TaskDetailView(
                      task: taskList[index],
                    )),
          );
        },
        child: taskWidget(
          taskList[index],
        ),
      ),
    );
  }

  Widget getSelectedTasksWidget() {
    print('status in getSelectedTasksWidget: $seletedStatus');
    getSelectedTaskList();
    print('selected task: $selectedTask.length');
    return ListView.builder(
      itemCount: selectedTask.length,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                builder: (context) => TaskDetailView(
                      task: selectedTask[index],
                    )),
          );
        },
        child: taskWidget(
          selectedTask[index],
        ),
      ),
    );
  }

  Widget getBody() {
    print('selected status: $seletedStatus');
    if (seletedStatus == StatusType.allTasks) {
      return getAllTasksWidget();
    } else {
      return getSelectedTasksWidget();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Task List'),
        backgroundColor: Colors.orange,
        actions: <Widget>[
          _buidTaskFilterWidget(context),
        ],
      ),
      body: getBody(),
      // Container(
      //   color: Colors.white,
      //   child: ListView.builder(
      //     itemCount: selectedTask.length,
      //     itemBuilder: (context, index) => InkWell(
      //       onTap: () {
      //         Navigator.of(context).push(
      //           MaterialPageRoute(
      //               builder: (context) => TaskDetailView(
      //                     task: selectedTask[index],
      //                   )),
      //         );
      //       },
      //       child: taskWidget(
      //         taskList[index],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
