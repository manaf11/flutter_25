class TaskModel{
  late String taskName;
  bool? isDone;

  changeStatus(){
    isDone = !isDone!;
  }

//<editor-fold desc="Data Methods">

  TaskModel({
    required this.taskName,
    this.isDone = false,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TaskModel &&
          runtimeType == other.runtimeType &&
          taskName == other.taskName &&
          isDone == other.isDone);

  @override
  int get hashCode => taskName.hashCode ^ isDone.hashCode;

  @override
  String toString() {
    return 'TaskModel{' + ' taskName: $taskName,' + ' isDone: $isDone,' + '}';
  }

  TaskModel copyWith({
    String? taskName,
    bool? isDone,
  }) {
    return TaskModel(
      taskName: taskName ?? this.taskName,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'taskName': this.taskName,
      'isDone': this.isDone,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      taskName: map['taskName'] as String,
      isDone: map['isDone'] as bool,
    );
  }

//</editor-fold>
}