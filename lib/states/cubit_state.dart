class CubitState<T> {
  final bool isFirstLoading;
  final bool isLoading;
  final String exception;
  final List<T> result;

  const CubitState({
    required this.isFirstLoading,
    required this.isLoading,
    required this.exception,
    this.result = const [],
  });

  CubitState copyWith({
    bool? isFirstLoading,
    bool? isLoading,
    String? exception,
    List<T>? result,
  }) {
    return CubitState(
      isFirstLoading: isFirstLoading ?? this.isFirstLoading,
      isLoading: isLoading ?? this.isLoading,
      exception: exception ?? this.exception,
      result: result ?? this.result,
    );
  }

  @override
  String toString() {
    return 'CommentCubitState: \n{'
        '\n isFirstLoading: $isFirstLoading\n isLoading: $isLoading\n exception: $exception\n result: $result\n}';
  }
}
