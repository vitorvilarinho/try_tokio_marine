/// Abstract [Failure] class.
abstract class Failure {
  /// Provide a [Failure] instance.
  const Failure({
    required this.message,
    this.exception,
    this.stack,
  });

  /// Failure message to display
  final String message;

  /// Origin exception
  final Exception? exception;

  /// Origin stack trace.
  final Object? stack;

  @override
  String toString() => message;
}
