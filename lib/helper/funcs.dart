import 'package:share/share.dart';


class funs {
  static Future<void> shareLink(String Link) async {
    Share.share('check out $Link');
  }

}