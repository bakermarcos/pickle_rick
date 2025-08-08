class FailureDTO {
  final String type;
  final String code;
  final String message;
  final String details;

  FailureDTO({
    required this.code,
    required this.type,
    required this.details,
    required this.message,
  });

  factory FailureDTO.fromData(Map json) => FailureDTO(
        code: (json["code"] ?? "").toString(),
        type: (json["type"] ?? "").toString(),
        details: (json["details"] ?? "").toString(),
        message: (json["message"] ?? json["error"] ?? "").toString(),
      );
}
