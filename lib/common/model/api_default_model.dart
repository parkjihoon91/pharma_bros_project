abstract class ApiDefaultModelBase {}

class ApiDefaultModelLoading extends ApiDefaultModelBase {}

class ApiDefaultModelError extends ApiDefaultModelBase {
  final String message;

  ApiDefaultModelError(this.message);
}