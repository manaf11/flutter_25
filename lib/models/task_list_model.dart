import 'package:flutter/material.dart';
import 'package:test_git/models/task_model.dart';

class TaskListModel extends ChangeNotifier{

  List<TaskModel> tasks = [
    TaskModel(taskName: "first task", isDone: true),
    TaskModel(taskName: "second task"),
  ];

  addTask(String taskName){
    tasks.add(TaskModel(taskName: taskName));
    notifyListeners();
  }


  removeTask(TaskModel task){
    tasks.remove(task);
    notifyListeners();
  }

  editTask(TaskModel taskModel){
    for(var task in tasks){
      if(task == taskModel) {
        task.changeStatus();
      }
    }
    notifyListeners();
  }
}