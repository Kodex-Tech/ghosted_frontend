import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:ghosted/pages/token_data.dart';
import 'package:ghosted/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter_particles/particles.dart';

class HomePage extends StatefulWidget {
  HomePage();

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _busy = false;
  ScrollController _scrollController;
  TextEditingController _tokenController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _tokenController = TextEditingController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tokenController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Scrollbar(
          controller: _scrollController,
          child: Stack(
            children: [
              Particles(80, accentColor1),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ghosted",
                          style: GoogleFonts.jetBrainsMono(
                              fontSize: 45, color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Lookup Discord Account Data using tokens",
                          textAlign: TextAlign.center,
                          softWrap: true,
                          style: GoogleFonts.jetBrainsMono(
                              fontSize: 25, color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 800,
                          child: TextField(
                            maxLines: 1,
                            autocorrect: false,
                            cursorColor: Colors.white,
                            autofocus: true,
                            decoration: InputDecoration(
                              fillColor: secondaryColor,
                              hintText: "User Token",
                              hintStyle: GoogleFonts.jetBrainsMono(
                                  color: Colors.white.withOpacity(0.5)),
                              focusColor: secondaryColor,
                              hoverColor: secondaryColor,
                              filled: true,
                            ),
                            controller: _tokenController,
                            keyboardType: TextInputType.text,
                            style:
                                GoogleFonts.jetBrainsMono(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () async {
                        setState(() {
                          _busy = true;
                        });
                        final res = await http.get(Uri.parse(
                            "https://ghosted-api.herokuapp.com/api/token?token=${_tokenController.text.trim()}"));
                        if (res.statusCode == 200) {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      TokenData(data: jsonDecode(res.body))));
                        } else if (res.statusCode == 401) {
                          AwesomeDialog(
                            width: 500,
                            isDense: true,
                            context: context,
                            aligment: Alignment.center,
                            animType: AnimType.TOPSLIDE,
                            autoHide: Duration(seconds: 3),
                            dialogType: DialogType.ERROR,
                            title: "Invalid Token",
                            desc:
                                "This token is invalid , check it and try again",
                          ).show();
                        }

                        setState(() {
                          _busy = false;
                        });
                      },
                      child: Container(
                        width: 250,
                        alignment: Alignment.center,
                        height: 50,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [accentColor1, accentColor2]),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: !_busy
                            ? Text(
                                "Lookup Token",
                                style: GoogleFonts.jetBrainsMono(
                                    color: Colors.white, fontSize: 20),
                              )
                            : Container(
                                width: 25,
                                height: 25,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  strokeWidth: 2,
                                ),
                              ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

/*

Container(
                                    alignment: Alignment.center,
                                    height: 30,
                                    width: 300,
                                    decoration: BoxDecoration(
                                        color: redColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0))),
                                    child: Text(
                                      "Close",
                                      style: GoogleFonts.jetBrainsMono(
                                          color: Colors.white, fontSize: 18),
                                    ),
                                  ),
*/