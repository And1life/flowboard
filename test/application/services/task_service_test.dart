import 'package:flowboard/domain/exceptions/flowboard_exception.dart';
import 'package:test/test.dart';
import 'package:flowboard/application/services/task_service.dart';
import 'package:flowboard/domain/entities/task.dart';
import 'package:flowboard/infrastructure/repositories/task_repository.dart';

void main() {
  group('TaskService', () {
    test('creates a task', () {
      final repository = TaskRepository();
      final service = TaskService(repository);

      final task = Task(
        id: 1,
        title: 'Learn Dart',
        description: 'Study testing',
      );

      service.createTask(task);

      final result = service.getTask(1);

      expect(result, equals(task));
    });
    test('rejects task with empty title', () {
      final repository = TaskRepository();
      final service = TaskService(repository);

      final task = Task(
        id: 2,
        title: '',
        description: 'Empty title',
      );

      expect(
        () => service.createTask(task),
        throwsA(isA<FlowboardException>()),
      );
    });

    test('returns null when task does not exist', () {
      final repository = TaskRepository();
      final service = TaskService(repository);

      final result = service.getTask(5);

      expect(result, isNull);
    });

    test('deletes a task', () {
      final repository = TaskRepository();
      final service = TaskService(repository);

      final task = Task(
        id: 3,
        title: 'Test title',
        description: 'test description',
      );

      service.createTask(task);

      expect(service.getTask(3), equals(task));

      service.deleteTask(3);

      expect(service.getTask(3), isNull);
    });

    test('returns all tasks', () {
      final repository = TaskRepository();
      final service = TaskService(repository);

      final task1 = Task(
        id: 4,
        title: 'Test title 4',
        description: 'Test description 4',
      );

      final task2 = Task(
        id: 5,
        title: 'Test title 5',
        description: 'Test description 5',
      );

      final task3 = Task(
        id: 6,
        title: 'Test title 6',
        description: 'Test description 6',
      );

      service.createTask(task1);
      service.createTask(task2);
      service.createTask(task3);

      final List<Task> expectedTasks = [task1, task2, task3];

      expect(expectedTasks, equals(service.getTasks()));
    });

    test('rejects task with whitespace-only title', () {
      final repository = TaskRepository();
      final service = TaskService(repository);

      final task = Task(
        id: 6,
        title: '      ',
        description: 'Empty title',
      );

      expect(
        () => service.createTask(task),
        throwsA(isA<FlowboardException>()),
      );
    });
  });
}