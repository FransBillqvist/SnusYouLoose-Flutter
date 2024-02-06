class AuthResponse {
  String message;
  bool success;
  String id;

  AuthResponse(this.message, this.success, this.id);

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        json['message'] as String,
        json['success'] as bool,
        json['id'] as String,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    data['id'] = this.id;
    return data;
  }
}
