import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter/material.dart';

const Map<String, String> languages = {
  'da': 'Danish, Denmark',
  'de': 'German, Germany',
  'en-GB': 'English, United Kingdom',
  'en-US': 'English, United States',
  'es-ES': 'Spanish, Spain',
  'fr': 'French, France',
  'hr': 'Croatian, Croatia',
  'lt': 'Lithuanian, Lithuania',
  'hu': 'Hungarian, Hungary',
  'nl': 'Dutch, Netherlands',
  'no': 'Norwegian, Norway',
  'pl': 'Polish, Poland',
  'pt-BR': 'Portuguese, Brazilian, Brazil',
  'ro': 'Romanian, Romania',
  'fi': 'Finnish, Finland',
  'sv-SE': 'Swedish, Sweden',
  'vi': 'Vietnamese, Vietnam',
  'tr': 'Turkish, Turkey',
  'cs': 'Czech, Czechia, Czech Republic',
  'el': 'Greek, Greece',
  'bg': 'Bulgarian, Bulgaria',
  'ru': 'Russian, Russia',
  'uk': 'Ukranian, Ukraine',
  'th': 'Thai, Thailand',
  'zh-CN': 'Chinese, China',
  'ja': 'Japanese',
  'zh-TW': 'Chinese, Taiwan',
  'ko': 'Korean, Korea'
};
const Map<String, String> cc_digits = {
  'american express': '3',
  'visa': '4',
  'mastercard': '5'
};
const Map<String, String> nitro_types = {
  "0": "No Nitro",
  "1": "Nitro Classic",
  "2": "Nitro Regular"
};

const Map<String, IconData> paymentIcon = {
  "visa": FontAwesome.cc_visa,
  "mastercard": FontAwesome.cc_mastercard,
  "paypal": FontAwesome.paypal,
  "american_express": FontAwesome.cc_amex
};

Map<String, IconData> connectionIcons = {
  "spotify": FontAwesome.spotify,
  "reddit": FontAwesome.reddit,
  "steam": FontAwesome.steam,
  "battle_net": Feather.share,
  "facebook": FontAwesome.facebook,
  "youtube": FontAwesome.youtube_play,
  "twitch": FontAwesome.twitch,
  "twitter": FontAwesome.twitter,
  "xbox": Icons.close,
  "github": FontAwesome.github
};
