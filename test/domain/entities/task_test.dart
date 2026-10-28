import 'package:test/test.dart';

import 'package:flowboard/domain/entities/task.dart';
import 'package:flowboard/domain/exceptions/flowboard_exception.dart';

void main() {
  group('Task', () {
    test('starts a todo task', () {
      final task = Task(
        id: 1,
        title: 'Learn Dart',
        description: 'Study state transitions',
      );

      task.start();

      expect(task.status, TaskStatus.inProgress);
    });

    test('completes an in-progress task', () {
      final task = Task(
        id: 1,
        title: 'Learn Dart',
        description: 'Study state transitions',
      );

      task.start();
      task.complete();

      expect(task.status, TaskStatus.done);
    });

    test('rejects completing a todo task', () {
      final task = Task(
        id: 1,
        title: 'Learn Dart',
        description: 'Study state transitions',
      );

      expect(() => task.complete(), throwsA(isA<FlowboardException>()));
    });

    test('rejects completing an already completed task', () {
      final task = Task(
        id: 1,
        title: 'Learn Dart',
        description: 'Study state transitions',
      );

      task.start();
      task.complete();

      expect(() => task.complete(), throwsA(isA<FlowboardException>()));

      expect(task.status, TaskStatus.done);
    });

    test('reject starting an in-progress task', () {
      final task = Task(
        id: 1,
        title: 'Learn Dart',
        description: 'Study state transitions',
      );

      task.start();

      expect(() => task.start(), throwsA(isA<FlowboardException>()));

      expect(task.status, TaskStatus.inProgress);
    });

    test('reject starting a completed task', () {
      final task = Task(
        id: 1,
        title: 'Learn Dart',
        description: 'Study state transitions',
      );

      task.start();
      task.complete();

      expect(() => task.start(), throwsA(isA<FlowboardException>()));

      expect(task.status, TaskStatus.done);
    });
  });
}
