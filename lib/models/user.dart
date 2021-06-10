import 'package:flutter/cupertino.dart';

class UserData {
  const UserData(
      {@required this.id,
      @required this.email,
      @required this.phone,
      @required this.mfa,
      @required this.accountCreated,
      @required this.verified,
      @required this.hasNitro});
  final String id;
  final String email;
  final String phone;
  final bool mfa;
  final String accountCreated;
  final bool verified;
  final bool hasNitro;
}
