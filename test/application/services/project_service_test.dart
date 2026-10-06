import 'package:flowboard/application/services/project_service.dart';
import 'package:flowboard/domain/entities/project.dart';
import 'package:flowboard/domain/entities/task.dart';
import 'package:flowboard/domain/exceptions/flowboard_exception.dart';
import 'package:flowboard/infrastructure/repositories/project_repository.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectService', () {
    test('creates a project', () {
      final repository = ProjectRepository();
      final service = ProjectService(repository);

      final project = Project(
        id: 1,
        name: 'Flowboard',
        description: 'Dart project manager',
      );

      service.createProject(project);

      final result = service.getProject(1);

      expect(result, equals(project));
    });

    test('rejects project with empty name', () {
      final repository = ProjectRepository();
      final service = ProjectService(repository);

      final project = Project(
        id: 1,
        name: '',
        description: 'Invalid project',
      );

      expect(
        () => service.createProject(project),
        throwsA(isA<FlowboardException>()),
      );
    });

    test('adds task to project', () {
      final repository = ProjectRepository();
      final service = ProjectService(repository);

      final project = Project(
        id: 1,
        name: 'Flowboard',
        description: 'Dart project manager',
      );

      final task = Task(
        id: 1,
        title: 'Add project service',
        description: 'Implement business logic',
      );

      service.createProject(project);

      service.addTaskToProject(1, task);

      final result = service.getProject(1);

      expect(result, isNotNull);
      expect(result!.tasks, contains(task));
    });

    test('rejects adding task to non-existing project', () {
      final repository = ProjectRepository();
      final service = ProjectService(repository);

      final task = Task(
        id: 1,
        title: 'Test task',
        description: 'Test description',
      );

      expect(
        () => service.addTaskToProject(999, task),
        throwsA(isA<FlowboardException>().having(
          (e) => e.message,
          'message',
          'Project not found',
        )),
      );
    });

    test('removes task from project', () {
      final repository = ProjectRepository();
      final service = ProjectService(repository);

      final project = Project(
        id: 1,
        name: 'Flowboard',
        description: 'Dart description',
      );

      final task = Task(
        id: 1,
        title: 'Test task',
        description: 'Test description',
      );

      service.createProject(project);
      service.addTaskToProject(1, task);

      expect(project.tasks, contains(task));

      service.removeTaskFromProject(1, 1);

      expect(project.tasks, isEmpty);
    });

    test('rejects removing task from non-existing project', () {
      final repository = ProjectRepository();
      final service = ProjectService(repository);

      expect(
        () => service.removeTaskFromProject(999, 1),
        throwsA(isA<FlowboardException>()),
      );
    });

    test('rejects removing non-existing task from project', () {
      final repository = ProjectRepository();
      final  service = ProjectService(repository);

      final project = Project(
        id: 1,
        name: 'Flowboard',
        description: 'Dart project manager',
      );

      service.createProject(project);

      expect(
        () => service.removeTaskFromProject(1, 999),
        throwsA(isA<FlowboardException>()),
      );
    });
  });
}