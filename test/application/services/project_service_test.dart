import 'package:flowboard/application/services/project_service.dart';
import 'package:flowboard/domain/entities/project.dart';
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
  });
}