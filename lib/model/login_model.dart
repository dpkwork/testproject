class LoginModel {
  LoginModel({
    required this.apiResponse,
    required this.statusCode,
    required this.message,
    required this.data,
  });

  final String? apiResponse;
  final int? statusCode;
  final String? message;
  final Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json){
    return LoginModel(
      apiResponse: json["api_response"],
      statusCode: json["status_code"],
      message: json["message"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }

}

class Data {
  Data({
    required this.accessToken,
    required this.id,
    required this.fullName,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.isVerified,
    required this.planType,
    required this.theme,
    required this.phoneNumber,
    required this.address,
    required this.zipCode,
    required this.countryCode,
    required this.gender,
    required this.dob,
    required this.countryShortCode,
  });

  final String? accessToken;
  final int? id;
  final String? fullName;
  final String? firstName;
  final String? lastName;
  final String? email;
  final int? isVerified;
  final String? planType;
  final dynamic theme;
  final dynamic phoneNumber;
  final dynamic address;
  final dynamic zipCode;
  final dynamic countryCode;
  final String? gender;
  final dynamic dob;
  final dynamic countryShortCode;

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      accessToken: json["access_token"],
      id: json["id"],
      fullName: json["full_name"],
      firstName: json["first_name"],
      lastName: json["last_name"],
      email: json["email"],
      isVerified: json["is_verified"],
      planType: json["plan_type"],
      theme: json["theme"],
      phoneNumber: json["phone_number"],
      address: json["address"],
      zipCode: json["zip_code"],
      countryCode: json["country_code"],
      gender: json["gender"],
      dob: json["dob"],
      countryShortCode: json["country_short_code"],
    );
  }

}
