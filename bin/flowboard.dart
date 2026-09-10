import 'package:flowboard/domain/entities/task.dart';
void main(List<String> arguments) {
  final task = Task(id: 1, title: 'Learn Dart', description: 'Practice Dart OOP');

  print(task);

  task.start();

  print(task);

  task.complete();

  print(task);
}
