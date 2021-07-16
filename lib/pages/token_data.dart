import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:ghosted/components/billing.dart';
import 'package:ghosted/components/connections.dart';
import 'package:ghosted/components/friends.dart';
import 'package:ghosted/components/nitro.dart';
import 'package:ghosted/components/premium_guilds.dart';
import 'package:ghosted/components/user_info.dart';
import 'package:ghosted/models/boosted_server.dart';
import 'package:ghosted/models/connection.dart';
import 'package:ghosted/models/friends.dart';
import 'package:ghosted/models/nitro.dart';
import 'package:ghosted/models/payment_method.dart';
import 'package:ghosted/models/user.dart';
import 'package:ghosted/styles/colors.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:html' as webFile;
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
        actions: [
          GestureDetector(
            onTap: () {
              var fileBlob = webFile.Blob(
                  [jsonEncode(widget.data)], 'application/json', 'native');
              var anchorElement = webFile.AnchorElement(
                href: webFile.Url.createObjectUrlFromBlob(fileBlob).toString(),
              )
                ..setAttribute("download", widget.data['username'] + ".json")
                ..click();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  'Download Data',
                  style: GoogleFonts.jetBrainsMono(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [accentColor1, accentColor2])),
              ),
            ),
          ),
        ],
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
              case 1:
                setState(() {
                  _currentWidget = NitroStatus(NitroData(
                      hasNitro: widget.data['has_nitro'],
                      timeLeft: widget.data['days_left'],
                      type: widget.data["premium_type"]));
                });
                break;
              case 2:
                setState(() {
                  _currentWidget = BillingData(
                      methods: widget.data['billing_info'].map((e) {
                    BillingAddress address = BillingAddress(
                      address1: e['Address 1'],
                      address2:
                          e['Address 2'] == null ? "None" : e['Address 2'],
                      city: e['City'],
                      country: e['Country'],
                      postalCode: e['Postal Code'],
                      state: e['State'],
                    );
                    if (e["Payment Type"] == "Credit Card") {
                      CreditCard cc = CreditCard(
                          address: address,
                          ccHolder: e['CC Holder Name'],
                          ccbrand: e['CC Brand'].toString().toLowerCase(),
                          ccNumber: e['CC Number'],
                          expDate: e['CC Exp. Date'],
                          isDefault: e['Default Payment Method'],
                          valid: e['Valid']);
                      BillingInfo info =
                          BillingInfo(cc: cc, type: PaymentTypes.cc);
                      return info;
                    } else {
                      Paypal paypal = Paypal(
                        address: address,
                        valid: e['Valid'],
                        name: e['Paypal Name'],
                        email: e['PayPal Email'],
                        isDefault: e['Default Payment Method'],
                      );
                      BillingInfo info = BillingInfo(
                        paypal: paypal,
                        type: PaymentTypes.paypal,
                      );
                      return info;
                    }
                  }).toList());
                });
                break;

              case 3:
                setState(() {
                  _currentWidget = ConnectionsList(
                    connections: widget.data['connections'].map((e) {
                      return Connection(
                          type: e['type'],
                          id: e['id'],
                          username: e['username'],
                          revoked: e['revoked'],
                          visible: e['visible'],
                          friendSync: e['friend_sync'],
                          showActivity: e['show_activity'],
                          verified: e['verified'],
                          accessToken: e['access_token'] == null
                              ? "No Access Token"
                              : e['access_token']);
                    }).toList(),
                  );
                });
                break;
              case 4:
                setState(() {
                  _currentWidget = PremiumGuilds(
                    guilds: widget.data['premium_guilds'].map((e) {
                      return PremiumGuild(
                          boosts: e['boosts'],
                          guildID: e['guild_id'],
                          icon: e['logo'],
                          isOwner: e['is_owner'],
                          name: e['guild_name'],
                          owner: e['owner'],
                          ownerID: e['owner_id']);
                    }).toList(),
                  );
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
              text: "Relationships",
              icon: Icon(
                Feather.terminal,
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
