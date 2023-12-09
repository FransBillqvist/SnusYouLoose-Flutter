class User {
  final String? Password;
  final String? Avatar;
  final String? Location;
  final String? UserId;
  final String? UserName;
  final String? Email;
  final String? Mobile;
  final String? FirstName;
  final String? LastName;
  final String? BirthDate;
  final String? Gender;
  final String? Id;
  final DateTime? CreatedAtUtc;
  final String? StringCreatedAtUtc;

  User(
      this.Password,
      this.Avatar,
      this.Location,
      this.UserId,
      this.UserName,
      this.Email,
      this.Mobile,
      this.FirstName,
      this.LastName,
      this.BirthDate,
      this.Gender,
      this.Id,
      this.CreatedAtUtc,
      this.StringCreatedAtUtc);

  factory User.fromJson(Map<String, dynamic> json) => User(
        json['Password'] as String?,
        json['Avatar'] as String?,
        json['Location'] as String?,
        json['UserId'] as String?,
        json['UserName'] as String?,
        json['Email'] as String?,
        json['Mobile'] as String?, // Ändrad från 'Mobil'
        json['FirstName'] as String?,
        json['LastName'] as String?,
        json['BirthDate'] as String?,
        json['Gender'] as String?,
        json['Id'] as String?,
        json['CreatedAtUtc'] == null
            ? null
            : DateTime.parse(json['CreatedAtUtc']),
        json['StringCreatedAtUtc'] as String?,
      );

  // factory User.fromJson(Map<String, dynamic> json) => User(
  //       json['Password'],
  //       json['Avatar'],
  //       json['Location'],
  //       json['UserId'],
  //       json['UserName'],
  //       json['Email'],
  //       json['Mobile'],
  //       json['FirstName'],
  //       json['LastName'],
  //       json['BirthDate'],
  //       json['Gender'],
  //       json['Id'],
  //       DateTime.parse(json['CreatedAtUtc']),
  //       json['StringCreatedAtUtc'],
  //     );
}
