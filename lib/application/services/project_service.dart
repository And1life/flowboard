import 'package:flowboard/domain/entities/project.dart';
import 'package:flowboard/domain/exceptions/flowboard_exception.dart';
import 'package:flowboard/infrastructure/repositories/repository.dart';

class ProjectService {
  final Repository<Project> _repository;

  ProjectService(this._repository);

  void createProject(Project project) {
    if (project.name.trim().isEmpty) {
      throw FlowboardException('Project name cannot be empty');
    }

    _repository.create(project);
  }

  Project? getProject(int id) {
    return _repository.findById(id);
  }

  List<Project> getProjects() {
    return _repository.findAll();
  }

  void deleteProject(int id) {
    _repository.delete(id);
  }
}