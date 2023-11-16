class User {
  final bool Success;
  final String? AccessToken;
  final String? RefreshTokenExpiration;
  final String? Message;
  final String? UserId;
  final String? UserName;
  final String? Email;
  final String? Mobil;
  final String? FirstName;
  final String? LastName;
  final String? BirthDate;
  final String? Gender;

  User(
      this.Success,
      this.AccessToken,
      this.RefreshTokenExpiration,
      this.Message,
      this.UserId,
      this.UserName,
      this.Email,
      this.Mobil,
      this.FirstName,
      this.LastName,
      this.BirthDate,
      this.Gender);

  factory User.fromJson(Map<String, dynamic> json) => User(
        json['Success'],
        json['AccessToken'],
        json['RefreshTokenExpiration'],
        json['Message'],
        json['UserId'],
        json['UserName'],
        json['Email'],
        json['Mobil'],
        json['FirstName'],
        json['LastName'],
        json['BirthDate'],
        json['Gender'],
      );
}
