import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ghosted/models/user.dart';
import 'package:ghosted/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NitroTag extends StatelessWidget {
  const NitroTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: discordFuchsia.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      height: 40,
      width: 120,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AntDesign.rocket1,
            color: discordFuchsia.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Nitro",
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
      width: 130,
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
                "Verified",
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
      width: 135,
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
                "UnVerified",
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

class UserInformation extends StatefulWidget {
  const UserInformation(this.userData);
  final UserData userData;

  @override
  _UserInformationState createState() => _UserInformationState();
}

class _UserInformationState extends State<UserInformation> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.userData.verified ? UnVerifiedTag() : SizedBox(),
    );
  }
}
