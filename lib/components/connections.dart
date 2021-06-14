import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ghosted/models/connection.dart';
import 'package:ghosted/models/constants.dart';
import 'package:ghosted/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ConnectionCard extends StatefulWidget {
  const ConnectionCard({
    @required this.connection,
  });
  final Connection connection;
  @override
  _ConnectionCardState createState() => _ConnectionCardState();
}

class _ConnectionCardState extends State<ConnectionCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      child: Column(
        children: [
          Row(
            children: [
              Icon(
                connectionIcons[widget.connection.type],
                size: 50,
                color: Colors.white,
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
// TODO: Tags
          // Row(
          //   children: [
          //     widget.connection.verified ? ValidTag() : InvalidTag(),
          //     SizedBox(
          //       width: 10,
          //     ),
          //     widget.info.cc.isDefault ? DefaultTag() : SizedBox()
          //   ],
          // ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              SelectableText(
                widget.connection.username,
                style: GoogleFonts.jetBrainsMono(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              SelectableText(
                widget.connection.id,
                style: GoogleFonts.jetBrainsMono(
                    color: Colors.white,
                    fontSize: 16,
                    decoration: TextDecoration.underline),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: SelectableText(
              widget.connection.accessToken == null
                  ? "No Access Token"
                  : widget.connection.accessToken,
              style: GoogleFonts.jetBrainsMono(
                  color: Colors.white,
                  fontSize: 16,
                  decoration: TextDecoration.underline),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              widget.connection.visible == 1 ? VisibleTag() : HiddenTag(),
              widget.connection.visible == 1
                  ? SizedBox(
                      width: 10,
                    )
                  : SizedBox(),
              widget.connection.verified ? VerifiedTag() : UnVerifiedTag(),
            ],
          )
        ],
      ),
    );
  }
}

class ConnectionsList extends StatefulWidget {
  const ConnectionsList({@required this.connections});
  final List<dynamic> connections;

  @override
  _ConnectionsListState createState() => _ConnectionsListState();
}

class _ConnectionsListState extends State<ConnectionsList> {
  @override
  Widget build(BuildContext context) {
    if (widget.connections.length == 0) {
      return Text("No Connections");
    }
    return ListView.builder(
        itemCount: widget.connections.length,
        addAutomaticKeepAlives: true,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: ConnectionCard(
              connection: widget.connections[i],
            ),
          );
        });
  }
}

class VisibleTag extends StatelessWidget {
  const VisibleTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: discordGreen.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      height: 40,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AntDesign.eye,
            color: discordGreen.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Visible",
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

class HiddenTag extends StatelessWidget {
  const HiddenTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: discordRed.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      height: 40,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AntDesign.eye,
            color: discordRed.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Hidden",
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

class VerifiedTag extends StatelessWidget {
  const VerifiedTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: discordGreen.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      height: 40,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AntDesign.checkcircle,
            color: discordGreen.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Valid",
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

class UnVerifiedTag extends StatelessWidget {
  const UnVerifiedTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: discordRed.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      height: 40,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AntDesign.closecircle,
            color: discordRed.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Valid",
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
