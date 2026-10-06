import 'package:flowboard/domain/entities/project.dart';
import 'package:flowboard/infrastructure/repositories/project_repository.dart';
import 'package:test/test.dart';

void main() {
  group('ProjectRepository', () {
    test('creates and finds a project', () {
      final repository = ProjectRepository();

      final project = Project(
        id: 1,
        name: 'Flowboard',
        description: 'Dart project manager',
      );

      repository.create(project);

      final result = repository.findById(1);

      expect(result, equals(project));
    });

    test('returns null when project does not exist', () {
      final repository = ProjectRepository();

      final result = repository.findById(999);

      expect(result, isNull);
    });

    test('returns all projects', () {
      final repository = ProjectRepository();

      final project1 = Project(
        id: 1,
        name: 'Flowboard',
        description: 'Dart project manager',
      );

      final project2 = Project(
        id: 2,
        name: 'Capycodio',
        description: 'Learning platform',
      );

      repository.create(project1);
      repository.create(project2);

      final result = repository.findAll();

      expect(result, equals([project1, project2]));
    });

    test('deletes a project', () {
      final repository = ProjectRepository();

      final project = Project(
        id: 1,
        name: 'Flowboard',
        description: 'Dart project manager',
      );

      repository.create(project);

      repository.delete(1);

      expect(repository.findById(1), isNull);
    });

    test('does not expose internal project list', () {
      final repository = ProjectRepository();

      final project = Project(
        id: 1,
        name: 'Flowboard',
        description: 'Dart project manager',
      );

      repository.create(project);

      final projects = repository.findAll();

      projects.clear();

      expect(repository.findById(1), equals(project));
    });
  });
}