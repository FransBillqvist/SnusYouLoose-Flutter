class CreateCSDto {
  String snusId;
  String userId;

  CreateCSDto(this.snusId, this.userId);

  factory CreateCSDto.fromJson(Map<String, dynamic> json) => CreateCSDto(
        json['snusId'] as String,
        json['userId'] as String,
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['snusId'] = this.snusId;
    data['userId'] = this.userId;
    return data;
  }
}
