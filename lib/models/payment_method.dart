import 'package:flutter/cupertino.dart';

enum PaymentTypes { cc, paypal }

class BillingAddress {
  const BillingAddress({
    @required this.address1,
    @required this.address2,
    @required this.city,
    @required this.postalCode,
    @required this.state,
    @required this.country,
  });
  final String address1;
  final String address2;
  final String city;
  final String postalCode;
  final String state;
  final String country;
}

class CreditCard {
  const CreditCard({
    @required this.address,
    @required this.valid,
    @required this.ccNumber,
    @required this.ccHolder,
    @required this.expDate,
    @required this.ccbrand,
    @required this.isDefault,
  });
  final bool valid;
  final String ccbrand;
  final String ccNumber;
  final String expDate;
  final bool isDefault;
  final String ccHolder;
  final BillingAddress address;
}

class Paypal {
  const Paypal({
    @required this.address,
    @required this.valid,
    @required this.name,
    @required this.email,
    @required this.isDefault,
  });
  final bool valid;
  final String name;
  final String email;
  final bool isDefault;
  final BillingAddress address;
}

class BillingInfo {
  BillingInfo({@required this.type, this.cc, this.paypal});
  PaymentTypes type;
  Paypal paypal;
  CreditCard cc;
}
