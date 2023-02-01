import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_git/models/task_list_model.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var tasks = Provider.of<TaskListModel>(context).tasks;
    var tasksProvider = Provider.of<TaskListModel>(context, listen: false);
    print(tasks);
    return Scaffold(
      appBar: AppBar(title: Text("Task List"),),
      body: ListView.builder(itemCount: tasks.length*2,itemBuilder: (context, index) {
        if(index.isEven) {
          return ListTile(
            title: Text(tasks[index ~/2 ].taskName, style: TextStyle(decoration: tasks[index ~/2 ].isDone == true?TextDecoration.lineThrough:TextDecoration.none),),
          trailing: Checkbox(value: tasks[index ~/2 ].isDone!,
          onChanged: (value) => tasksProvider.editTask(tasks[index ~/ 2]),),
          onLongPress: ()=> tasksProvider.removeTask(tasks[index ~/2]),);
        } else {
          return Divider();
        }
      },),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
         tasksProvider.addTask("Third task");
        },
      ),
    );
  }
}

