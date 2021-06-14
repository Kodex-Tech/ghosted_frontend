import 'package:flutter/cupertino.dart';

class Connection {
  const Connection(
      {@required this.type,
      @required this.id,
      @required this.username,
      @required this.revoked,
      @required this.visible,
      @required this.friendSync,
      @required this.showActivity,
      @required this.verified,
      this.accessToken});
  final String type;
  final String id;
  final String username;
  final bool revoked;
  final int visible;
  final bool friendSync;
  final bool showActivity;
  final bool verified;
  final String accessToken;
}
