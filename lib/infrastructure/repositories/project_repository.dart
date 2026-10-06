import 'package:flowboard/domain/entities/project.dart';
import 'package:flowboard/infrastructure/repositories/repository.dart';

class ProjectRepository implements Repository<Project> {
  final List<Project> _projects = [];

  @override
  void create(Project item) {
    _projects.add(item);
  }

  @override
  Project? findById(int id) {
    for (final project in _projects) {
      if (project.id == id) {
        return project;
      }
    }

    return null;
  }

  @override
  List<Project> findAll() {
    return _projects.toList();
  }

  @override
  void delete(int id) {
    _projects.removeWhere((project) => project.id == id);
  }
}