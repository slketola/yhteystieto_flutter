import 'dart:core';

class Contact {
  final String name;
  final String email;
  final String avatar;
  final String mobile;
  final bool starred;

  Contact(
      {required this.name,
      required this.email,
      required this.avatar,
      required this.mobile,
      required this.starred});
}
