class LoginResponse {
  bool Success;
  String? AccessToken;
  String? Email;
  String? UserId;
  String? Message;
  String? FullName;
  DateTime? RefreshTokenExpiration;

  LoginResponse(
    this.Success,
    this.AccessToken,
    this.Email,
    this.UserId,
    this.Message,
    this.FullName,
    this.RefreshTokenExpiration,
  );

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    var accessToken = json['token'];
    var refreshTokenExpiration = DateTime.parse(json['refreshTokenExpiration']);
    var fullName = json['fullName'];
    var email = json['email'];
    var userId = json['userId'];
    var message = json['message'];
    var success = json['success'];

    return LoginResponse(
      success,
      accessToken,
      email,
      userId,
      message,
      fullName,
      refreshTokenExpiration,
    );
  }
}
