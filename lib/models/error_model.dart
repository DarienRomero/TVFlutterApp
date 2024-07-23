
class ErrorResponse {
  ErrorResponse({
    required this.message,
    required this.statusCode,
  });

  final String message;
  final int statusCode;

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
    message: json["message"],
    statusCode: json["status_code"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "statusCode": statusCode,
  };

  static ErrorResponse get unknown => ErrorResponse(
    message: "Error desconocido", 
    statusCode: 500
  );
  static ErrorResponse get network => ErrorResponse(
    message: "Error de conexión", 
    statusCode: 408
  );
  static ErrorResponse get notFound => ErrorResponse(
    message: "No encontrado", 
    statusCode: 500
  );
  static ErrorResponse get cancelled => ErrorResponse(
    message: "Cancelado", 
    statusCode: 405
  );
}
