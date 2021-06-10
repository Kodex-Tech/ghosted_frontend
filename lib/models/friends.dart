import 'package:flutter/cupertino.dart';

class Friend {
  const Friend(
      {@required this.id,
      @required this.username,
      @required this.avatar,
      @required this.type});
  final String id;
  final String username;
  final String avatar;
  final int type;
}
