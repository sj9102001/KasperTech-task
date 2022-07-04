class User {
  final String? token;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? username;
  final String? phoneNumber;

  User({
    required this.token,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.phoneNumber,
  });
}
