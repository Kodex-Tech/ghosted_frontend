import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:ghosted/models/constants.dart';
import 'package:ghosted/models/payment_method.dart';
import 'package:ghosted/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class BillingMethod extends StatefulWidget {
  BillingMethod({@required this.info});
  final BillingInfo info;

  @override
  _BillingMethodState createState() => _BillingMethodState();
}

class _BillingMethodState extends State<BillingMethod> {
  @override
  Widget build(BuildContext context) {
    return widget.info.type == PaymentTypes.cc
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      paymentIcon[widget.info.cc.ccbrand],
                      size: 50,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    widget.info.cc.valid ? ValidTag() : InvalidTag(),
                    SizedBox(
                      width: 10,
                    ),
                    widget.info.cc.isDefault ? DefaultTag() : SizedBox()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.cc.ccNumber,
                      style: GoogleFonts.jetBrainsMono(
                          color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.cc.ccHolder,
                      style: GoogleFonts.jetBrainsMono(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.cc.expDate,
                      style: GoogleFonts.jetBrainsMono(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Feather.map_pin,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.cc.address.address1,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.cc.address.address2,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.cc.address.city,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.cc.address.postalCode,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.cc.address.state,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.cc.address.country,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        // TODO: Bookmark
        : Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.all(Radius.circular(15.0))),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      paymentIcon['paypal'],
                      size: 50,
                      color: Colors.white,
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    widget.info.paypal.valid ? ValidTag() : InvalidTag(),
                    SizedBox(
                      width: 10,
                    ),
                    widget.info.paypal.isDefault ? DefaultTag() : SizedBox()
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.paypal.email,
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
                Row(
                  children: [
                    SelectableText(
                      widget.info.paypal.name,
                      style: GoogleFonts.jetBrainsMono(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Icon(
                      Feather.map_pin,
                      color: Colors.white,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.paypal.address.address1,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.paypal.address.address2,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.paypal.address.city,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.paypal.address.postalCode,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.paypal.address.state,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    SelectableText(
                      widget.info.paypal.address.country,
                      style: GoogleFonts.jetBrainsMono(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}

class ValidTag extends StatelessWidget {
  const ValidTag();

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

class InvalidTag extends StatelessWidget {
  const InvalidTag();

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(
            AntDesign.closecircle,
            color: discordRed.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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

class DefaultTag extends StatelessWidget {
  const DefaultTag();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: discordBlurple.withOpacity(0.1),
          borderRadius: BorderRadius.all(Radius.circular(50.0))),
      height: 40,
      width: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            AntDesign.checkcircle,
            color: discordBlurple.withOpacity(0.6),
          ),
          SizedBox(
            width: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Default",
                style: GoogleFonts.jetBrainsMono(
                  color: discordBlurple.withOpacity(0.87),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BillingData extends StatefulWidget {
  BillingData({@required this.methods});
  final List<dynamic> methods;
  @override
  _BillingDataState createState() => _BillingDataState();
}

class _BillingDataState extends State<BillingData> {
  @override
  Widget build(BuildContext context) {
    if (widget.methods.length == 0) {
      return Text("No Billing Methods");
    }
    return ListView.builder(
      addAutomaticKeepAlives: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: BillingMethod(info: widget.methods[i]),
        );
      },
      itemCount: widget.methods.length,
    );
  }
}
