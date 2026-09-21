import 'package:test/test.dart';

import 'package:flowboard/domain/entities/task.dart';
import 'package:flowboard/infrastructure/repositories/task_repository.dart';

void main() {
  group('TaskRepository', () {
    test('creates and finds a task', () {
      final repository = TaskRepository();

      final task = Task(
        id: 1,
        title: 'Learn Dart',
        description: 'Study repositories',
      );

      repository.create(task);

      final result = repository.findById(1);

      expect(result, equals(task));
    });

    test('result null when task does not exist', () {
      final repository = TaskRepository();

      final result = repository.findById(999);
      expect(result, isNull);
    });

    test('returns all tasks', () {
      final repository = TaskRepository();

      final task1 = Task(
        id: 2,
        title: 'Task 1',
        description: 'Description 1',
      );

      final task2 = Task(
        id: 3,
        title: 'Task 2',
        description: 'Description 2',
      );

      repository.create(task1);
      repository.create(task2);

      final result = repository.findAll();

      expect(result, equals([task1, task2]));
    });

    test('delete a task', () {
      final repository = TaskRepository();

      final task = Task(
        id: 4,
        title: 'Task 4',
        description: 'Description 4',
      );

      repository.create(task);

      expect(repository.findById(4), equals(task));

      repository.delete(4);

      expect(repository.findById(4), isNull);
    });

    test('does not expose internal task list', () {
      final repository = TaskRepository();

      final task = Task(
        id: 5,
        title: 'Task 5',
        description: 'Descroption 5',
      );

      repository.create(task);

      final tasks = repository.findAll();

      tasks.clear();

      expect(repository.findById(5), equals(task));
    });
  });
}