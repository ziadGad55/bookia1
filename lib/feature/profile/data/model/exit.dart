class Exit {
  List<dynamic>? data;
  String? message;
  List<dynamic>? error;
  int? status;

  Exit({this.data, this.message, this.error, this.status});

  factory Exit.fromJson(Map<String, dynamic> json) => Exit(
        data: json['data'] as List<dynamic>?,
        message: json['message'] as String?,
        error: json['error'] as List<dynamic>?,
        status: json['status'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'data': data,
        'message': message,
        'error': error,
        'status': status,
      };
}
