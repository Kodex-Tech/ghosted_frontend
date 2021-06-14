import 'package:flutter/cupertino.dart';

class PremiumGuild {
  PremiumGuild({
    @required this.name,
    @required this.boosts,
    @required this.guildID,
    @required this.owner,
    @required this.ownerID,
    @required this.isOwner,
    @required this.icon,
  });
  String name;
  int boosts;
  String guildID;
  String owner;
  String ownerID;
  bool isOwner;
  String icon;
}
