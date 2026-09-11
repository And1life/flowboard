abstract class Repository<T> {
  void create(T item);

  T? findById(int id);

  List<T> findAll();

  void delete(int id);
}