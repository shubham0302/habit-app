import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:habbit_app/controllers/theme_controller.dart';
import 'package:path/path.dart';

class ColorSchemeData {
  ThemeController themeController = Get.put(ThemeController(), permanent: true);
  static Map<String, Color> defaultBrightColors = {
    'primaryText': Colors.black,
    'secondaryText': Colors.grey.shade800,
    'backgroundColor': Colors.white,
  };
  static Map<String, Color> defaultDarkColors = {
    'primaryText': Colors.white,
    'secondaryText': Colors.grey,
    'backgroundColor': const Color(0xff151515),
  };
  static Map<String, Map<String, Color>> themeData = {
    'free1': {
      "primaryColor": const Color(0xFFCF3A64),
      "lightPrimary": const Color(0xFFCF3A64),
      "backgroundColor": const Color(0xFFFFF6F9)
      // "backgroundColor": const C
    },
    'free2': {
      "primaryColor": const Color(0xFFDC6731),
      "lightPrimary": const Color(0xFFDC6731),
      "backgroundColor": const Color(0xFFFFF8F5)
    },
    'free3': {
      "primaryColor": const Color(0xFF259BB3),
      "lightPrimary": const Color(0xFF259BB3),
    },
    'free4': {
      "primaryColor": const Color(0xFF9138C6),
      "lightPrimary": const Color(0xFF9138C6),
    },
    'premium1': {
      "primaryColor": const Color(0xFFCA2C2B),
      "lightPrimary": const Color(0xFFCA2C2B),
    },
    'premium2': {
      "primaryColor": const Color(0xFFE48068),
      "lightPrimary": const Color(0xFFE48068),
    },
    'premium3': {
      "primaryColor": const Color(0xFFEC9E29),
      "lightPrimary": const Color(0xFFEC9E29),
    },
    'premium4': {
      "primaryColor": const Color(0xFF23A84B),
      "lightPrimary": const Color(0xFF23A84B),
    },
    'premium5': {
      "primaryColor": const Color(0xFF29A792),
      "lightPrimary": const Color(0xFF29A792),
    },
    'premium6': {
      "primaryColor": const Color(0xFF7347D2),
      "lightPrimary": const Color(0xFF7347D2),
    },
    'premium7': {
      "primaryColor": const Color(0xFFDC3250),
      "lightPrimary": const Color(0xFFDC3250),
    },
    'premium8': {
      "primaryColor": const Color(0xFFD65842),
      "lightPrimary": const Color(0xFFD65842),
    },
    'premium9': {
      "primaryColor": const Color(0xFFB58B2C),
      "lightPrimary": const Color(0xFFB58B2C),
    },
    'premium10': {
      "primaryColor": const Color(0xFF23A873),
      "lightPrimary": const Color(0xFF23A873),
    },
    'premium11': {
      "primaryColor": const Color(0xFF319DC4),
      "lightPrimary": const Color(0xFF319DC4),
    },
    'premium12': {
      "primaryColor": const Color(0xFF7A6698),
      "lightPrimary": const Color(0xFF7A6698),
    },
    'premium13': {
      "primaryColor": const Color(0xFFD65D66),
      "lightPrimary": const Color(0xFFD65D66),
    },
    'premium14': {
      "primaryColor": const Color(0xFFAC5365),
      "lightPrimary": const Color(0xFFAC5365),
    },
    'premium15': {
      "primaryColor": const Color(0xFF7A9303),
      "lightPrimary": const Color(0xFF7A9303),
    },
    'premium16': {
      "primaryColor": const Color(0xFF588D59),
      "lightPrimary": const Color(0xFF588D59),
    },
    'premium17': {
      "primaryColor": const Color(0xFF557085),
      "lightPrimary": const Color(0xFF557085),
    },
    'premium18': {
      "primaryColor": const Color(0xFF846B66),
      "lightPrimary": const Color(0xFF846B66),
    },
    'premium19': {
      "primaryColor": const Color(0xFF712DB8),
      "lightPrimary": const Color(0xFFCA387F),
    },
    'premium20': {
      "primaryColor": const Color(0xFFD8615E),
      "lightPrimary": const Color(0xFF30A873),
    },
    'premium21': {
      "primaryColor": const Color(0xFF457B8D),
      "lightPrimary": const Color(0xFFE25E4B),
    },
    'premium22': {
      "primaryColor": const Color(0xFF24A88F),
      "lightPrimary": const Color(0xFF7F4CD3),
    },
    'premium23': {
      "primaryColor": const Color(0xFFCB7E2D),
      "lightPrimary": const Color(0xFFBE5C60),
    },
    'premium24': {
      "primaryColor": const Color(0xFFDA4D5D),
      "lightPrimary": const Color(0xFF35A39C),
    },
    'premium25': {
      "primaryColor": const Color(0xFF7C6C93),
      "lightPrimary": const Color(0xFFB47172),
    },
    'premium26': {
      "primaryColor": const Color(0xFF96714D),
      "lightPrimary": const Color(0xFF548B52),
    },
    'premium27': {
      "primaryColor": const Color(0xFFB49562),
      "lightPrimary": const Color(0xFF448A80),
    },
  };
  static Map<String, Map<String, Color>> darkThemeData = {
    'free1': {
      "primaryColor": const Color(0xFFCD3A64),
      "lightPrimary": const Color(0xFFCD3A64),
      // "lightbackgroung": const Color(0xFFFFF3F7)
      // "backgroundColor": const C
    },
    'free2': {
      "primaryColor": const Color(0xFFDB6832),
      "lightPrimary": const Color(0xFFDB6832),
    },
    'free3': {
      "primaryColor": const Color(0xFF239CAD),
      "lightPrimary": const Color(0xFF239CAD),
    },
    'free4': {
      "primaryColor": const Color(0xFF9039C6),
      "lightPrimary": const Color(0xFF9039C6),
    },
    'premium1': {
      "primaryColor": const Color(0xFFCA2C2B),
      "lightPrimary": const Color(0xFFCA2C2B),
    },
    'premium2': {
      "primaryColor": const Color(0xFFE48068),
      "lightPrimary": const Color(0xFFE48068),
    },
    'premium3': {
      "primaryColor": const Color(0xFFE7A127),
      "lightPrimary": const Color(0xFFE7A127),
    },
    'premium4': {
      "primaryColor": const Color(0xFF25A84B),
      "lightPrimary": const Color(0xFF25A84B),
    },
    'premium5': {
      "primaryColor": const Color(0xFF29A792),
      "lightPrimary": const Color(0xFF29A792),
    },
    'premium6': {
      "primaryColor": const Color(0xFF7347D2),
      "lightPrimary": const Color(0xFF7347D2),
    },
    'premium7': {
      "primaryColor": const Color(0xFFDE304E),
      "lightPrimary": const Color(0xFFDE304E),
    },
    'premium8': {
      "primaryColor": const Color(0xFFD55842),
      "lightPrimary": const Color(0xFFD55842),
    },
    'premium9': {
      "primaryColor": const Color(0xFFB78A2D),
      "lightPrimary": const Color(0xFFB78A2D),
    },
    'premium10': {
      "primaryColor": const Color(0xFF27A575),
      "lightPrimary": const Color(0xFF27A575),
    },
    'premium11': {
      "primaryColor": const Color(0xFF319CC7),
      "lightPrimary": const Color(0xFF319CC7),
    },
    'premium12': {
      "primaryColor": const Color(0xFF7A6699),
      "lightPrimary": const Color(0xFF7A6699),
    },
    'premium13': {
      "primaryColor": const Color(0xFFD65D66),
      "lightPrimary": const Color(0xFFD65D66),
    },
    'premium14': {
      "primaryColor": const Color(0xFFAE5265),
      "lightPrimary": const Color(0xFFAE5265),
    },
    'premium15': {
      "primaryColor": const Color(0xFF7A9301),
      "lightPrimary": const Color(0xFF7A9301),
    },
    'premium16': {
      "primaryColor": const Color(0xFF5B8B59),
      "lightPrimary": const Color(0xFF5B8B59),
    },
    'premium17': {
      "primaryColor": const Color(0xFF547085),
      "lightPrimary": const Color(0xFF547085),
    },
    'premium18': {
      "primaryColor": const Color(0xFF836B65),
      "lightPrimary": const Color(0xFF836B65),
    },
    'premium19': {
      "primaryColor": const Color(0xFF722DB7),
      "lightPrimary": const Color(0xFFCB377C),
    },
    'premium20': {
      "primaryColor": const Color(0xFFDB6059),
      "lightPrimary": const Color(0xFF29A971),
    },
    'premium21': {
      "primaryColor": const Color(0xFF497B89),
      "lightPrimary": const Color(0xFFDC603F),
    },
    'premium22': {
      "primaryColor": const Color(0xFF20A996),
      "lightPrimary": const Color(0xFF7845D0),
    },
    'premium23': {
      "primaryColor": const Color(0xFFC9802A),
      "lightPrimary": const Color(0xFFD45C58),
    },
    'premium24': {
      "primaryColor": const Color(0xFFD94D60),
      "lightPrimary": const Color(0xFF35A39A),
    },
    'premium25': {
      "primaryColor": const Color(0xFF7B6C93),
      "lightPrimary": const Color(0xFFB47371),
    },
    'premium26': {
      "primaryColor": const Color(0xFF95714D),
      "lightPrimary": const Color(0xFF568C52),
    },
    'premium27': {
      "primaryColor": const Color(0xFFB39468),
      "lightPrimary": const Color(0xFF48887C),
    },
  };
}
