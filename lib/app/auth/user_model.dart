class UserModel{
  final String firstName;
  final String surname;
  final String email;
  final String phone;
  final String profilePictureUrl;

  UserModel({
    required this.firstName,
    required this.surname,
    required this.email,
    required this.phone,
    required this.profilePictureUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'firstName': firstName,
      'surname': surname,
      'email': email,
      'phone': phone,
      'profilePictureUrl': profilePictureUrl,
    };
  }
}
