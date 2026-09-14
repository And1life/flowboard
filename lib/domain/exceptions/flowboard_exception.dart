class FlowboardException implements Exception {
  final String message;

  FlowboardException(this.message);

  @override
  String toString() {
    return message;
  }
}