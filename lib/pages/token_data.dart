import 'package:flutter/material.dart';
import 'package:ghosted/components/friends.dart';
import 'package:ghosted/components/user_info.dart';
import 'package:ghosted/models/friends.dart';
import 'package:ghosted/models/user.dart';
import 'package:ghosted/styles/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';

class TokenData extends StatefulWidget {
  TokenData({@required this.data});
  final Map<String, dynamic> data;
  @override
  _TokenDataState createState() => _TokenDataState();
}

class _TokenDataState extends State<TokenData> with TickerProviderStateMixin {
  var data;
  TabController _tabController;
  Widget _currentWidget;
  @override
  void initState() {
    // print(widget.data.toString());
    _tabController = TabController(length: 6, vsync: this);
    _currentWidget = UserInformation(UserData(
        id: widget.data['id'],
        accountCreated: widget.data['account_created'],
        email: widget.data['email'],
        mfa: widget.data['mfa_authentication'],
        hasNitro: widget.data['has_nitro'],
        phone: widget.data['phone'],
        verified: widget.data['verified']));
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

//
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipOval(
                child: Image.network(
              widget.data["avatar"],
              fit: BoxFit.contain,
              height: 40,
              width: 40,
            )),
            SizedBox(
              width: 10,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: widget.data["username"].toString().split("#")[0],
                  style: GoogleFonts.jetBrainsMono(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
              TextSpan(
                  text: "#" + widget.data["username"].toString().split("#")[1],
                  style: GoogleFonts.jetBrainsMono(
                      color: accentColor1, fontSize: 30))
            ])),
          ],
        ),
        bottom: TabBar(
          indicatorColor: accentColor1,
          labelStyle: GoogleFonts.jetBrainsMono(color: Colors.white),
          indicatorSize: TabBarIndicatorSize.tab,
          controller: _tabController,
          onTap: (index) {
            switch (index) {
              case 0:
                setState(() {
                  _currentWidget = UserInformation(UserData(
                      id: widget.data['id'],
                      accountCreated: widget.data['account_created'],
                      email: widget.data['email'],
                      mfa: widget.data['mfa_authentication'],
                      hasNitro: widget.data['has_nitro'],
                      phone: widget.data['phone'],
                      verified: widget.data['verified']));
                });
                break;
              case 5:
                setState(() {
                  _currentWidget =
                      FriendsList(widget.data['relationships'].map((e) {
                    return Friend(
                        id: e['id'],
                        username: e['username'],
                        avatar: e['avatar'],
                        type: e['type']);
                  }).toList());
                });
                break;
              default:
                setState(() {
                  _currentWidget = UserInformation(UserData(
                      id: widget.data['id'],
                      accountCreated: widget.data['account_created'],
                      email: widget.data['email'],
                      mfa: widget.data['mfa_authentication'],
                      hasNitro: widget.data['has_nitro'],
                      phone: widget.data['phone'],
                      verified: widget.data['verified']));
                });
            }
          },
          tabs: [
            Tab(
              text: "User Info",
              icon: Icon(
                Feather.user,
                color: accentColor1,
              ),
            ),
            Tab(
              text: "Nitro Status",
              icon: Icon(
                AntDesign.rocket1,
                color: accentColor1,
              ),
            ),
            Tab(
              text: "Billing",
              icon: Icon(
                Feather.credit_card,
                color: accentColor1,
              ),
            ),
            Tab(
              text: "Connected Accounts",
              icon: Icon(
                Feather.share_2,
                color: accentColor1,
              ),
            ),
            Tab(
              text: "Premium Guilds",
              icon: Icon(
                Feather.zap,
                color: accentColor1,
              ),
            ),
            Tab(
              text: "Friends",
              icon: Icon(
                Feather.facebook,
                color: accentColor1,
              ),
            ),
          ],
        ),
      ),
      body: _currentWidget,
    );
  }
}
