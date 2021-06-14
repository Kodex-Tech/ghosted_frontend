import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ghosted/models/boosted_server.dart';
import 'package:ghosted/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumGuildTile extends StatelessWidget {
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

  const PremiumGuildTile({@required this.guild});
  final PremiumGuild guild;

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
          this.guild.isOwner
              ? Icon(
                  Icons.money,
                  color: Colors.green,
                )
              : SizedBox(),
          this.guild.isOwner
              ? SizedBox(
                  width: 10,
                )
              : SizedBox(),
          ClipOval(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: getPfp(this.guild.icon)),
          SizedBox(
            width: 10,
          ),
          SelectableText(
            this.guild.name,
            style: GoogleFonts.jetBrainsMono(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline),
          ),
          SizedBox(
            width: 10,
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(
                text: this.guild.owner.split("#")[0],
                style: GoogleFonts.jetBrainsMono(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
            TextSpan(
                text: "#" + this.guild.owner.split("#")[1],
                style: GoogleFonts.jetBrainsMono(
                    color: accentColor1, fontSize: 14))
          ])),
          SizedBox(
            width: 20,
          ),
          Row(
            children: [
              SelectableText(
                "x" + this.guild.boosts.toString(),
                style: GoogleFonts.jetBrainsMono(
                    color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                width: 2,
              ),
              Icon(
                AntDesign.rocket1,
                color: accentColor1,
              )
            ],
          ),
          Expanded(child: SizedBox()),
          IconButton(
              tooltip: "Copy Username",
              icon: Icon(
                Feather.copy,
                color: accentColor1,
              ),
              onPressed: () async {
                FlutterClipboard.copy(this.guild.guildID).then((value) {
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
                        "Copied Guild ID",
                        style: GoogleFonts.jetBrainsMono(color: Colors.white),
                      )));
                });
              }),
        ],
      ),
    );
  }
}

class PremiumGuilds extends StatefulWidget {
  List<dynamic> guilds;
  PremiumGuilds({
    @required this.guilds,
  });

  @override
  _PremiumGuildsState createState() => _PremiumGuildsState();
}

class _PremiumGuildsState extends State<PremiumGuilds> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.guilds.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: PremiumGuildTile(
              guild: widget.guilds[i],
            ),
          );
        });
  }
}
