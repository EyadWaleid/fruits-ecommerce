class CustomExceptions implements Exception{

  final String errorMessage;
  CustomExceptions({required this.errorMessage});
  @override
  String toString() {
    // TODO: implement toString
    return errorMessage;
  }
}