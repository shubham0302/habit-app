// ignore_for_file: file_names
import 'package:get/route_manager.dart';

class LocalString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        // English
        'en_US': {'plannarize': 'Plannarize', 'lang': ' Change Language'},

        // hindi
        'hi_IN': {'plannarize': 'योजना बनाना', 'lang': 'भाषा'},
        //kannada
        'kn_IN': {'plannarize': 'ಯೋಜಿಸಿ', 'lang': 'ಭಾಷೆ'}
      };
}
