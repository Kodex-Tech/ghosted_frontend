import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ghosted/models/constants.dart';
import 'package:ghosted/models/nitro.dart';
import 'package:google_fonts/google_fonts.dart';

class NitroStatus extends StatefulWidget {
  const NitroStatus(this.nitroData);
  final NitroData nitroData;

  @override
  _NitroStatusState createState() => _NitroStatusState();
}

class _NitroStatusState extends State<NitroStatus> {
  @override
  Widget build(BuildContext context) {
    if (!widget.nitroData.hasNitro) {
      return Container(
        padding: EdgeInsets.only(left: 20),
        child: Center(
          child: Text(
            "No Nitro",
            style: GoogleFonts.jetBrainsMono(color: Colors.white),
          ),
        ),
      );
    } else {
      return Container(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.asset("assets/nitro_cut_dribble.gif"))
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  AntDesign.rocket1,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 10,
                ),
                SelectableText(nitro_types[widget.nitroData.type.toString()],
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Feather.clock,
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(
                  width: 10,
                ),
                SelectableText(
                    widget.nitroData.timeLeft.toString() + " Days left",
                    style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24)),
              ],
            )
          ],
        ),
      );
    }
  }
}
