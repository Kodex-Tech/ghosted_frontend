import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ghosted/models/friends.dart';
import 'package:ghosted/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:clipboard/clipboard.dart';

const Map<String, Widget> relation_types = {
  "1": FriendTag(),
  "2": BlockedTag(),
  "3": IncomingRequest(),
  "4": OutgoingRequest()
};

class FriendTag extends StatelessWidget {
  const FriendTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: discordGreen.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      height: 40,
      width: 135,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Feather.user_check,
            color: discordGreen.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Friend",
                style: GoogleFonts.jetBrainsMono(
                  color: discordGreen.withOpacity(0.87),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BlockedTag extends StatelessWidget {
  const BlockedTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: discordRed.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      height: 40,
      width: 135,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Feather.user_x,
            color: discordRed.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Blocked",
                style: GoogleFonts.jetBrainsMono(
                  color: discordRed.withOpacity(0.87),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OutgoingRequest extends StatelessWidget {
  const OutgoingRequest();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: discordYellow.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      height: 40,
      width: 135,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Feather.arrow_right,
            color: discordYellow.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Outgoing",
                style: GoogleFonts.jetBrainsMono(
                  color: discordYellow.withOpacity(0.87),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class IncomingRequest extends StatelessWidget {
  const IncomingRequest();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: discordFuchsia.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      height: 40,
      width: 135,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Feather.arrow_left,
            color: discordFuchsia.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Incoming",
                style: GoogleFonts.jetBrainsMono(
                  color: discordFuchsia.withOpacity(0.87),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class FriendTile extends StatelessWidget {
  static double _size = 35.0;
  Image getPfp(String avatar) {
    if (avatar.endsWith("None.png")) {
      return Image.asset(
        "assets/default.jpg",
        height: _size,
        width: _size,
      );
    } else {
      return Image.network(
        avatar,
        height: _size,
        width: _size,
      );
    }
  }

  const FriendTile(this.friend);
  final Friend friend;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      height: 50,
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
      ),
      child: Row(
        children: [
          ClipOval(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: getPfp(this.friend.avatar)),
          SizedBox(
            width: 10,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: this.friend.username.split("#")[0],
                style: GoogleFonts.jetBrainsMono(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: "#" + this.friend.username.split("#")[1],
                style: GoogleFonts.jetBrainsMono(
                    color: accentColor1, fontSize: 14))
          ])),
          Transform.scale(
              scale: 0.75, child: relation_types[this.friend.type.toString()]),
          Expanded(child: SizedBox()),
          IconButton(
              tooltip: "Copy Username",
              icon: Icon(
                Feather.copy,
                color: accentColor1,
              ),
              onPressed: () async {
                FlutterClipboard.copy(this.friend.username).then((value) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      backgroundColor: secondaryColor,
                      duration: Duration(seconds: 3),
                      elevation: 2.0,
                      action: SnackBarAction(
                        label: "Dismiss",
                        onPressed: () {
                          ScaffoldMessenger.of(context).hideCurrentSnackBar();
                        },
                      ),
                      content: Text(
                        "Copied Username",
                        style: GoogleFonts.jetBrainsMono(color: Colors.white),
                      )));
                });
              }),
        ],
      ),
    );
  }
}

class FriendsList extends StatefulWidget {
  List<dynamic> friends = [];

  FriendsList(this.friends);
  @override
  _FriendsListState createState() => _FriendsListState();
}

class _FriendsListState extends State<FriendsList> {
  ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.friends.length == 0) {
      return Container(
        child: Center(
          child: Text(
            "No Friends\nLonely Person",
            style: GoogleFonts.jetBrainsMono(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Container(
          child: Scrollbar(
            controller: _scrollController,
            radius: Radius.circular(50.0),
            child: ListView.builder(
              itemBuilder: (context, i) {
                return FriendTile(widget.friends[i]);
              },
              itemCount: widget.friends.length,
            ),
          ),
        ),
      );
    }
  }
}
