class LawyerModel {
  final String id;
  final String name;
  final String email;
  final String password;
  final String gender;
  final String DOB;
  final String contact;
  final String provider;
  final String experience;
  final String location;
  final String licenseNo;

  LawyerModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.DOB,
    required this.contact,
    required this.provider,
    required this.experience,
    required this.location,
    required this.licenseNo,
  });

  factory LawyerModel.fromJson(Map<String, dynamic> json) {
    return LawyerModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      gender: json['gender'] ?? '',
      DOB: json['DOB'] ?? '',
      contact: json['contact'] ?? '',
      provider: json['provider'] ?? '',
      experience: json['experience'] ?? '',
      location: json['location'] ?? '',
      licenseNo: json['licenseNo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'DOB': DOB,
      'contact': contact,
      'provider': provider,
      'experience': experience,
      'location': location,
      'licenseNo': licenseNo,
    };
  }
}
