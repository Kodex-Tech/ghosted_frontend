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
      width: 100,
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

class MFATag extends StatelessWidget {
  const MFATag();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: discordGreen.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      height: 40,
      width: 140,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.lock,
            color: discordGreen.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "MFA Enabled",
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
        padding: EdgeInsets.only(left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Icon(
                  Feather.mail,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                SelectableText(widget.userData.email,
                    style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Feather.phone,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                SelectableText(
                    widget.userData.phone == null
                        ? "No Number"
                        : widget.userData.phone,
                    style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  AntDesign.idcard,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                SelectableText(widget.userData.id,
                    style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Feather.clock,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                SelectableText(widget.userData.accountCreated,
                    style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            widget.userData.verified ? VerifiedTag() : UnVerifiedTag(),
            widget.userData.verified
                ? SizedBox(
                    height: 10,
                  )
                : SizedBox(),
            widget.userData.mfa ? MFATag() : SizedBox(),
            widget.userData.mfa
                ? SizedBox(
                    height: 10,
                  )
                : SizedBox(height: 10),
            widget.userData.hasNitro ? NitroTag() : SizedBox()
          ],
        ));
  }
}
