class User {
  final int id;
  final String loginId;
  final String fullName;
  final String ssn;

  User({
    required this.id,
    required this.loginId,
    required this.fullName,
    required this.ssn,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      loginId: json['login_id'],
      fullName: json['full_name'],
      ssn: json['ssn'].toString(),
    );
  }
}
