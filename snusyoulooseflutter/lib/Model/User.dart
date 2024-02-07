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
      this.Gender);

  factory User.fromJson(Map<String, dynamic> json) => User(
        json['password'] as String?,
        json['avatar'] as String?,
        json['location'] as String?,
        json['userId'] as String?,
        json['userName'] as String?,
        json['email'] as String?,
        json['mobile'] as String?,
        json['firstName'] as String?,
        json['lastName'] as String?,
        json['birthDate'] as String?,
        json['gender'] as String?,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.UserId;
    data['username'] = this.UserName;
    data['firstName'] = this.FirstName;
    data['lastName'] = this.LastName;
    data['mobile'] = this.Mobile;
    data['birthDate'] = this.BirthDate;
    data['gender'] = this.Gender;
    data['location'] = this.Location;
    data['password'] = this.Password;
    data['avatar'] = this.Avatar;
    data['email'] = this.Email;
    return data;
  }

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
