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
  });
}