class UserModel {
  String firstName;
  String lastName;
  int? mobileNumber;
  String? gender;
  String? DOB;
  String? address;

  UserModel(
      {this.firstName = "",
      this.lastName = "",
      this.mobileNumber = 0,
      this.gender = '',
      this.DOB = '',
      this.address = ''});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        firstName: json["firstName"],
        lastName: json["lastName"],
        mobileNumber: json["mobileNumber"],
        gender: json["gender"],
        DOB: json["DOB"],
        address: json["address"]);
  }

  toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "mobileNumber": mobileNumber,
      "gender": gender,
      "DOB": DOB,
      "address": address,
    };
  }
}
